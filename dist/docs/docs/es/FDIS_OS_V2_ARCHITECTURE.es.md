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
