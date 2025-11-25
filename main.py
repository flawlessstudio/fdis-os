import sys
import os

# Aseguramos que Python encuentre los módulos
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from src.core.observability import configure_logging
from src.domain.models import PipelineContext, DocumentMetadata
from src.orchestrator.engine import PipelineEngine

# Importar Agentes
from src.agents.fs01_ingest import FS01_IngestAgent
from src.agents.fs07_ocr_agent import FS07_OCRAgent
from src.agents.fs10_semantic import FS10_SemanticAgent
from src.agents.fs21_reconciliation import FS21_ConsistencyAgent
from src.agents.fs09_export import FS09_ExportAgent

def main():
    configure_logging()
    
    # --- DEFINICIÓN DEL PLAYBOOK (PIPELINE) ---
    # Orden lógico: Ingesta -> OCR -> Entendimiento -> Validación -> Exportación
    full_stack_pipeline = [
        FS01_IngestAgent(),          # 1. Validar y perfilar
        FS07_OCRAgent(),             # 2. Leer texto (Vision)
        FS10_SemanticAgent(),        # 3. Estructurar datos (NLP)
        FS21_ConsistencyAgent(),     # 4. Auditar datos (Math/Rules)
        FS09_ExportAgent()           # 5. Empaquetar salida
    ]
    
    engine = PipelineEngine(full_stack_pipeline)

    # --- SIMULACIÓN DE ENTRADA ---
    # Creamos un archivo dummy para que FS_01 no falle
    dummy_file = "invoice_test.pdf"
    with open(dummy_file, "wb") as f:
        f.write(b"%PDF-1.4 Dummy Content for Magic Bytes")

    doc_request = PipelineContext(
        document_id="INV-2024-X99",
        metadata=DocumentMetadata(
            tenant_id="enterprise_client_01",
            source_path=dummy_file,
            security_level="high"
        )
    )

    print(f"🚀 Starting FDIS PureMind processing for {doc_request.document_id}...\n")

    # --- EJECUCIÓN ---
    final_state = engine.run(doc_request)

    # --- RESULTADO ---
    export_agent = final_state.results.get("FS_09")
    
    if export_agent:
        print("\n✅ PROCESSING COMPLETE. Final Output:")
        import json
        print(json.dumps(export_agent.payload["export_json"], indent=2))
    else:
        print("\n❌ PROCESSING FAILED. Check logs.")

    # Limpieza
    if os.path.exists(dummy_file):
        os.remove(dummy_file)

if __name__ == "__main__":
    main()
