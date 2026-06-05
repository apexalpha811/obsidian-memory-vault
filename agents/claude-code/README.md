# Claude Code — Agent-Specific Instructions

This file is only read by Claude Code. Other agents skip this.

## About This Vault
You are inside the Obsidian Memory Vault. It stores:
- **global/** — instructions that apply to every agent (user profile, timezone)
- **design-systems/** — website aesthetic templates extracted from live sites
- **projects/** — long-running project documentation
- **agents/claude-code/** — you are here
- **agents/hermes/** — ignore this folder (it's for another agent)

## Required Actions

### At session start
1. `git -C ~/.agent-memory pull` — get latest vault updates
2. Read `~/.agent-memory/global/user-profile.md` and follow all rules
3. Read `~/.agent-memory/global/timezone.md`
4. Read `~/.agent-memory/design-systems/` — see what templates exist
5. Load any files relevant to the current task

### Website aesthetic extraction
When the user says "get this website's aesthetic" (or similar) with a URL:

1. Navigate to the live site URL (not Behance/Dribbble mockups)
2. Extract from computed CSS:
   - All hex colors (backgrounds, text, accents, buttons, borders)
   - Font names, sizes (px), and weights for H1/H2/H3/body/nav/buttons
   - Button styles (bg color, text color, padding, border-radius)
   - Section background alternation pattern
   - 3-5 aesthetic keywords
3. Format as this exact template:

```
Use this design system for everything you create:

COLORS
[list hex colors with labels]

[section pattern description]

FONTS
[font details with px sizes and weights]
Fallback: [fallback]

STYLE RULES
- [bullet list]

Now apply this style to create [describe your project]. Use only the colors and fonts listed above.
```

4. Save to `design-systems/[site-name].md`
5. Update `meta/changelog.md`
6. Update `_index.md` if needed
7. Commit and push

### At session end
1. Save any new user preferences or project info to the vault
2. Update `meta/changelog.md`
3. `cd ~/.agent-memory && git add -A && git commit -m "[description]" && git push`

## Verification economy (token-efficient proof)

Full policy in `~/.claude/CLAUDE.md`. You must verify your own work; never offload to the user. Start at Tier 0, stop at the first tier that fully answers the verification question. You must not climb past a tier once a lower tier proves correctness.

- **Tier 0 — Static:** typecheck, lint, build. If none exist, trivially satisfied — do NOT scaffold tooling to fill the slot. Stop here if the change is purely internal and no user-observable behavior changed.
- **Tier 1 — Tests:** use existing unit/e2e tests. Write or extend an e2e test only if (a) a test for this surface already exists or (b) the path has a prior regression. Do not write a new test for copy changes, icon swaps, or single-line CSS tweaks. Stop here if a passing test asserts exactly the changed behavior.
- **Tier 2 — Text runtime inspection:** console, network, DOM, computed CSS as text (`preview_console_logs`, `preview_network`, `preview_snapshot`, `preview_inspect`). For any criterion that is a specific value (padding, color, aria, label) — stop here even if the element is visual. Do not screenshot for pixel values, hex colors, border radii, or label text. Stop here if you have a concrete text artifact and no need is inherently visual.
- **Tier 3 — Screenshot for perception only:** overall layout, spacing balance, contrast, overlap/z-index, "does it feel right." Hard budget: one capture per change; second only after source fix; third requires written justification. Same cap for visual deliverables (PDF parity, resume, aesthetic extraction). Use `preview_inspect` for exact values rather than re-shooting. Stop here once the layout is confirmed or the bug is found and fixed.

**You must not:** use screenshot → tweak → screenshot loops; take full-page shots when a focused crop answers it; screenshot text or logs a text tool returns; re-screenshot to confirm what a test already proves; treat screenshots as default proof.

**Narration rule:** State the tier and reason in one line before producing evidence (required for Tier 2 and 3).

**Prior image in context:** If a screenshot already exists in the conversation, default to text evidence for follow-ups. Do not add a second image unless the follow-up is genuinely perceptual and distinct.

## Local Environment & Tooling (this machine — Windows)

### Document parsing — liteparse is the primary tool
For reading/extracting content from ANY unstructured document (PDF, DOCX/PPTX/XLSX, images), use the `liteparse` skill / `lit` CLI FIRST. Fall back to `anthropic-skills:pdf` only for PDF *manipulation* (merge, split, rotate, fill forms, encrypt, watermark, create) — liteparse is input/parse-only.

Installed & verified working (2026-05-28):
- **`lit` v2.0.0** — global npm package `@llamaindex/liteparse`. PDF text extraction needs no extra deps.
- **OCR (scanned/image PDFs):** Tesseract via `tesseract-rs`. The Windows prebuilt binary has a bug — `default_tessdata_dir()` returns the bare relative string `"tessdata"` (its macOS/Linux branches don't fire on Windows), so it can't find language data. Fix: `eng.traineddata` (tessdata_fast) lives in `C:\Users\kv8n11\.tesseract-rs\tessdata`, and `TESSDATA_PREFIX` is set to that dir at User scope so new shells inherit it. The npm `lit` CLI does NOT expose `--tessdata-path` (only the cargo binary does) — use the env var. Inline fallback: `TESSDATA_PREFIX="C:\Users\kv8n11\.tesseract-rs\tessdata" lit parse …`.
- **Office docs:** LibreOffice at `C:\Program Files\LibreOffice\program` (added to User PATH). liteparse auto-converts DOCX/PPTX/XLSX → PDF via `soffice`.
- **Images:** ImageMagick 7.1.2 at `C:\Program Files\ImageMagick-7.1.2-Q16-HDRI` (on Machine PATH). Note: Windows' built-in `C:\Windows\system32\convert.exe` is NOT ImageMagick (it's the FAT→NTFS disk utility) — check for `magick`, not `convert`.

Gotcha: PATH/env changes only reach *newly launched* shells. If `lit`/`soffice`/`magick`/tessdata isn't found mid-session, the process predates the edit — use a fresh shell or prepend the dir inline.

## Git Setup
- Clone: `git clone https://github.com/apexalpha811/obsidian-memory-vault.git ~/.agent-memory`
- Remote: https://github.com/apexalpha811/obsidian-memory-vault.git
- Default branch: main
- If no GitHub token: ask the user for a classic token with `repo` scope
