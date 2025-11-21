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
