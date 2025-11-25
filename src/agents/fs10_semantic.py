import re
from datetime import datetime
from src.core.interfaces import BaseAgent
from src.domain.models import PipelineContext, AgentResult, ProcessingStatus
from src.core.observability import logger

class FS10_SemanticAgent(BaseAgent):
    def __init__(self):
        super().__init__(agent_id="FS_10")
        self.log = logger.bind(agent="FS_10")

    def _normalize_date(self, raw_date: str) -> str:
        """Convierte fechas arbitrarias a ISO 8601. Vital para bases de datos."""
        # Implementación simplificada para demostración
        return raw_date.replace("/", "-") 

    def _extract_entities(self, text_blocks: list) -> dict:
        """Simula extracción de Entidades Nombradas (NER)."""
        extracted = {
            "invoice_id": None,
            "total_amount": None,
            "date": None
        }
        
        # Lógica heurística simple (en prod usaríamos Transformers/LLMs)
        for text in text_blocks:
            if "FACTURA" in text.upper():
                # Simulación de extracción de ID
                extracted["invoice_id"] = "F-2024-001"
            if "$" in text or "€" in text:
                 extracted["total_amount"] = 1500.00
            if "202" in text:
                extracted["date"] = self._normalize_date("2024-11-25")
                
        return extracted

    def process(self, context: PipelineContext) -> AgentResult:
        start_time = datetime.now()
        
        # Dependencia: Necesita que FS_07 haya corrido antes
        ocr_result = context.results.get("FS_07")
        
        if not ocr_result or ocr_result.status != ProcessingStatus.SUCCESS:
            return AgentResult(
                agent_id=self.agent_id,
                status=ProcessingStatus.ERROR,
                execution_time_ms=0,
                confidence_score=0.0,
                payload={"error": "Dependency FS_07 missing or failed"},
                trace_id=context.trace_id
            )

        raw_text_blocks = ocr_result.payload.get("extracted_text", [])
        entities = self._extract_entities(raw_text_blocks)
        
        # Calcular confianza basada en completitud de datos
        filled_fields = sum(1 for v in entities.values() if v is not None)
        total_fields = len(entities)
        semantic_score = filled_fields / total_fields if total_fields > 0 else 0.0

        return AgentResult(
            agent_id=self.agent_id,
            status=ProcessingStatus.SUCCESS,
            execution_time_ms=(datetime.now() - start_time).microseconds // 1000,
            confidence_score=semantic_score,
            payload={"structured_data": entities},
            warnings=["low_confidence_date"] if entities["date"] is None else [],
            trace_id=context.trace_id
        )