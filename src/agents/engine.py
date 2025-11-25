from typing import List
from src.core.interfaces import BaseAgent
from src.domain.models import PipelineContext, ProcessingStatus
from src.core.observability import logger

class PipelineEngine:
    def __init__(self, agents: List[BaseAgent]):
        self.agents = agents
        self.log = logger.bind(component="orchestrator")

    def run(self, context: PipelineContext) -> PipelineContext:
        self.log.info("pipeline_start", trace_id=context.trace_id, doc_id=context.document_id)
        
        for agent in self.agents:
            # Ejecución de cada paso
            result = agent.process(context)
            context.add_result(result)
            
            # Lógica de control de flujo (Circuit Breaker)
            if result.status == ProcessingStatus.ERROR:
                self.log.error("pipeline_halted", agent=agent.get_id())
                break
                
        self.log.info("pipeline_finished", trace_id=context.trace_id)
        return context