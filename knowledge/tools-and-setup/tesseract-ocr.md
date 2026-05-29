---
title: Tesseract OCR (for liteparse on scanned/image PDFs)
type: tool
tags: [work]
created: 2026-05-29
updated: 2026-05-29
---

Tesseract provides OCR for [[liteparse]] when parsing scanned or image-only PDFs. Wired up
and verified on Windows, with a binary-specific workaround.

## Setup
- Language data lives at `C:\Users\kv8n11\.tesseract-rs\tessdata` (contains `eng.traineddata`,
  tessdata_fast variant).
- `TESSDATA_PREFIX` env var set persistently (User scope) to that directory. New shells
  inherit it automatically.

## Gotchas
- The Windows prebuilt binary has a bug: `default_tessdata_dir()` returns bare `"tessdata"`,
  so language data must be located via `TESSDATA_PREFIX` — hence the env var above.
- If an OCR call errors with "Failed loading language" / "couldn't load any languages", the
  shell predates the env-var edit. Prefix inline:
  `TESSDATA_PREFIX="C:\Users\kv8n11\.tesseract-rs\tessdata" lit parse …`
- The npm `lit` CLI does NOT expose `--tessdata-path` (only the cargo binary does) — use the
  env var, not a flag.
- More languages: drop `<code>.traineddata` into the tessdata dir and pass `--ocr-language <code>`.

## Verify
OCR confirmed recognizing glyphs after the TESSDATA_PREFIX fix (2026-05-28).
