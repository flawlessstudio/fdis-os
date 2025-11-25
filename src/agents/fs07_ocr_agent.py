import time
from tenacity import retry, stop_after_attempt, wait_exponential
from src.core.interfaces import BaseAgent
from src.domain.models import PipelineContext, AgentResult, ProcessingStatus
from src.core.observability import logger

class FS07_OCRAgent(BaseAgent):
    def __init__(self):
        super().__init__(agent_id="FS_07")
        self.log = logger.bind(agent="FS_07")

    @retry(stop=stop_after_attempt(3), wait=wait_exponential(multiplier=1, min=4, max=10))
    def _run_ocr_engine(self, path: str) -> dict:
        """
        Simula la llamada a un motor OCR externo (AWS Textract / GCV / Tesseract).
        El decorador @retry hace que sea resiliente a fallos de red.
        """
        # Aquí iría la llamada real a boto3 o google-cloud-vision
        time.sleep(0.5) # Simulación de latencia
        return {
            "text_blocks": ["FDIS OS v2", "PureMind Enterprise"],
            "confidence": 0.985
        }

    def process(self, context: PipelineContext) -> AgentResult:
        start_time = time.time_ns()
        self.log.info("starting_ocr", trace_id=context.trace_id, doc=context.document_id)

        try:
            # 1. Lógica de negocio: Ejecución
            ocr_data = self._run_ocr_engine(context.metadata.source_path)
            
            # 2. Cálculo de métricas
            duration = (time.time_ns() - start_time) // 1_000_000
            
            # 3. Construcción de resultado robusto
            return AgentResult(
                agent_id=self.agent_id,
                status=ProcessingStatus.SUCCESS,
                execution_time_ms=duration,
                confidence_score=ocr_data["confidence"],
                payload={"extracted_text": ocr_data["text_blocks"]},
                trace_id=context.trace_id
            )

        except Exception as e:
            self.log.error("ocr_failed", error=str(e))
            return AgentResult(
                agent_id=self.agent_id,
                status=ProcessingStatus.ERROR,
                execution_time_ms=(time.time_ns() - start_time) // 1_000_000,
                confidence_score=0.0,
                payload={"error": str(e)},
                warnings=["ocr_engine_unreachable"],
                trace_id=context.trace_id
            )