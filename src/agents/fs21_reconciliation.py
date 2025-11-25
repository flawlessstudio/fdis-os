from datetime import datetime
from src.core.interfaces import BaseAgent
from src.domain.models import PipelineContext, AgentResult, ProcessingStatus
from src.core.observability import logger

class FS21_ConsistencyAgent(BaseAgent):
    def __init__(self):
        super().__init__(agent_id="FS_21")
        self.log = logger.bind(agent="FS_21")

    def process(self, context: PipelineContext) -> AgentResult:
        start_time = datetime.now()
        
        # Dependencia: FS_10 (Datos estructurados)
        semantic_result = context.results.get("FS_10")
        
        if not semantic_result or "structured_data" not in semantic_result.payload:
            return AgentResult(
                agent_id=self.agent_id,
                status=ProcessingStatus.WARNING, # No es error fatal, pero saltamos validación
                execution_time_ms=0,
                confidence_score=0.0,
                payload={"info": "Skipped validation due to missing data"},
                trace_id=context.trace_id
            )

        data = semantic_result.payload["structured_data"]
        
        # Validación de Reglas de Negocio (Mockup)
        # Regla: El monto no puede ser negativo
        amount = data.get("total_amount", 0) or 0
        is_valid = amount >= 0
        
        if is_valid:
            return AgentResult(
                agent_id=self.agent_id,
                status=ProcessingStatus.SUCCESS,
                execution_time_ms=5,
                confidence_score=1.0,
                payload={"validation_passed": True, "checks": ["non_negative_amount"]},
                trace_id=context.trace_id
            )
        else:
            return AgentResult(
                agent_id=self.agent_id,
                status=ProcessingStatus.ERROR, # Bloquea el proceso
                execution_time_ms=5,
                confidence_score=1.0, # Estamos 100% seguros de que falló
                payload={"validation_passed": False, "error": "Negative amount detected"},
                trace_id=context.trace_id
            )