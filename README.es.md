# FDIS OS v2 · PureMind (ES)

Sistema Operativo de Inteligencia Documental capaz de entender y reconstruir cualquier documento con claridad a nivel editorial.

## Inicio rápido

- Documentación principal en inglés: `README.md` y `docs/en/`.
- Versión en español: este archivo y `docs/es/`.
- Quickstart: `docs/en/FDIS_OS_V2_QuickStart_ULTRA.en.md` y `docs/es/FDIS_OS_V2_QuickStart_ULTRA.es.md`.

## Construir el paquete distribuible

Genera la carpeta `dist/` (documentación bilingüe, manuales, brandbook, tests, estructura de Notion y archivos de inicio rápido) ejecutando:

```bash
./build_fdis_package.sh
```

El script limpia cualquier contenido previo de `dist/` y copia la documentación más reciente, así que ejecútalo tras actualizar documentos o manuales.
