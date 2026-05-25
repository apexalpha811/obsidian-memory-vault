# Agent Memory Vault — Root Instructions

This vault is shared between multiple AI agents. Load only what applies to you.

## How to use this vault

1. **Identify yourself.** Are you Hermes Agent? Claude Code? Codex? Cursor?
2. **Load global/** — these apply to every agent. Always read:
   - `global/user-profile.md` — identity, operating rules, hard rules
   - `global/timezone.md` — 12-hour PST, never UTC
3. **Load your agent folder** — read the README in your specific folder:
   - Hermes Agent → `agents/hermes/README.md`
   - Claude Code → `agents/claude-code/README.md`
   - Unknown agent → read both and figure out what applies
4. **Do NOT read other agent's folders** — they contain config specific to that agent

## Shared resources (any agent can read/write)
- `design-systems/` — website aesthetic templates
- `projects/` — project documentation
- `meta/changelog.md` — what changed and when
- `_index.md` — master index

## Key rules
- **Global rules are mandatory.** If it's in global/, it applies to you.
- **Agent-specific rules are optional.** Only follow your own.
- **Plan-first.** Present a plan and get approval before implementing.
- **Push changes.** After writing to the vault, commit and push to GitHub.
