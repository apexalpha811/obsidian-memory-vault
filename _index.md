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
│   ├── timezone.md                # [GLOBAL] Timezone (fill this in)
│   ├── session-auto-resume.md     # [GLOBAL] Schedule resume at the 5-hour reset in heavy sessions
│   └── time-format.md             # [GLOBAL] Always 12-hour clock, Pacific Time, for user-facing times
├── agents/
│   ├── hermes/
│   │   └── README.md              # [HERMES ONLY] Hermes-specific config
│   └── claude-code/
│       └── README.md              # [CLAUDE CODE ONLY] Aesthetic extraction, vault maintenance
├── design-systems/                # [SHARED] Website aesthetic templates
├── projects/                      # [SHARED] Project documentation
├── knowledge/                     # [SHARED] General memory about things (see knowledge/README.md)
│   ├── people/                    #   one note per person
│   ├── preferences/               #   how the user likes things done
│   ├── decisions/                 #   durable choices + why (ADR-style)
│   ├── tools-and-setup/           #   environment, tooling, gotchas
│   ├── references/                #   pointers to external systems
│   └── topics/                    #   domain facts / subjects of interest
├── meta/
│   └── changelog.md               # What was added and when
└── logs/                          # Session notes (optional)
```

## knowledge/ — general memory (hybrid: type folders + domain tags)

Folder = TYPE of thing; frontmatter `tags` = DOMAIN (work/personal/finance/…). File by
primary type, link cross-cutting notes with `[[wikilinks]]`. Full filing rules, frontmatter
schema, and tag vocabulary live in `knowledge/README.md`.

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
