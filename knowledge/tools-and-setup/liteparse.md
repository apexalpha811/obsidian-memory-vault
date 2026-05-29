---
title: liteparse — primary document parser
type: tool
tags: [work]
created: 2026-05-29
updated: 2026-05-29
---

`liteparse` (the `lit` CLI) is the FIRST choice for reading/extracting any unstructured
document: PDF, DOCX/DOC/ODT/RTF, PPTX/PPT/ODP, XLSX/XLS/CSV/TSV/ODS, and images
(PNG/JPG/TIFF/etc.). Text extraction, OCR, format→PDF conversion, page screenshots, and
JSON-with-bounding-boxes all route through it. Installed and verified on Windows.

## Setup
- `lit` CLI v2.0.0 via npm `@llamaindex/liteparse`. Skill installed globally at
  `~/.agents/skills/liteparse`, symlinked into Claude Code.
- Office docs parse via **LibreOffice** at `C:\Program Files\LibreOffice\program` (on User PATH).
- Image inputs parse via **ImageMagick 7.1.2** at `C:\Program Files\ImageMagick-7.1.2-Q16-HDRI`
  (on Machine PATH).

## Common commands
- `lit parse <file>` — text
- `lit parse <file> --format json -o out.json`
- `lit parse <file> --target-pages "1-5,10"`
- `lit parse <file> --no-ocr` — text-only, faster
- `lit screenshot <file> -o ./shots`
- `lit batch-parse ./in ./out --extension .pdf --recursive`

## Gotchas
- liteparse is **input/parse-only**. For PDF *manipulation/creation* (merge, split, rotate,
  fill forms, encrypt/decrypt, watermark, build new PDFs) use `anthropic-skills:pdf` instead.
- If `soffice`/`magick` isn't found, the shell predates the PATH edit — open a fresh shell or
  prepend the dir inline.
- OCR setup: see [[tesseract-ocr]].

## Verify
PDF / Office / image inputs all confirmed working end-to-end (2026-05-28).
