# Changelog

## 2026-05-24 — Vault restructured: global/ vs agents/ split

- **New folder structure:**
  - `global/` — applies to ALL agents (user profile, timezone)
  - `agents/hermes/` — Hermes-only config (API retry, Telegram, cron dedup)
  - `agents/claude-code/` — Claude Code-only instructions (aesthetic extraction, vault maintenance)
- Removed `preferences/user.md` — split into `global/user-profile.md` + `agents/hermes/README.md`
- Rewrote root `CLAUDE.md` as dispatcher: load global/ + your agent folder
- Updated `_index.md` with new structure and rules
- **Global rule:** only update global/ when user explicitly says "globally" or "global"
- **Agent isolation:** agents/hermes/ is ignored by Claude Code and vice versa

## 2026-05-24 — Added CLAUDE.md for Claude Code compatibility

- `CLAUDE.md` — full agent instructions with aesthetic extraction workflow, save/push procedures, rules
- Updated `_index.md` to reference CLAUDE.md
- Pushed to GitHub: `github.com/apexalpha811/obsidian-memory-vault`

## 2026-05-24 — Vault created

- Initial vault structure set up
- `preferences/user.md` — operating rules, timezone, delivery settings
- `design-systems/a-nation-media.md` — A-NATION design template
- `design-systems/transform9.md` — Transform9 design template
- Memory store pruned to essentials + vault path pointer
