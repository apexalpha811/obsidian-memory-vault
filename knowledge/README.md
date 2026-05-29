# Knowledge — general memory about things

This tree holds durable, general-purpose memory that isn't tied to a single project
(`../projects/`), an agent's config (`../agents/`), the global operating rules
(`../global/`), or a website aesthetic (`../design-systems/`).

## How filing works (hybrid model)

- **Folder = TYPE of thing.** "What kind of thing is this note about?" decides the folder.
- **Frontmatter `tags` = DOMAIN / area of life.** Lets recall slice across types.

So a note's *location* answers "what kind of thing," and its *tags* answer "what area."
`search-vault` finds by content; the `add-tags` / `remove-tags` / `rename-tag` MCP tools
manage the domain axis.

## Folders (types)

| Folder | What goes here | Example filenames |
|---|---|---|
| `people/` | One note per person — collaborators, contacts, family | `jane-doe.md` |
| `preferences/` | How the user likes things done (style, tools, comms, formatting) | `writing-style.md`, `email-tone.md` |
| `decisions/` | Durable choices + the reasoning behind them (ADR-style) | `2026-05-29-obsidian-mcp.md` |
| `tools-and-setup/` | Environment, installed tooling, configs, gotchas | `liteparse.md`, `obsidian-mcp.md` |
| `references/` | Pointers to external systems — repos, dashboards, accounts, channels | `github-repos.md` |
| `topics/` | Domain facts / subjects the user cares about | `<subject>.md` |

If a note plausibly fits two folders, file by its **primary** type and link the other
with `[[wikilink]]`. Don't duplicate.

## Frontmatter schema (every note)

```yaml
---
title: Short human title
type: person | preference | decision | tool | reference | topic
tags: [work]            # domain(s) — see vocabulary below; one or more
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

Body: lead with the fact/decision. For decisions and preferences, include a **Why:** line
(the reasoning) and a **How to apply:** line (when it kicks in). Link related notes with
`[[name]]`.

## Domain tag vocabulary (starter — extend freely)

`work` · `personal` · `finance` · `health` · `learning` · `home`

Keep tags lowercase and singular. A note may carry several (`tags: [personal, finance]`).
Add new domains as needed, but reuse existing ones first so recall stays consistent —
use `rename-tag` to consolidate drift rather than inventing near-duplicates.

## Filenames

`kebab-case.md`, descriptive, no dates except for `decisions/` (prefix `YYYY-MM-DD-`).
One subject per file — small linked notes beat one giant note.
