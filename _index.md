# Agent Memory Vault

Persistent knowledge base shared between AI agents. All files are plain markdown — readable by Hermes, Claude Code, Codex, Cursor, or any text editor.

## Structure

```
~/.agent-memory/
├── _index.md                      # You are here
├── CLAUDE.md                      # Root instructions — read me first
├── global/
│   ├── user-profile.md            # [GLOBAL] Identity, operating rules, plan-first
│   └── timezone.md                # [GLOBAL] 12-hour PST, never UTC
├── agents/
│   ├── hermes/
│   │   └── README.md              # [HERMES ONLY] API retry, Telegram, cron dedup
│   └── claude-code/
│       └── README.md              # [CLAUDE CODE ONLY] Aesthetic extraction, vault maintenance
├── design-systems/                # [SHARED] Website aesthetic templates
├── projects/                      # [SHARED] Project documentation
├── meta/
│   └── changelog.md               # What was added and when
└── logs/                          # Session notes (optional)
```

## Quick Reference

- **Timezone:** 12-hour PST always
- **User:** @tha2844 on X
- **Zip:** 90094

## Rules

- **Global = everyone.** Files in `global/` apply to ALL agents connected to this vault.
- **Agent-specific = isolated.** Files in `agents/hermes/` are Hermes-only. `agents/claude-code/` is Claude Code-only.
- **Shared = anyone can write.** `design-systems/`, `projects/`, and `meta/` are cross-agent.
- **Plan-first.** Present plan, get approval before implementing.
- **Push changes.** Write → commit → push.
