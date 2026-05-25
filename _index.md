# Agent Memory Vault

Persistent knowledge base shared between AI agents. All files are plain markdown — readable by Hermes, Claude Code, Codex, Cursor, or any text editor.

## Structure

```
~/.agent-memory/
├── _index.md                      # You are here
├── README.md                      # Overview and setup instructions
├── CLAUDE.md                      # Root instructions — read me first
├── global/
│   ├── user-profile.md            # [GLOBAL] Identity, operating rules (fill this in)
│   └── timezone.md                # [GLOBAL] Timezone (fill this in)
├── agents/
│   ├── hermes/
│   │   └── README.md              # [HERMES ONLY] Hermes-specific config
│   └── claude-code/
│       └── README.md              # [CLAUDE CODE ONLY] Aesthetic extraction, vault maintenance
├── design-systems/                # [SHARED] Website aesthetic templates
├── projects/                      # [SHARED] Project documentation
├── meta/
│   └── changelog.md               # What was added and when
└── logs/                          # Session notes (optional)
```

## Quick Start

1. Clone: `git clone <your-repo-url> ~/.agent-memory`
2. Fill in `global/user-profile.md` and `global/timezone.md`
3. Point your agent at it (see README.md for instructions)
4. Start using it — every agent reads/writes to this vault

## Rules

- **Global = everyone.** Files in `global/` apply to ALL agents.
- **Agent-specific = isolated.** `agents/hermes/` is Hermes-only. `agents/claude-code/` is Claude Code-only.
- **Shared = anyone can write.** `design-systems/`, `projects/`, and `meta/` are cross-agent.
- **Plan-first.** Present plan, get approval before implementing.
- **Push changes.** Write → commit → push.
