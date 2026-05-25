# Obsidian Memory Vault

A persistent markdown knowledge base that gives AI agents long-term memory. Works with **any agent** — Claude Code, Hermes, Codex, Cursor, or whatever comes next.

## How It Works

Instead of relying on each agent's limited built-in memory (typically 2K–4K characters), this vault stores everything in plain markdown files inside a git repo. Every agent reads from it, writes to it, and pushes changes back.

```
~/.agent-memory/
├── _index.md            # Master index
├── CLAUDE.md            # Root instructions — agents read this first
├── global/              # [ALL AGENTS] User profile, timezone, operating rules
├── agents/              # [PER AGENT] Isolated config per agent type
│   ├── hermes/
│   └── claude-code/
├── design-systems/      # [SHARED] Website aesthetic templates
├── projects/            # [SHARED] Project documentation
└── meta/changelog.md
```

## Features

- **Unlimited memory** — markdown files, not 2K char slots
- **Cross-agent sharing** — design systems, projects, and preferences work across any agent
- **Agent isolation** — Hermes config doesn't leak into Claude Code and vice versa
- **Git-backed** — history, diff, rollback, clone anywhere
- **Zero dependencies** — plain .md files, works with any text editor

## Quick Start

### 1. Fork or clone this repo

```bash
git clone <your-fork-url> ~/.agent-memory
```

### 2. Fill in your details

Edit the placeholders in:
- `global/user-profile.md` — your name, handle, preferences
- `global/timezone.md` — your timezone
- `agents/hermes/README.md` — your Hermes-specific config (optional)
- `agents/claude-code/README.md` — your Claude Code config (optional)

### 3. Point your agent to it

**Claude Code CLI:**
```bash
# Create global config that loads on every session
mkdir -p ~/.claude
```

Then write `~/.claude/CLAUDE.md` with:

```
# CLAUDE.md — Global Memory System

## Session Start
1. git -C ~/.agent-memory pull
2. Read ~/.agent-memory/_index.md
3. Read ~/.agent-memory/agents/claude-code/README.md
4. Read ~/.agent-memory/global/user-profile.md
5. Read ~/.agent-memory/global/timezone.md
6. Load any design-system or project files relevant to the task

## Session End
1. Save new info to the vault
2. Update meta/changelog.md
3. Commit and push
```

**Hermes Agent:** Add to memory: `Memory vault at ~/.agent-memory/. Load global/ at start, then agents/hermes/ for agent-specific config.`

**Any other agent:** Read `CLAUDE.md` in the vault root — it's a dispatcher that tells each agent where to look.

### 4. Start using it

Every conversation now has permanent memory. Tell your agent:

- "get this website's aesthetic: https://example.com" — extracts and saves a design template
- "save that preference to the vault" — writes to your profile
- "what do we know about project X?" — loads relevant vault files

## Architecture

| Directory | Who reads it | When to update |
|---|---|---|
| `global/` | Every agent | Only when the user says "globally" or "global" |
| `agents/hermes/` | Hermes only | Never — other agents skip it |
| `agents/claude-code/` | Claude Code only | Never — other agents skip it |
| `design-systems/` | Any agent | Every time you extract a website aesthetic |
| `projects/` | Any agent | When starting/updating a project |
| `meta/` | Any agent | On every change |

## The Rule

> Unless you say "globally" or "global", each agent writes only to its own `agents/` folder. Global files affect every agent connected to the vault.

---

**Built for [apexalpha811/obsidian-memory-vault](https://github.com/apexalpha811/obsidian-memory-vault). Fork and make it yours.**
