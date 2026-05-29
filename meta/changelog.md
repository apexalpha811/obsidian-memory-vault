# Changelog

Newest entries first. Format: `## YYYY-MM-DD — summary` followed by bullets.

## 2026-05-29 — Claude Code wired to Obsidian vault via obsidian-mcp (global, read+write)
- Registered `obsidian` MCP server at user/global scope in `C:\Users\kv8n11\.claude.json` (top-level `mcpServers`, alongside `codegraph`): `claude mcp add obsidian -s user -- node <...obsidian-mcp\build\main.js> C:\Users\kv8n11\agent-memory-vault`. Loads in every project, not just home.
- Points at the existing dotless junction `agent-memory-vault` → `.agent-memory` (obsidian-mcp rejects dot-prefixed paths). No folder/structural changes were needed — the layout was already correct.
- Verified read+write by driving the server over stdio: `search-vault` returned hits, `create-note`/`delete-note` round-tripped a scratch note with zero residue, vault git tree clean. 11 tools available; calls take `vault: "agent-memory-vault"`. File tools + git stay the primary write path; MCP is for search/backlinks/tags.

## 2026-05-28 — liteparse installed as primary document parser (Claude Code, Windows)
- Installed the `liteparse` skill globally (`~/.agents/skills/liteparse`, symlinked into Claude Code) and the `lit` CLI v2.0.0 via npm `@llamaindex/liteparse`.
- Set standing rule (in `~/.claude/CLAUDE.md` and `agents/claude-code/README.md`): liteparse is the FIRST choice for reading/extracting any unstructured doc (PDF, Office, images); `anthropic-skills:pdf` only for PDF manipulation/creation.
- Fixed Windows Tesseract OCR: the prebuilt binary's `default_tessdata_dir()` returns bare `"tessdata"` on Windows. Downloaded `eng.traineddata` (tessdata_fast) to `C:\Users\kv8n11\.tesseract-rs\tessdata` and set `TESSDATA_PREFIX` (User scope). Verified OCR now recognizes glyphs.
- Wired up converters: added LibreOffice (`C:\Program Files\LibreOffice\program`) to User PATH for Office docs; installed ImageMagick 7.1.2 (Machine PATH) for image inputs. All three input categories (PDF / Office / image) verified working end-to-end.
- Cleaned up `agents/claude-code/README.md`: replaced `{{REPO_URL}}` placeholders with the real remote.
