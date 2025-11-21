#!/usr/bin/env bash
set -euo pipefail

echo "🚀 FDIS OS v2 · PureMind — One-Click Bilingual Setup (ES/EN)"
echo "Repo: $(pwd)"
echo

# ==========
# CARPETAS
# ==========
echo "📁 Creando estructura de carpetas…"

mkdir -p docs/es docs/en
mkdir -p tests/es tests/en
mkdir -p notion/es notion/en
mkdir -p manuals/es manuals/en
mkdir -p brandbook/es brandbook/en
mkdir -p design/B_HTML_Site/es design/B_HTML_Site/en

echo "✅ Carpetas creadas."
echo

# ==========
# DOCS · VISION
# ==========
echo "📄 Generando docs: VISION (ES/EN)…"

cat > docs/es/FDIS_OS_V2_VISION.es.md << 'EOF'
# FDIS OS v2 · PureMind  
## Documento de Visión (Edición Ultra · ES)

## 1. Propósito

FDIS OS v2 · PureMind existe para transformar el caos documental del mundo real en información clara, estructurada y confiable.

Su misión es simple de describir y difícil de lograr:

> Convertir cualquier documento — bien hecho, roto, escaneado, manuscrito o caótico — en una fuente de verdad limpia, validada y utilizable.

## 2. Qué es PureMind

PureMind es un Sistema Operativo de Inteligencia Documental multimodal.  
Combina:

- visión artificial
- análisis de estructura
- modelos de lenguaje
- agentes especializados
- QA automático
- validación numérica y semántica

para comprender documentos de cualquier tipo:

- PDFs digitales y escaneados
- imágenes (fotos de móvil, escáner, etc.)
- manuscritos
- diagramas y esquemas
- formularios y tablas complejas

y entregarlos como:

- texto limpio
- tablas bien formadas
- estructuras jerárquicas
- datos listos para Excel, Word, JSON o GraphML.

## 3. Problema que resuelve

En la práctica, las organizaciones trabajan con documentos:

- mal escaneados
- con sombras y dobleces
- con firmas pegadas o alteradas
- en varios idiomas
- con tablas rotas
- con información crítica dispersa

Los OCR clásicos y los parsers lineales no son suficientes.  
PureMind ataca el problema desde otro ángulo:

> entiende primero la realidad visual y lógica del documento y luego la reconstruye con precisión editorial.

## 4. Principios de diseño

1. **Claridad editorial**  
   La salida debe poder leerse como si hubiera sido maquetada por un humano cuidadoso.

2. **Robustez en condiciones reales**  
   El sistema está pensado para documentos “feos”: ruidosos, rotos, mezclados.

3. **Explicabilidad**  
   Cada paso deja rastro: qué se detectó, qué se corrigió, qué se decidió.

4. **Validación integrada**  
   No basta con extraer: hay que comprobar totales, coherencias y relaciones internas.

## 5. Diferenciación

- No es solo OCR → entiende estructura.  
- No es solo LLM → valida y cruza datos.  
- No es solo RPA → razona sobre contenido ambiguo.  
- No es un parser rígido → adapta el flujo al tipo de documento.

## 6. Cómo “piensa” PureMind

PureMind procesa en tres niveles:

1. **Visual:** qué hay en la página (bloques, tablas, imágenes, manuscritos).  
2. **Estructural:** cómo se organiza (secciones, columnas, listas, relaciones).  
3. **Cognitivo:** qué significa, qué falta, qué sobra, qué no cuadra.

## 7. Resultado esperado

Después de pasar por PureMind un documento debe:

- poder convertirse en Excel sin perder lógica de columnas
- poder convertirse en Word sin perder jerarquía
- poder representarse como JSON/GraphML sin perder relaciones
- exponer claramente cualquier incoherencia importante

## 8. Visión a futuro

- **v3 · PureCore:** patrones y memoria por tipo de documento.  
- **v4 · PureGrid:** ejecución multi-agente a escala.  
- **v5 · PureNet:** inteligencia documental basada en grafos de conocimiento.

## 9. Declaración final

FDIS OS v2 · PureMind quiere ser el estándar silencioso que, en segundo plano, garantiza que cada documento que entra en tu organización se convierte en información fiable.
EOF

cat > docs/en/FDIS_OS_V2_VISION.en.md << 'EOF'
# FDIS OS v2 · PureMind  
## Vision Document (Ultra Edition · EN)

## 1. Purpose

FDIS OS v2 · PureMind exists to turn real-world document chaos into clear, structured and trustworthy information.

The mission can be stated simply:

> Take any document — pristine, broken, scanned, handwritten or chaotic — and convert it into a clean, validated and useful source of truth.

## 2. What PureMind is

PureMind is a multimodal Document Intelligence Operating System.  
It combines:

- computer vision  
- structural analysis  
- large language models  
- specialized agents  
- automated QA  
- numeric and semantic validation  

to understand any kind of document:

- digital and scanned PDFs  
- images (mobile photos, scanners, etc.)  
- handwriting  
- diagrams and schematics  
- forms and complex tables  

and deliver them as:

- clean text  
- well-formed tables  
- hierarchical structures  
- data ready for Excel, Word, JSON or GraphML.

## 3. The problem it solves

Organizations work with documents that are:

- poorly scanned  
- shadowed or folded  
- altered or partially overwritten  
- multilingual  
- table-heavy and messy  
- full of critical data spread across pages  

Classical OCR and linear parsers are not enough.  
PureMind approaches the problem differently:

> it first understands the visual and logical reality of the document, then reconstructs it with editorial-grade precision.

## 4. Design principles

1. **Editorial clarity** – output should read as if crafted by a careful human editor.  
2. **Robustness under real-world noise** – built for “ugly” documents.  
3. **Explainability** – each step leaves a trace.  
4. **Validation built-in** – totals, consistency and relationships must be checked.

## 5. Differentiation

- Not just OCR → understands structure.  
- Not just an LLM → validates and cross-checks data.  
- Not just RPA → reasons about ambiguity.  
- Not a rigid parser → adapts its pipeline to each document type.

## 6. How PureMind “thinks”

Three layers:

1. **Visual:** what appears on the page (blocks, tables, images, handwriting).  
2. **Structural:** how it is organized (sections, columns, lists, relationships).  
3. **Cognitive:** what it means, what is missing, what is inconsistent.

## 7. Expected outcome

After PureMind, a document should:

- be ready to turn into Excel without losing column logic  
- be ready to turn into Word without losing hierarchy  
- be representable as JSON/GraphML without losing relations  
- clearly expose any major inconsistencies.

## 8. Future vision

- **v3 · PureCore:** patterns and memory per document type.  
- **v4 · PureGrid:** multi-agent execution at scale.  
- **v5 · PureNet:** document intelligence built on knowledge graphs.

## 9. Final statement

FDIS OS v2 · PureMind aims to be the silent standard that ensures every document entering your organization becomes reliable information.
EOF

# ==========
# DOCS · ARCHITECTURE
# ==========
echo "📄 Generando docs: ARCHITECTURE (ES/EN)…"

cat > docs/es/FDIS_OS_V2_ARCHITECTURE.es.md << 'EOF'
# FDIS OS v2 · PureMind  
## Especificación de Arquitectura (ES)

## 1. Visión general

La arquitectura de FDIS OS v2 · PureMind se organiza en siete capas:

1. Capa de Ingesta  
2. Capa de Visión  
3. Capa Semántica  
4. Capa de Procesamiento  
5. Capa de Validación y QA  
6. Capa de Exportación  
7. Capa de Orquestación  

Cada capa tiene agentes especializados y reglas de decisión propias.

## 2. Capa de Ingesta

Responsable de:

- detectar tipo de archivo (PDF, imagen, lote, etc.)
- identificar si necesita OCR, restauración o análisis de diagrama/manuscrito
- extraer metadatos básicos
- elegir el flujo inicial más adecuado

## 3. Capa de Visión

Incluye:

- OCR para texto impreso
- OCR para manuscrito
- restauración visual (ruido, sombras, inclinación)
- segmentación en zonas: texto, tablas, imágenes, diagramas
- detección de columnas y bloques

## 4. Capa Semántica

Funciones:

- reconstrucción de jerarquía (títulos, secciones, párrafos, listas)
- detección de entidades (fechas, importes, nombres, claves)
- asignación de roles (título, descripción, nota, valor, etc.)
- formación de relaciones internas

## 5. Capa de Procesamiento

Encargada de:

- reconstruir tablas (con y sin bordes)
- normalizar unidades y formatos numéricos
- limpiar texto (espacios, artefactos, roturas)
- reordenar el contenido para darle sentido lógico

## 6. Capa de Validación y QA

Comprueba:

- totales y sumas
- coherencia entre valores relacionados
- detección de posibles manipulaciones
- contradicciones internas

## 7. Capa de Exportación

Produce salidas en:

- Excel (XLSX)
- Word (DOCX)
- JSON
- GraphML
- HTML

## 8. Capa de Orquestación

Define:

- qué agentes intervenirán
- en qué orden
- con qué parámetros
- qué rutas alternativas usar si falla una rama
- cuándo ejecutar QA
EOF

cat > docs/en/FDIS_OS_V2_ARCHITECTURE.en.md << 'EOF'
# FDIS OS v2 · PureMind  
## Architecture Specification (EN)

## 1. Overview

Architecture is organized into seven layers:

1. Ingestion Layer  
2. Vision Layer  
3. Semantic Layer  
4. Processing Layer  
5. Validation & QA Layer  
6. Export Layer  
7. Orchestration Layer  

Each layer has specialized agents and decision rules.

## 2. Ingestion Layer

- Detects file type (PDF, image, batch, etc.)  
- Decides whether OCR, restoration or diagram/handwriting analysis is needed  
- Extracts basic metadata  
- Chooses an initial pipeline

## 3. Vision Layer

- OCR for printed text  
- OCR for handwriting  
- Visual restoration (noise, shadows, skew)  
- Segmentation into zones: text, tables, images, diagrams  
- Column and block detection  

## 4. Semantic Layer

- Rebuilds hierarchy (headings, sections, paragraphs, lists)  
- Detects entities (dates, amounts, names, keys)  
- Assigns roles (title, description, note, value)  
- Builds internal relationships  

## 5. Processing Layer

- Rebuilds tables  
- Normalizes units and numeric formats  
- Cleans text  
- Reorders content to make logical sense  

## 6. Validation & QA Layer

- Checks totals and sums  
- Verifies consistency  
- Flags manipulation suspicion  
- Detects internal contradictions  

## 7. Export Layer

Outputs:

- Excel (XLSX), Word (DOCX), JSON, GraphML, HTML  

## 8. Orchestration Layer

Decides:

- which agents run  
- in what order  
- with which parameters  
- how to recover when something fails  
EOF

# ==========
# DOCS · AGENTS
# ==========
echo "📄 Generando docs: AGENTS (ES/EN)…"

cat > docs/es/FDIS_OS_V2_AGENTS.es.md << 'EOF'
# FDIS OS v2 · PureMind  
## Agentes (ES)

### Familias de agentes

- Ingesta
- Visión
- Semánticos
- Procesamiento
- Validación y Seguridad
- Exportación
- Orquestación

### Ejemplos clave

- **FS_01 · Ingest Agent** – clasifica el documento y define el pipeline inicial.  
- **FS_07 · OCR Agent** – extrae texto de documentos impresos.  
- **FS_12 · Handwriting Agent** – reconoce escritura manual.  
- **FS_13 · Diagram Agent** – interpreta diagramas como grafos.  
- **FS_14 · Restoration Agent** – corrige imágenes problemáticas.  
- **FS_02 · Structure Agent** – reconstruye estructura lógica.  
- **FS_10 · Semantic Refinement Agent** – refina texto y normaliza formatos.  
- **FS_11 · Table Agent** – reconstruye tablas complejas.  
- **FS_20 · Security Agent** – busca indicios de manipulación.  
- **FS_21 · Consistency Agent** – comprueba totales y coherencia.  
- **FS_24 · Deep QA Agent** – QA profundo.  
- **FS_09 · Export Agent** – genera Excel, Word, JSON, GraphML, HTML.  
- **OS_Controller** – orquesta todo el sistema.
EOF

cat > docs/en/FDIS_OS_V2_AGENTS.en.md << 'EOF'
# FDIS OS v2 · PureMind  
## Agents (EN)

### Agent families

- Ingest Agents  
- Vision Agents  
- Semantic Agents  
- Processing Agents  
- Validation & Security Agents  
- Export Agents  
- Orchestration Agent  

### Key examples

- **FS_01 · Ingest Agent** – classifies the document and defines the initial pipeline.  
- **FS_07 · OCR Agent** – extracts text from printed documents.  
- **FS_12 · Handwriting Agent** – recognizes handwriting.  
- **FS_13 · Diagram Agent** – interprets diagrams into graphs.  
- **FS_14 · Restoration Agent** – fixes noisy, skewed, shadowed images.  
- **FS_02 · Structure Agent** – rebuilds logical structure.  
- **FS_10 · Semantic Refinement Agent** – refines text and normalizes formats.  
- **FS_11 · Table Agent** – reconstructs complex tables.  
- **FS_20 · Security Agent** – detects visual manipulation cues.  
- **FS_21 · Consistency Agent** – checks totals and numeric consistency.  
- **FS_24 · Deep QA Agent** – deep reasoning QA.  
- **FS_09 · Export Agent** – exports to Excel, Word, JSON, GraphML, HTML.  
- **OS_Controller** – orchestrates the system.
EOF

# ==========
# DOCS · PLAYBOOKS
# ==========
echo "📄 Generando docs: PLAYBOOKS (ES/EN)…"

cat > docs/es/FDIS_OS_V2_PLAYBOOKS.es.md << 'EOF'
# FDIS OS v2 · PureMind  
## Playbooks (Flujos operativos · ES)

### Playbook 1 — PDF → Excel
Pipeline: FS_01 → FS_07 → FS_11 → FS_10 → FS_21 → FS_09.

### Playbook 2 — Escaneado → Word editable
Pipeline: FS_01 → FS_14 → FS_07 → FS_02 → FS_10 → FS_09.

### Playbook 3 — Manuscrito → Texto estructurado
Pipeline: FS_01 → FS_12 → FS_10 → FS_21 → FS_09.

### Playbook 4 — Diagrama → GraphML
Pipeline: FS_01 → FS_13 → FS_17 → FS_09.

### Playbook 5 — Factura → Excel + QA
Pipeline: FS_01 → FS_07 → FS_11 → FS_10 → FS_21 → FS_09.
EOF

cat > docs/en/FDIS_OS_V2_PLAYBOOKS.en.md << 'EOF'
# FDIS OS v2 · PureMind  
## Playbooks (Operational Flows · EN)

### Playbook 1 — PDF → Excel  
Pipeline: FS_01 → FS_07 → FS_11 → FS_10 → FS_21 → FS_09.

### Playbook 2 — Scanned → Editable Word  
Pipeline: FS_01 → FS_14 → FS_07 → FS_02 → FS_10 → FS_09.

### Playbook 3 — Handwritten → Structured Text  
Pipeline: FS_01 → FS_12 → FS_10 → FS_21 → FS_09.

### Playbook 4 — Diagram → GraphML  
Pipeline: FS_01 → FS_13 → FS_17 → FS_09.

### Playbook 5 — Invoice → Excel + QA  
Pipeline: FS_01 → FS_07 → FS_11 → FS_10 → FS_21 → FS_09.
EOF

# ==========
# DOCS · ROADMAP
# ==========
echo "📄 Generando docs: ROADMAP (ES/EN)…"

cat > docs/es/FDIS_OS_PureMind_Roadmap_v3_v5.es.md << 'EOF'
# FDIS OS · PureMind — Roadmap v3 · v4 · v5 (ES)

## v3 · PureCore
- Plantillas aprendidas por tipo de documento.
- Memoria de patrones por proveedor/cliente.
- Sugerencias de pipeline más inteligentes.
- Métricas de calidad por flujo.

## v4 · PureGrid
- Ejecución multi-agente en paralelo.
- Distribución de carga.
- Integraciones profundas vía API.
- Panel de control de jobs y colas.

## v5 · PureNet
- Inteligencia documental basada en grafos.
- Relación entre documentos, entidades y eventos.
- Módulos de compliance sectorial.
- Aprendizaje federado sin sacar datos del cliente.
EOF

cat > docs/en/FDIS_OS_PureMind_Roadmap_v3_v5.en.md << 'EOF'
# FDIS OS · PureMind — Roadmap v3 · v4 · v5 (EN)

## v3 · PureCore
- Learned templates per document type.
- Pattern memory per provider/client.
- Smarter pipeline suggestions.
- Quality metrics per flow.

## v4 · PureGrid
- Multi-agent execution in parallel.
- Load distribution.
- Deep integrations via API.
- Job & queue control panel.

## v5 · PureNet
- Document intelligence built on graphs.
- Relationships between documents, entities and events.
- Industry-specific compliance modules.
- Federated learning without exposing customer data.
EOF

# ==========
# TESTS
# ==========
echo "🧪 Generando Test Suite (ES/EN)…"

cat > tests/es/Test_Suite_v2.es.md << 'EOF'
# Test Suite v2 — FDIS OS v2 PureMind (ES)

La suite de pruebas se organiza en 8 bloques:

1. OCR
2. Layout y estructura
3. Tablas
4. Diagramas y grafos
5. Manuscrito
6. Razonamiento
7. QA y seguridad
8. Exportación

Cada bloque debe contener casos buenos, malos y extremos.
EOF

cat > tests/en/Test_Suite_v2.en.md << 'EOF'
# Test Suite v2 — FDIS OS v2 PureMind (EN)

The test suite is organized into 8 blocks:

1. OCR
2. Layout & structure
3. Tables
4. Diagrams & graphs
5. Handwriting
6. Reasoning
7. QA & security
8. Export

Each block should contain good, bad and edge cases.
EOF

# ==========
# NOTION
# ==========
echo "🗂 Generando estructura Notion (ES/EN)…"

cat > notion/es/Notion_Premium_v2_Structure.es.md << 'EOF'
# Notion Premium v2 — Estructura recomendada (ES)

Secciones:

1. Visión
2. Arquitectura
3. Agentes
4. Playbooks
5. Manuales
6. Test Suite
7. Roadmap
8. Design System
9. Integraciones & API
10. Casos de uso / despliegues
EOF

cat > notion/en/Notion_Premium_v2_Structure.en.md << 'EOF'
# Notion Premium v2 — Recommended structure (EN)

Sections:

1. Vision
2. Architecture
3. Agents
4. Playbooks
5. Manuals
6. Test Suite
7. Roadmap
8. Design System
9. Integrations & API
10. Use cases / deployments
EOF

# ==========
# MANUALS
# ==========
echo "📘 Generando Manuals (ES/EN)…"

cat > manuals/es/FDIS_OS_V2_Manual_Premium.es.md << 'EOF'
# FDIS OS v2 · PureMind  
## Manual Premium de Uso (ES)

Describe cómo usar PureMind a nivel operativo:

- definir objetivos (PDF → Excel, escaneado → Word, etc.)
- elegir playbooks
- interpretar avisos de QA
- buenas prácticas de digitalización
EOF

cat > manuals/en/FDIS_OS_V2_Manual_Premium.en.md << 'EOF'
# FDIS OS v2 · PureMind  
## Premium Usage Manual (EN)

Describes how to use PureMind operationally:

- define goals (PDF → Excel, scanned → Word, etc.)
- choose playbooks
- interpret QA warnings
- follow digitization best practices
EOF

cat > manuals/es/FDIS_OS_V2_Manual_Enterprise.es.md << 'EOF'
# FDIS OS v2 · PureMind  
## Manual Enterprise (ES)

Guía de alto nivel para equipos de arquitectura, seguridad y datos:

- estrategias de despliegue
- gobierno del dato documental
- integración con otros sistemas empresariales
EOF

cat > manuals/en/FDIS_OS_V2_Manual_Enterprise.en.md << 'EOF'
# FDIS OS v2 · PureMind  
## Enterprise Manual (EN)

High-level guide for architecture, security and data teams:

- deployment strategies
- document data governance
- integration with enterprise systems
EOF

# ==========
# BRANDBOOK
# ==========
echo "🎨 Generando Brandbook base (ES/EN)…"

cat > brandbook/es/FDIS_OS_V2_Brandbook.es.md << 'EOF'
# Brandbook · FDIS OS v2 · PureMind (ES)

- Posicionamiento: silencioso pero esencial, técnico pero elegante.
- Estilo: claro, directo, sin jerga innecesaria.
- Visual: tipografía sans serif, mucho espacio en blanco, paleta sobria.
EOF

cat > brandbook/en/FDIS_OS_V2_Brandbook.en.md << 'EOF'
# Brandbook · FDIS OS v2 · PureMind (EN)

- Positioning: silent but essential, technical yet elegant.
- Style: clear, direct, low-jargon.
- Visual: modern sans serif, generous whitespace, sober palette.
EOF

# ==========
# LANDING HTML
# ==========
echo "🌐 Generando landing base (ES/EN)…"

cat > design/B_HTML_Site/es/index.html << 'EOF'
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>FDIS OS v2 · PureMind — ES</title>
</head>
<body>
  <h1>FDIS OS v2 · PureMind</h1>
  <p>Sistema Operativo de Inteligencia Documental. Versión bilingüe (ES/EN).</p>
</body>
</html>
EOF

cat > design/B_HTML_Site/en/index.html << 'EOF'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>FDIS OS v2 · PureMind — EN</title>
</head>
<body>
  <h1>FDIS OS v2 · PureMind</h1>
  <p>Document Intelligence Operating System. Bilingual version (ES/EN).</p>
</body>
</html>
EOF

# ==========
# README
# ==========
echo "📚 Generando README (EN) + README.es…"

cat > README.md << 'EOF'
# FDIS OS v2 · PureMind

A multimodal Document Intelligence Operating System that reads, reconstructs and validates any document with Apple-grade clarity.

- Default docs language: English  
- Spanish docs: see `README.es.md` and files under `docs/es/`.
EOF

cat > README.es.md << 'EOF'
# FDIS OS v2 · PureMind (ES)

Sistema Operativo de Inteligencia Documental capaz de entender y reconstruir cualquier documento con claridad a nivel editorial.

- Documentación principal en inglés: `README.md` y `docs/en/`.
- Versión en español: este archivo y `docs/es/`.
EOF

echo
echo "✅ FDIS OS v2 · PureMind — Setup COMPLETADO."
echo "Revisa las carpetas docs/, tests/, notion/, manuals/, brandbook/ y design/."