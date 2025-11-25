from abc import ABC, abstractmethod
from src.domain.models import PipelineContext, AgentResult

class BaseAgent(ABC):
    """
    Clase abstracta que define el comportamiento obligatorio de cualquier agente FDIS.
    """
    
    def __init__(self, agent_id: str):
        self.agent_id = agent_id

    @abstractmethod
    def process(self, context: PipelineContext) -> AgentResult:
        """
        Lógica core del agente. Debe ser implementada por cada subclase.
        Debe ser idempotente y pura (sin efectos secundarios ocultos).
        """
        pass

    def get_id(self) -> str:
        return self.agent_id