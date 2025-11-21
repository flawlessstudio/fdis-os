# FS_20 · Agente de Seguridad, Metadatos y Manipulación (Enterprise)

## 1. Visión general / Overview
Este módulo opera dentro de FDIS OS · PureMind como punto crítico para Agente de Seguridad, Metadatos y Manipulación. Proporciona controles de clase Fortune 50, orientados a gobernanza, resiliencia y trazabilidad. Se diseña para pipelines que manejan decenas de miles de documentos heterogéneos y requiere precisión operacional, alineación con prácticas de CI/CD y compatibilidad con subagentes de IA que consumen instrucciones explícitas.

## 2. Objetivos / Enterprise Goals
- Maximizar la precisión de Agente de Seguridad, Metadatos y Manipulación manteniendo coherencia con documentos multiformato.
- Garantizar confiabilidad p95/p99 con rutas de contingencia supervisadas.
- Reducir latencia total mediante paralelismo seguro y caching reutilizable.
- Alinear métricas y trazas con plataformas de observabilidad empresariales.
- Proveer contratos de entrada/salida estables para integraciones downstream.
- Soportar volúmenes de miles de páginas mediante partición y distribución.
- Exponer señales de calidad consumibles por FS_22 y FS_24.
- Ser amigable para despliegues multi-tenant y aislamiento de datos.
- Permitir pruebas automatizadas y validación en CI antes de producción.

## 3. Inputs
### Esquema de entrada (JSON)
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
**Ejemplo**
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
    "FS_20": {
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
### Esquema de salida (JSON)
````json
{
  "document_id": "DOC-7845",
  "agent": "FS_20",
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
**Ejemplo de error/advertencia**
````json
{
  "document_id": "DOC-7845",
  "agent": "FS_20",
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


## 5. Lógica interna / Internal Logic (step by step)
1. Recibir metadatos y validar esquema de entrada.
2. Resolver ubicación del documento y cargar solo el rango de páginas necesario usando lectura perezosa.
3. Aplicar controles previos: verificación de tamaño, cifrado, integridad y huellas digitales.
4. Ejecutar núcleo de Agente de Seguridad, Metadatos y Manipulación con reglas específicas del agente y aprovechar resultados previos si existen cachés válidas.
5. Registrar métricas intermedias y señales de calidad para QA.
6. Activar rutas de fallback cuando la confianza cae por debajo de umbrales p95/p99 definidos.
7. Emitir salida estructurada con referencias a origen, trazas y banderas de observabilidad.

Las rutas de streaming se aplican cuando el documento supera 200 páginas para evitar picos de memoria, y cada paso deja evidencia en los logs estructurados.


## 6. Casos límite / Edge Cases
- Documentos corruptos o parcialmente legibles donde se debe preservar trazabilidad y marcar incertidumbre.
- Páginas giradas, espejadas o con resoluciones mixtas que requieren preprocesado adaptativo.
- Contenido multilingüe en la misma página o bloque, que obliga a segmentar y etiquetar con granularidad.
- Zonas con artefactos visuales (sellos, firmas, manchas) que no deben contaminar las salidas.
- Fuentes inusuales, manuscritos o fórmulas científicas que pueden degradar la confianza de extracción.
- Documentos cifrados o protegidos con contraseña donde se debe registrar bloqueo sin exponer datos.
- Tablas sin bordes o con celdas fusionadas que desafían la detección y reconstrucción.
- Gráficos vectoriales embebidos y capas ocultas que pueden indicar manipulación.
- Flujos de páginas muy extensos (1000+) que exigen paginación y límites de memoria.

## 7. QA, Métricas y KPIs / QA, Metrics & KPIs
- Precisión específica del agente (ej. exactitud de Security, Metadata & Manipulation Detection Agent).
- Latencia p95/p99 por página y por documento.
- Tasa de reintentos y activaciones de fallback.
- Cobertura de bloques/regiones procesados vs detectados.
- Porcentaje de coincidencia con validaciones cruzadas de FS_22 y FS_24.
- Consumo de CPU/GPU por 100 páginas y eficiencia de caching.
- Tasa de errores estructurados (con código y causa).
- Nivel de confianza promedio y desviación estándar por bloque.


## 8. Rendimiento y Escalabilidad / Performance & Scalability
- Paralelizar por página y por región cuando la estructura lo permite, con límites de concurrencia configurables.
- Habilitar streaming de bloques para no cargar documentos completos en memoria.
- Cachear imágenes rasterizadas, resultados de OCR y vectores de características reutilizables.
- Monitorear hot spots O(n·m) en detección de tablas o bloques y dividir por página.
- Usar colas y microservicios desacoplados para escalar horizontalmente.
- Incluir controles backpressure para evitar sobrecarga en nodos OCR o GPU.


## 9. Logging y Observabilidad / Logging & Observability
Los logs se capturan en formato JSON estructurado y pueden enviarse a OpenTelemetry, Grafana o Datadog mediante exporters estándar.
````json
{
  "timestamp": "2024-05-05T10:00:00Z",
  "agent": "FS_20",
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
  "agent": "FS_20",
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
  "agent": "FS_20",
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


## 10. Integración con otros agentes / Integration with other agents
- Agentes previos típicos: FS_19.
- Agentes posteriores típicos: FS_21.
- El agente consume resultados normalizados previos si existen y publica salidas estructuradas consumibles por pipelines como ‘Full Extraction’, ‘PDF → Excel’, ‘Form → JSON’, ‘Diagram → GraphML’ y ‘Full QA’.
- Las estructuras de datos se comparten vía identificadores de bloque/página y trazas de FS_01 a FS_24.


## 11. Prompt IA interno / Internal IA Sub-agent Prompt

Actúa como sub-agente interno para FS_20 (Agente de Seguridad, Metadatos y Manipulación). Misión: ejecutar la lógica descrita de forma eficiente y auditable.
Entrada exacta (JSON): {"document_id":string,"page_range":array<int>,"content_blocks":array<object>,"previous_results":object,"runtime_hints":object,"locale_hints":array<string>}.
Salida obligatoria (JSON): {"status": "success|warning|error", "payload": object, "metrics": object, "warnings": array<string>, "trace_id": string}.
Reglas: no inventes datos; si algo es ambiguo, marca el campo como "ambiguous" o deja nulo con explicación en warnings. Optimiza para no reprocesar texto ya analizado; reutiliza features previas. Mantén tiempos bajos; evita operaciones O(n^2) salvo necesidad. Registra señales clave (confianza, bloques, latencia) y marca fallback_used cuando apliques rutas alternativas. Devuelve mensajes claros y consistentes para QA automatizado.


Esta sección de detalle operativo refuerza controles: Se valida la coherencia de identificadores, se documentan suposiciones y se incluyen notas sobre cómo manejar documentos de gran tamaño sin degradar latencia. El agente aplica políticas de versionado, permite trazabilidad completa entre entrada y salida y utiliza banderas de confidencialidad para cumplir normativas. Se valida la coherencia de identificadores, se documentan suposiciones y se incluyen notas sobre cómo manejar documentos de gran tamaño sin degradar latencia. El agente aplica políticas de versionado, permite trazabilidad completa entre entrada y salida y utiliza banderas de confidencialidad para cumplir normativas. 