from enum import Enum
from typing import List, Optional, Dict, Any
from pydantic import BaseModel, Field, UUID4
from datetime import datetime
import uuid

class ProcessingStatus(str, Enum):
    PENDING = "pending"
    PROCESSING = "processing"
    SUCCESS = "success"
    WARNING = "warning"
    ERROR = "error"

class DocumentMetadata(BaseModel):
    """Metadatos inmutables del documento base."""
    tenant_id: str
    source_path: str
    ingest_timestamp: datetime = Field(default_factory=datetime.utcnow)
    priority: str = "normal"
    security_level: str = "confidential"

class AgentResult(BaseModel):
    """Contrato de salida estándar para CUALQUIER agente (FS_01 a FS_24)."""
    agent_id: str
    status: ProcessingStatus
    execution_time_ms: int
    confidence_score: float = Field(..., ge=0.0, le=1.0)
    payload: Dict[str, Any] # Datos flexibles pero contenidos
    warnings: List[str] = []
    trace_id: str

class PipelineContext(BaseModel):
    """El 'Estado' que viaja a través del pipeline."""
    trace_id: str = Field(default_factory=lambda: str(uuid.uuid4()))
    document_id: str
    metadata: DocumentMetadata
    results: Dict[str, AgentResult] = {}
    
    def add_result(self, result: AgentResult):
        self.results[result.agent_id] = result