# Changelog

Newest entries first. Format: `## YYYY-MM-DD — summary` followed by bullets.

## 2026-06-12 - DocuPipe live PNG upload tested
- Recorded live test of `C:\Users\kv8n11\Downloads\test.png` through the DocuPipe clone.
- Captured upload payload fix: DocuPipe requires base64 local file content at `document.file.contents`, not `document.file.base64`.

## 2026-06-12 - Culver City Surgical Dashboard DocuPipe clone
- Created project memory for `C:\Users\kv8n11\culver-city-surgical-dashboard-docupipe`.
- Recorded that the original dashboard stayed unchanged, the clone runs on `http://localhost:8742`, and verification passed for mock DocuPipe upload, standardization, Stedi preview, dashboard insertion, and Print Center.

## 2026-06-11 — Culver City Surgical Dashboard mock interaction layer
- Resumed work on `C:\Users\kv8n11\culver-city-surgical-dashboard/`. Fixed missing closing paren in eligibility detail function (SyntaxError from concise-to-block-arrow conversion). Added toast system, drawerAct/drawerX12 helpers, X12 viewers, and onclick handlers to all mock action buttons. Committed 47 insert/12 delete. Added session note to graphify knowledge base.

## 2026-06-05 — Verification economy: stop conditions, not-notation rewrite, narration rule
- Rewrote the Verification economy section in `~/.claude/CLAUDE.md` and Codex `AGENTS.md` rule 23 using "must not / do not" style throughout. Added explicit stop conditions for each tier so an autonomous agent has a binary gate per tier rather than a fuzzy "answers the question" judgment. Added a narration rule (state the tier and reason in one line before producing evidence). Added a prior-image-in-context rule (if a screenshot is already in the session, default to text for follow-ups). Added negative e2e examples to Tier 1 (do not write a new test for a single copy change, icon swap, or single-line CSS tweak). Added visual-only examples to Tier 3 (relative spacing, z-index overlap) and explicit non-visual examples to Tier 2 (exact px, hex, border radius, aria, label text). Vault README updated.
- Rejected: restoring the "3+ iterations" e2e forecast (regression from amendment 2); session-level screenshot counter (redundant with per-change budget).

## 2026-06-05 — Verification economy: six amendments applied (Claude Code + Codex)
- Applied six amendments to the four-tier verification policy in `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`: (1) explicit Tier 2/Tier 3 boundary — Tier 2 confirms values, Tier 3 confirms perception; (2) e2e trigger replaced from "3+ iterations forecast" to present-tense test — write/extend only if a test for the surface already exists or the path has a prior regression; (3) hard numeric Tier 3 budget — one capture per change, second only after source fix, third requires written justification, cap covers visual deliverables; (4) Tier 0 escape hatch — trivially satisfied when no static tooling exists, do NOT install tooling to fill the slot; (5) single source of truth for the bans block — no restatement elsewhere; (6) cross-file parity enforced — canonical tier text is token-for-token identical across both files except the Tier 2 tooling paragraph and file-format wrapper.
- Vault mirror (`agents/claude-code/README.md`) updated to reflect all amendments.

## 2026-06-05 — Verification economy: token-efficient proof ladder (Claude Code + Codex)
- Rewrote the verification rules in `~/.claude/CLAUDE.md` from "always use the browser tools / take screenshots" into a four-tier ladder: Tier 0 static (typecheck/lint/build) → Tier 1 tests (write e2e only when a surface is hit 3+ times or is regression-prone) → Tier 2 text runtime inspection (`preview_snapshot`/`preview_inspect`/console/network, not images) → Tier 3 a single screenshot for layout only. Added a banned-habits list (no screenshot→tweak loops, no full-page when a snapshot answers it, no screenshotting text a tool returns).
- Reconciled the conflicting "look at the artifact / always screenshot" lines: visual inspection now scoped to visual deliverables (PDF/HTML parity, resume, aesthetic extraction) as legitimate one-look Tier 3 cases; the aesthetic full-page capture is marked a sanctioned one-and-done exception.
- Mirrored a concise version into `agents/claude-code/README.md`.
- Codex: same policy installed in `C:\Users\kv8n11\.codex\AGENTS.md` (rule 17 folded into Tier 3 cropping, new rule 23 with the tool-neutral ladder using shell-driven headless DOM/CSS dumps, since Codex lacks the preview tools).
- Rationale: screenshots cost ~1.5k+ tokens each and compound every turn they stay in context, so a screenshot feedback loop shortens the session. Text proof first, image last, same rigor.

## 2026-05-31 — Auto-resume mechanism wired up (ccusage + SessionStart hook + /check_reset)
- Installed `ccusage` globally (`npm i -g ccusage`). Reads `~/.claude/projects/*/` usage logs locally — no Anthropic API.
- Added a second SessionStart hook entry in `~/.claude/settings.json` that runs `ccusage blocks --active --json` and injects a `=== CLAUDE 5-HOUR USAGE WINDOW ===` block (start, reset, minutes-to-reset, burn-projection, tokens) into Claude's context every new session.
- Rewrote `global/session-auto-resume.md` from a "user must tell me reset time" rule into a wired-up mechanism: hook delivers the data → I auto-schedule resume via `mcp__scheduled-tasks__create_scheduled_task` only when in-flight work warrants (todo.md has open items, long task in progress, or burn-projection ≤ time-to-reset). `/check_reset` is the on-demand trigger phrase.
- Documented the PowerShell `ConvertFrom-Json` gotcha (returns DateTime with Kind=Utc; do NOT re-Parse — just call .ToLocalTime() directly). Cost two iterations to find this; recorded so it doesn't repeat.

## 2026-05-31 — Global rule: auto-resume at the 5-hour reset
- New file: `global/session-auto-resume.md`. Encodes the rule already in `~/.claude/CLAUDE.md` ("Session Continuity — Auto-Resume at the 5-Hour Reset") as a vault-wide memory so all agents (Hermes, Codex, Cursor, Claude Code) follow it.
- Rule: in heavy sessions, proactively schedule a resume at the reset time via `mcp__scheduled-tasks__create_scheduled_task` / `CronCreate`; leave a breadcrumb in `tasks/todo.md`. Honest limit stated in the file: no last-token-second detection — quota-reset scheduling is the reliable path.
- Mirror saved at `~/.claude/projects/C--Users-kv8n11/memory/feedback_session_auto_resume.md` and indexed in that vault's `MEMORY.md`. `_index.md` updated to list the new global file.
- Built enforced + intentional memory plumbing in `~/.claude/` (not in vault). Recorded vault-side in `knowledge/tools-and-setup/agent-memory-workflow.md`, with rationale in `knowledge/decisions/2026-05-29-memory-loading-via-hooks.md` and user preference in `knowledge/preferences/enforcement-over-best-effort.md`.
- SessionStart hook: auto `git pull` + inject `_index.md` / claude-code README / user-profile each session. SessionEnd hook: auto-commit+push uncommitted vault changes (skips when clean). Both need `/hooks` reload or restart to activate.
- `/save_obsidian` (write only) and `/commit_obsidian` (write + commit + push) slash commands — live immediately. Design principle captured: judgment → slash command, mechanism → hook; don't leave load-bearing behavior to best-effort prompt routines.

## 2026-05-29 — Added knowledge/ general-memory tree (hybrid: type folders + domain tags)
- New top-level `knowledge/` with type-based subfolders: `people/`, `preferences/`, `decisions/`, `tools-and-setup/`, `references/`, `topics/`. Each has a README stating what belongs there.
- Filing model: folder = TYPE of thing; frontmatter `tags` = DOMAIN/area of life (work/personal/finance/health/learning/home, extend freely). Master rules + frontmatter schema in `knowledge/README.md`.
- Purpose: a findable home for general memory that doesn't fit `projects/`, `agents/`, `global/`, or `design-systems/`. Documented in `_index.md`. No memories fabricated — folders + READMEs only. Next: migrate real setup notes (liteparse, obsidian-mcp, Tesseract) from changelog bullets into `tools-and-setup/`.

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

## 2026-06-12 — DocuPipe clone schema draft action
- In `C:\Users\kv8n11\culver-city-surgical-dashboard-docupipe`, added a `Create schema` action to the DocuPipe module editor.
- The action creates a fresh target-specific schema draft, persists it in the clone, and keeps `Duplicate as new` as the exact-copy path.
- Verified in Chrome: the draft state flips to `draft created`, the module selector points at the new schema, and the eligibility preset renders into the JSON schema textarea when `eligibility270` is selected.

## 2026-06-12 — DocuPipe partial import auto-add
- In `C:\Users\kv8n11\culver-city-surgical-dashboard-docupipe`, partial DocuPipe standardizations now auto-import into the dashboard.
- The imported record panel labels these imports as `partial` and shows the missing-field warnings next to the extracted data.
- Verified in Chrome with a synthetic partial claim: the claims queue received `CLM-PARTIAL-002`, the import badge read `partial: professionalClaim837P`, and the dashboard stayed error-free.

## 2026-06-12 — DocuPipe live claim mapping fix
- In `C:\Users\kv8n11\culver-city-surgical-dashboard-docupipe`, live claim standardizations now map DocuPipe's flat claim payload shape into the dashboard preview.
- Verified with `C:\Users\kv8n11\Downloads\Untitled.png` and schema `3CNrau0Z`: the imported record surfaced `Marcus Marquez`, `Anthem Blue Cross CA`, `Dr. Alejandro Reyes, MD`, billed `$20,408`, and the correct CPT line list.

## 2026-06-12 — DocuPipe record editability
- In `C:\Users\kv8n11\culver-city-surgical-dashboard-docupipe`, drawer-level edit support was added for claims, eligibility, providers, payers, enrollments, attachments, appeals, and COB.
- Verified in Chrome: claim rows save inline corrections for patient, billed, paid, CPT, and diagnosis fields; provider rows save name, specialty, NPI, taxonomy, and enrollment counts.
