import sys
from src.core.observability import configure_logging
from src.domain.models import PipelineContext, DocumentMetadata
from src.agents.fs07_ocr import FS07_OCRAgent
from src.orchestrator.engine import PipelineEngine

# 1. Inicialización de Entorno
configure_logging()

def main():
    # 2. Configuración de Dependencias (Playbook 1: Simple OCR Flow)
    # Aquí podríamos añadir FS_01, FS_11, etc.
    agents_pipeline = [
        FS07_OCRAgent() 
    ]
    
    engine = PipelineEngine(agents_pipeline)

    # 3. Simulación de Entrada (Request)
    doc_request = PipelineContext(
        document_id="DOC-2024-X99",
        metadata=DocumentMetadata(
            tenant_id="acme_corp",
            source_path="s3://bucket/invoices/inv_001.pdf"
        )
    )

    # 4. Ejecución
    final_state = engine.run(doc_request)

    # 5. Salida (Response)
    # En un caso real, esto se serializa a JSON y se devuelve via API (FastAPI)
    print(f"\nFinal Status for {final_state.document_id}:")
    for agent_id, res in final_state.results.items():
        print(f" - {agent_id}: {res.status.value} (Conf: {res.confidence_score})")

if __name__ == "__main__":
    main()