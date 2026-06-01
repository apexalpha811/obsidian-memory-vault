---
title: Ghostscript Installation
type: setup
tags: tools/image-processing
created: 2026-05-31
updated: 2026-05-31
---

# Ghostscript

ImageMagick depends on Ghostscript for rendering and processing PDFs (text extraction, conversion, rasterization).

## Status
- **Installed:** 2026-05-31
- **Version:** 10.03.0
- **Location:** `C:\Program Files\gs\gs10.03.0\bin\gswin64c.exe`
- **In PATH:** Not yet (PATH was not updated by installer)

## To add to PATH
Windows → Environment Variables → User variables → PATH → Edit → New → `C:\Program Files\gs\gs10.03.0\bin` → OK

Then open a new shell — `gswin64c --version` should work.

## Why it matters
liteparse → ImageMagick → Ghostscript pipeline for PDF input:
1. **liteparse** calls ImageMagick for high-quality text extraction from PDFs
2. **ImageMagick** (magick) detects PDFs and routes to Ghostscript
3. **Ghostscript** (gswin64c) renders the PDF pages for processing

Without it: ImageMagick's PDF support is crippled (may still work but with lower quality).

Related: `~/.agent-memory/agents/claude-code/README.md` documents the full liteparse setup.
