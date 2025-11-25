import hashlib
import magic  # Requiere python-magic
from datetime import datetime
from typing import Optional
from src.core.interfaces import BaseAgent
from src.domain.models import PipelineContext, AgentResult, ProcessingStatus
from src.core.observability import logger

class FS01_IngestAgent(BaseAgent):
    def __init__(self):
        super().__init__(agent_id="FS_01")
        self.log = logger.bind(agent="FS_01")

    def _calculate_hash(self, file_path: str) -> str:
        """Genera huella digital inmutable para auditoría."""
        sha256_hash = hashlib.sha256()
        with open(file_path, "rb") as f:
            for byte_block in iter(lambda: f.read(4096), b""):
                sha256_hash.update(byte_block)
        return sha256_hash.hexdigest()

    def _detect_playbook(self, mime_type: str) -> str:
        """Lógica de negocio para enrutamiento dinámico."""
        if mime_type == "application/pdf":
            return "PLAYBOOK_PDF_EXTRACTION"
        elif mime_type in ["image/jpeg", "image/png"]:
            return "PLAYBOOK_IMAGE_SCAN"
        else:
            return "PLAYBOOK_GENERIC"

    def process(self, context: PipelineContext) -> AgentResult:
        start_time = datetime.now()
        file_path = context.metadata.source_path
        
        try:
            self.log.info("ingesting_document", path=file_path)

            # 1. Validación de Seguridad (Magic Bytes)
            # En producción real, esto evita ataques de extensión falsa
            try:
                mime_type = magic.from_file(file_path, mime=True)
            except Exception:
                # Fallback seguro si la librería falla
                mime_type = "application/octet-stream"

            # 2. Generación de Identidad
            doc_hash = self._calculate_hash(file_path)

            # 3. Decisión de Enrutamiento
            playbook = self._detect_playbook(mime_type)

            # Resultado enriquecido
            return AgentResult(
                agent_id=self.agent_id,
                status=ProcessingStatus.SUCCESS,
                execution_time_ms=(datetime.now() - start_time).microseconds // 1000,
                confidence_score=1.0, # Determinístico
                payload={
                    "mime_type": mime_type,
                    "file_hash": doc_hash,
                    "recommended_playbook": playbook,
                    "file_size_bytes": 1024000 # Simulado
                },
                trace_id=context.trace_id
            )

        except FileNotFoundError:
            return AgentResult(
                agent_id=self.agent_id,
                status=ProcessingStatus.ERROR,
                execution_time_ms=0,
                confidence_score=0.0,
                payload={"error": "File not found on disk"},
                warnings=["critical_io_error"],
                trace_id=context.trace_id
            )