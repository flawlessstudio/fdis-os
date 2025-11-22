# FDIS OS v2 · PureMind

A multimodal Document Intelligence Operating System that reads, reconstructs and validates any document with Apple-grade clarity.

## Quick start

- Default docs language: English (`docs/en/`).
- Spanish docs: see `README.es.md` and files under `docs/es/`.
- Quickstart: `docs/en/FDIS_OS_V2_QuickStart_ULTRA.en.md` and `docs/es/FDIS_OS_V2_QuickStart_ULTRA.es.md`.

## Build the distributable package

Generate the `dist/` folder (bilingual docs, manuals, brandbook, tests, notion structure and quickstart files) with:

```bash
./build_fdis_package.sh
```

The script cleans any previous `dist/` content and copies the latest documentation, so run it after updating docs or manuals.
