import json
from datetime import datetime
from src.core.interfaces import BaseAgent
from src.domain.models import PipelineContext, AgentResult, ProcessingStatus

class FS09_ExportAgent(BaseAgent):
    def __init__(self):
        super().__init__(agent_id="FS_09")

    def process(self, context: PipelineContext) -> AgentResult:
        start_time = datetime.now()
        
        # Recolectar datos finales de todos los agentes exitosos
        final_output = {
            "document_id": context.document_id,
            "processed_at": datetime.utcnow().isoformat(),
            "data": {},
            "metadata": {
                "security": context.metadata.security_level,
                "source": context.metadata.source_path
            },
            "quality_report": {}
        }

        # Mapeo de resultados
        if "FS_10" in context.results:
            final_output["data"] = context.results["FS_10"].payload.get("structured_data", {})
        
        # Reporte de calidad consolidado
        quality_score = 0.0
        count = 0
        for agent_id, result in context.results.items():
            final_output["quality_report"][agent_id] = {
                "status": result.status,
                "confidence": result.confidence_score
            }
            quality_score += result.confidence_score
            count += 1
            
        final_output["global_confidence"] = quality_score / count if count > 0 else 0.0

        return AgentResult(
            agent_id=self.agent_id,
            status=ProcessingStatus.SUCCESS,
            execution_time_ms=(datetime.now() - start_time).microseconds // 1000,
            confidence_score=1.0,
            payload={"export_json": final_output},
            trace_id=context.trace_id
        )