---
title: Agent memory workflow — hooks + slash commands (Claude Code)
type: tool
tags: [work]
created: 2026-05-29
updated: 2026-05-29
---

How Claude Code loads and saves this vault. These live in `~/.claude/` (NOT in the vault),
so this note is the vault-side record of them. Built 2026-05-29. Reasoning: [[2026-05-29-memory-loading-via-hooks]].

## Components

| Piece | Where | Activates | Job |
|---|---|---|---|
| SessionStart hook | `~/.claude/settings.json` → `hooks.SessionStart` | on reload/restart | `git pull` the vault + inject `_index.md`, `agents/claude-code/README.md`, `global/user-profile.md` into context every session |
| SessionEnd hook | `~/.claude/settings.json` → `hooks.SessionEnd` | on reload/restart | Backstop: if `git status --porcelain` is non-empty, auto `add -A` + commit + push. Skips when clean (no empty commits) |
| `/save_obsidian` | `~/.claude/commands/save_obsidian.md` | immediately | Review session, write new memory into `knowledge/` etc. — NO git |
| `/commit_obsidian` | `~/.claude/commands/commit_obsidian.md` | immediately | Do `/save_obsidian`'s steps, then commit + push |

Both hooks use `"shell": "powershell"` (Windows). See [[obsidian-mcp]] for the MCP layer.

## Reliability tiers (deliberate)
- **Slash commands = intentional** (user invokes; judgment-heavy "what to remember" done by Claude).
- **Hooks = enforced** (harness runs them; pure mechanism, no judgment).
- CLAUDE.md session-start prose routine = best-effort (can be skipped — it was, this session).

## Gotchas
- Hooks added mid-session need `/hooks` (reload) or restart to take effect — Claude Code's
  settings watcher only tracks dirs that had a settings file at session start.
- `SessionEnd` firing is NOT guaranteed on every exit (clean `/exit` likely; hard kill /
  window-close / crash uncertain, ~70% confidence). Treat `/commit_obsidian` as the real save,
  the hook as insurance.
- A hook runs a script, not Claude — it can commit already-written files but cannot DECIDE
  what's worth remembering. That half is the slash command's job.

## Verify
JSON validated; SessionStart command emits ~7.4 KB of vault content; SessionEnd guard
correctly skips on a clean tree (2026-05-29).
