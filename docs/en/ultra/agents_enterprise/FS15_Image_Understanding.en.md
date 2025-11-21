# FS_15 · Image Understanding & Captioning Agent (Enterprise)

## 1. Overview / Visión general
This module operates inside FDIS OS · PureMind as a critical point for Image Understanding & Captioning Agent. It delivers Fortune 50-grade controls focused on governance, resilience, and traceability. It is engineered for pipelines that handle tens of thousands of heterogeneous documents, requiring operational precision, CI/CD alignment, and compatibility with IA sub-agents that consume explicit instructions.

## 2. Enterprise Goals / Objetivos
- Maximize Image Understanding & Captioning Agent accuracy while staying consistent across multi-format documents.
- Guarantee p95/p99 reliability through supervised fallback routes.
- Reduce end-to-end latency via safe parallelism and reusable caching.
- Align metrics and traces with enterprise observability platforms.
- Provide stable input/output contracts for downstream integrations.
- Support thousands of pages through partitioning and distribution.
- Expose quality signals consumable by FS_22 and FS_24.
- Be friendly to multi-tenant deployments and data isolation.
- Enable automated tests and CI validation before production rollout.

## 3. Inputs
### Input schema (JSON)
````json
{
  "document_id": "string unique",
  "source_path": "string",
  "tenant_id": "string",
  "pipeline_id": "string",
  "page_range": "array<int>",
  "previous_results": "object optional",
  "runtime_hints": "object",
  "trace_id": "string",
  "locale_hints": "array<string>"
}
````
**Example**
````json
{
  "document_id": "DOC-7845",
  "source_path": "s3://bucket/sample.pdf",
  "tenant_id": "acme-corp",
  "pipeline_id": "full-extraction-v2",
  "page_range": [
    1,
    2,
    3
  ],
  "previous_results": {
    "FS_15": {
      "status": "done"
    }
  },
  "runtime_hints": {
    "priority": "high",
    "cache_allowed": true
  },
  "trace_id": "tr-1299",
  "locale_hints": [
    "es-ES",
    "en-US"
  ]
}
````


## 4. Outputs
### Output schema (JSON)
````json
{
  "document_id": "DOC-7845",
  "agent": "FS_15",
  "status": "success",
  "payload": {
    "summary": "..."
  },
  "metrics": {
    "runtime_ms": 812,
    "confidence": 0.97
  },
  "warnings": [],
  "trace_id": "tr-1299"
}
````
**Error/Warning example**
````json
{
  "document_id": "DOC-7845",
  "agent": "FS_15",
  "status": "error",
  "error_code": "UNREADABLE_PAGE",
  "message": "Page 2 unreadable after retries",
  "metrics": {
    "runtime_ms": 1500
  },
  "warnings": [
    "fallback_ocr_used"
  ],
  "trace_id": "tr-1299"
}
````


## 5. Internal Logic (step by step) / Lógica interna
1. Receive metadata and validate input schema.
2. Resolve document location and load only the required page range using lazy reading.
3. Apply pre-checks: size, encryption, integrity, and digital fingerprints.
4. Run Image Understanding & Captioning Agent core with agent-specific rules and reuse previous results when caches are valid.
5. Record intermediate metrics and quality signals for QA.
6. Trigger fallback routes when confidence drops below defined p95/p99 thresholds.
7. Emit structured output with source references, traces, and observability flags.

Streaming paths apply when the document exceeds 200 pages to prevent memory spikes, and each step leaves evidence in structured logs.


## 6. Edge Cases / Casos límite
- Documentos corruptos o parcialmente legibles donde se debe preservar trazabilidad y marcar incertidumbre.
- Páginas giradas, espejadas o con resoluciones mixtas que requieren preprocesado adaptativo.
- Contenido multilingüe en la misma página o bloque, que obliga a segmentar y etiquetar con granularidad.
- Zonas con artefactos visuales (sellos, firmas, manchas) que no deben contaminar las salidas.
- Fuentes inusuales, manuscritos o fórmulas científicas que pueden degradar la confianza de extracción.
- Documentos cifrados o protegidos con contraseña donde se debe registrar bloqueo sin exponer datos.
- Tablas sin bordes o con celdas fusionadas que desafían la detección y reconstrucción.
- Gráficos vectoriales embebidos y capas ocultas que pueden indicar manipulación.
- Flujos de páginas muy extensos (1000+) que exigen paginación y límites de memoria.

## 7. QA, Metrics & KPIs / QA, Métricas y KPIs
- Agent-specific precision (e.g., Image Understanding & Captioning Agent accuracy).
- p95/p99 latency per page and per document.
- Retry rate and fallback activations.
- Coverage of processed blocks/regions versus detected ones.
- Match percentage against FS_22 and FS_24 cross-validation.
- CPU/GPU consumption per 100 pages and cache efficiency.
- Structured error rate (with code and cause).
- Average confidence and standard deviation per block.


## 8. Performance & Scalability / Rendimiento y Escalabilidad
- Parallelize per page and per region when structure allows, with configurable concurrency limits.
- Enable block streaming to avoid loading full documents into memory.
- Cache rasterized images, OCR results, and reusable feature vectors.
- Monitor O(n·m) hot spots in table or block detection and split per page.
- Use queues and decoupled microservices to scale horizontally.
- Include backpressure controls to prevent overload on OCR or GPU nodes.


## 9. Logging & Observability / Logging y Observabilidad
Logs are captured as structured JSON and can be shipped to OpenTelemetry, Grafana, or Datadog via standard exporters.
````json
{
  "timestamp": "2024-05-05T10:00:00Z",
  "agent": "FS_15",
  "document_id": "DOC-7845",
  "runtime_ms": 820,
  "status": "success",
  "metrics": {
    "confidence": 0.97,
    "blocks": 42
  },
  "flags": {
    "fallback_used": false,
    "cache_hit": true
  },
  "trace_id": "tr-1299"
}
````
````json
{
  "timestamp": "2024-05-05T10:01:00Z",
  "agent": "FS_15",
  "document_id": "DOC-7845",
  "runtime_ms": 1200,
  "status": "warning",
  "metrics": {
    "confidence": 0.78,
    "blocks": 40
  },
  "flags": {
    "fallback_used": true,
    "cache_hit": false
  },
  "warning": "Low confidence on page 3",
  "trace_id": "tr-1299"
}
````
````json
{
  "timestamp": "2024-05-05T10:02:00Z",
  "agent": "FS_15",
  "document_id": "DOC-7845",
  "runtime_ms": 1500,
  "status": "error",
  "error_code": "IO_TIMEOUT",
  "message": "Timeout fetching page 5",
  "flags": {
    "fallback_used": true,
    "cache_hit": false
  },
  "trace_id": "tr-1299"
}
````


## 10. Integration with other agents / Integración con otros agentes
- Typical upstream agents: FS_14.
- Typical downstream agents: FS_16.
- The agent consumes prior normalized results when available and publishes structured outputs consumable by pipelines such as ‘Full Extraction’, ‘PDF → Excel’, ‘Form → JSON’, ‘Diagram → GraphML’, and ‘Full QA’.
- Data structures are shared via block/page identifiers and traces from FS_01 to FS_24.


## 11. Internal IA Sub-agent Prompt / Prompt IA interno

Act as the internal sub-agent for FS_15 (Image Understanding & Captioning Agent). Mission: execute the described logic efficiently and audibly.
Exact input (JSON): {"document_id":string,"page_range":array<int>,"content_blocks":array<object>,"previous_results":object,"runtime_hints":object,"locale_hints":array<string>}.
Required output (JSON): {"status": "success|warning|error", "payload": object, "metrics": object, "warnings": array<string>, "trace_id": string}.
Rules: do not hallucinate; if data is ambiguous, mark the field as "ambiguous" or null with an explanation in warnings. Optimize to avoid reprocessing analyzed text; reuse prior features. Keep runtimes low; avoid O(n^2) unless necessary. Log key signals (confidence, blocks, latency) and set fallback_used when alternate routes are triggered. Return clear, consistent messages for automated QA.
Identifier coherence is validated, assumptions are documented, and notes are included on handling large documents without degrading latency. The agent applies versioning policies, enables full traceability between input and output, and uses confidentiality flags to satisfy regulatory requirements. Identifier coherence is validated, assumptions are documented, and notes are included on handling large documents without degrading latency. The agent applies versioning policies, enables full traceability between input and output, and uses confidentiality flags to satisfy regulatory requirements. 