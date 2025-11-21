#!/usr/bin/env bash
set -euo pipefail

echo "🧱 FDIS OS v2 · PureMind — Build dist package"
ROOT="$(pwd)"
DIST="$ROOT/dist"

rm -rf "$DIST"
mkdir -p "$DIST"

echo "📁 Copiando estructura principal a dist/…"

mkdir -p "$DIST/docs" "$DIST/manuals" "$DIST/brandbook" "$DIST/tests" "$DIST/notion" "$DIST/design" "$DIST/assets" "$DIST/pdf"

cp -R docs "$DIST/docs"
cp -R manuals "$DIST/manuals"
cp -R brandbook "$DIST/brandbook"
cp -R tests "$DIST/tests"
cp -R notion "$DIST/notion"
cp -R design "$DIST/design"
cp -R assets "$DIST/assets"
cp README*.md "$DIST" || true

# ======================================================
# 1. QUICKSTART ULTRA (ES / EN)
# ======================================================

mkdir -p "$ROOT/docs/es" "$ROOT/docs/en"

cat > "$ROOT/docs/es/FDIS_OS_V2_QuickStart_ULTRA.es.md" << 'EOF'
# FDIS OS v2 · PureMind
## QuickStart ULTRA (ES)

### 1. Qué es FDIS OS · PureMind

Sistema Operativo de Inteligencia Documental que:
- lee cualquier documento (PDF, escaneado, manuscrito, diagrama…)
- lo entiende visualmente, estructuralmente y semánticamente
- lo valida (QA profundo)
- lo convierte en salidas limpias (Excel, Word, JSON, GraphML, HTML)

---

### 2. Componentes clave

- `docs/` → visión, arquitectura, agentes, playbooks, roadmap.
- `manuals/` → manual Premium y Enterprise (base + ultra).
- `brandbook/` → identidad visual (base + ultra).
- `tests/` → Test Suite v2.
- `notion/` → estructura para Notion Premium.
- `design/` → sitios HTML (base + ultra).
- `assets/` → logo, iconos, elementos visuales.

---

### 3. Cómo empezar en 5 minutos

1. Clona el repo.
2. Lee `docs/es/FDIS_OS_V2_VISION.es.md`.
3. Lee `docs/es/FDIS_OS_V2_PLAYBOOKS.es.md`.
4. Elige un playbook (ej. PDF → Excel).
5. Integra el flujo en tu sistema (API / agente IA / script).

---

### 4. Uso con agentes IA (ChatGPT / Gemini / Opal)

1. Carga todo el repositorio como **knowledge base**.
2. Define instrucciones del agente para que:
   - detecte tipo de documento
   - asigne playbook
   - aplique QA (tests y consistencia)
   - elija formato de salida (XLSX, DOCX, JSON, etc.)

---

### 5. Orden recomendado de lectura (ES)

1. `docs/es/FDIS_OS_V2_VISION.es.md`
2. `docs/es/FDIS_OS_V2_ARCHITECTURE.es.md`
3. `docs/es/FDIS_OS_V2_AGENTS.es.md`
4. `docs/es/FDIS_OS_V2_PLAYBOOKS.es.md`
5. `tests/es/Test_Suite_v2.es.md`
6. `manuals/es/FDIS_OS_V2_Manual_Premium.es.md`
7. `manuals/es/ultra/FDIS_OS_V2_Manual_Premium_ULTRA.es.md` (si existe)
8. `brandbook/es/FDIS_OS_V2_Brandbook.es.md`

EOF

cat > "$ROOT/docs/en/FDIS_OS_V2_QuickStart_ULTRA.en.md" << 'EOF'
# FDIS OS v2 · PureMind
## QuickStart ULTRA (EN)

### 1. What FDIS OS · PureMind is

A Document Intelligence Operating System that:
- reads any document (PDF, scan, handwriting, diagram, …)
- understands it visually, structurally and semantically
- validates it (deep QA)
- converts it into clean outputs (Excel, Word, JSON, GraphML, HTML)

---

### 2. Core components

- `docs/` → vision, architecture, agents, playbooks, roadmap.
- `manuals/` → Premium & Enterprise manuals (base + ultra).
- `brandbook/` → visual identity (base + ultra).
- `tests/` → Test Suite v2.
- `notion/` → Notion Premium workspace structure.
- `design/` → HTML sites (base + ultra).
- `assets/` → logo, icons, visual elements.

---

### 3. Get started in 5 minutes

1. Clone the repo.
2. Read `docs/en/FDIS_OS_V2_VISION.en.md`.
3. Read `docs/en/FDIS_OS_V2_PLAYBOOKS.en.md`.
4. Pick a playbook (e.g. PDF → Excel).
5. Integrate the flow into your system (API / AI agent / script).

---

### 4. Using it with AI agents (ChatGPT / Gemini / Opal)

1. Load the whole repository as a **knowledge base**.
2. Configure the agent to:
   - detect document type
   - pick a playbook
   - apply QA (tests + consistency)
   - choose output format (XLSX, DOCX, JSON, …)

---

### 5. Recommended reading order (EN)

1. `docs/en/FDIS_OS_V2_VISION.en.md`
2. `docs/en/FDIS_OS_V2_ARCHITECTURE.en.md`
3. `docs/en/FDIS_OS_V2_AGENTS.en.md`
4. `docs/en/FDIS_OS_V2_PLAYBOOKS.en.md`
5. `tests/en/Test_Suite_v2.en.md`
6. `manuals/en/FDIS_OS_V2_Manual_Premium.en.md`
7. `manuals/en/ultra/FDIS_OS_V2_Manual_Premium_ULTRA.en.md` (if present)
8. `brandbook/en/FDIS_OS_V2_Brandbook.en.md`

EOF

# Copiar Quickstart al dist
cp "$ROOT/docs/es/FDIS_OS_V2_QuickStart_ULTRA.es.md" "$DIST"
cp "$ROOT/docs/en/FDIS_OS_V2_QuickStart_ULTRA.en.md" "$DIST"

# ======================================================
# 2. VERSIÓN NOTION PREMIUM
# ======================================================

cat > "$DIST/FDIS_OS_Notion_Premium_Overview.md" << 'EOF'
# FDIS OS v2 · PureMind — Notion Premium Overview

Se recomienda crear en Notion una estructura con estas páginas:

1. Vision / Visión
2. Architecture / Arquitectura
3. Agents / Agentes
4. Playbooks
5. Manuals / Manuales
6. Test Suite
7. Roadmap
8. Brandbook & Design System
9. Integrations & API
10. Use Cases / Casos de uso

Cada página puede enlazar directamente a los archivos equivalentes dentro del repositorio.
EOF

# ======================================================
# 3. GUÍA COMPLETA UNIFICADA (para exportar a PDF)
# ======================================================

cat > "$DIST/FDIS_OS_V2_PureMind_Complete_Guide.md" << 'EOF'
# FDIS OS v2 · PureMind
## Complete Guide · Bilingual (ES/EN)

Este documento sirve como índice maestro de toda la documentación.
Se recomienda usarlo como base para generar un PDF editorial (via Pandoc, LaTeX o similar).

### 1. Vision / Visión
- docs/en/FDIS_OS_V2_VISION.en.md
- docs/es/FDIS_OS_V2_VISION.es.md
- docs/en/ultra/FDIS_OS_V2_VISION_ULTRA.en.md (si existe)
- docs/es/ultra/FDIS_OS_V2_VISION_ULTRA.es.md (si existe)

### 2. Architecture / Arquitectura
- docs/en/FDIS_OS_V2_ARCHITECTURE.en.md
- docs/es/FDIS_OS_V2_ARCHITECTURE.es.md

### 3. Agents / Agentes
- docs/en/FDIS_OS_V2_AGENTS.en.md
- docs/es/FDIS_OS_V2_AGENTS.es.md

### 4. Playbooks
- docs/en/FDIS_OS_V2_PLAYBOOKS.en.md
- docs/es/FDIS_OS_V2_PLAYBOOKS.es.md

### 5. Manuals
- manuals/en/FDIS_OS_V2_Manual_Premium.en.md
- manuals/es/FDIS_OS_V2_Manual_Premium.es.md
- manuals/en/FDIS_OS_V2_Manual_Enterprise.en.md
- manuals/es/FDIS_OS_V2_Manual_Enterprise.es.md

### 6. Brandbook
- brandbook/en/FDIS_OS_V2_Brandbook.en.md
- brandbook/es/FDIS_OS_V2_Brandbook.es.md

### 7. Test Suite
- tests/en/Test_Suite_v2.en.md
- tests/es/Test_Suite_v2.es.md

### 8. Notion
- notion/en/Notion_Premium_v2_Structure.en.md
- notion/es/Notion_Premium_v2_Structure.es.md

### 9. QuickStart ULTRA
- FDIS_OS_V2_QuickStart_ULTRA.en.md
- FDIS_OS_V2_QuickStart_ULTRA.es.md

### 10. Landing / HTML
- design/B_HTML_Site
- design/Ultra_HTML_Site
EOF

# ======================================================
# 4. CREAR ZIP FINAL
# ======================================================

echo "📦 Generando ZIP final…"
cd "$ROOT"
zip -r FDIS_OS_V2_PureMind_ULTRA_Package.zip dist >/dev/null

echo "✅ Build completo."
echo "ZIP generado en: $ROOT/FDIS_OS_V2_PureMind_ULTRA_Package.zip"
