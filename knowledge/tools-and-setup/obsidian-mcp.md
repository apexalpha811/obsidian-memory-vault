---
title: obsidian-mcp — Obsidian access to this vault
type: tool
tags: [work]
created: 2026-05-29
updated: 2026-05-29
---

`obsidian-mcp` gives agents Obsidian-native tools over this memory vault (search, read,
create, edit, tags, backlinks). Used by **both Codex and Claude Code**, read+write, against
the same vault via a junction.

## Setup
- Installed globally: `C:\Users\kv8n11\AppData\Roaming\npm\node_modules\obsidian-mcp\build\main.js`.
- Points at the dotless junction `C:\Users\kv8n11\agent-memory-vault` →
  `C:\Users\kv8n11\.agent-memory` (the real vault). The junction exists because obsidian-mcp
  hard-rejects dot-prefixed vault paths ("Contains hidden directories").
- **Codex**: configured in `C:\Users\kv8n11\.codex\config.toml` as `[mcp_servers.obsidian]`.
- **Claude Code**: registered at user/global scope in `C:\Users\kv8n11\.claude.json`
  (top-level `mcpServers`, beside `codegraph`) via
  `claude mcp add obsidian -s user -- node <main.js> C:\Users\kv8n11\agent-memory-vault`.
  Loads in every project; tools bind at session start.

## Tools (11)
`create-note`, `read-note`, `edit-note`, `search-vault`, `move-note`, `delete-note`,
`add-tags`, `remove-tags`, `rename-tag`, `create-directory`, `list-available-vaults`.

## Gotchas
- Every tool call takes `vault: "agent-memory-vault"`.
- `delete-note` requires `path` + `reason` (and `permanent` bool) — NOT `filename`.
- `create-note` takes `vault`, `filename`, `content`, optional `folder`.
- Never point the server at `.agent-memory` directly (dot path is rejected). If the junction
  is ever missing, recreate it:
  `New-Item -ItemType Junction -Path "C:\Users\kv8n11\agent-memory-vault" -Target "C:\Users\kv8n11\.agent-memory"`
- File tools + git remain the PRIMARY write path (precise edits, commit/push routine). Use the
  MCP for content search, `[[wikilink]]` backlinks, and tag ops.

## Verify
Server validated the junction and served all 11 tools; `search-vault` returned hits and
`create-note`/`delete-note` round-tripped a scratch note with zero residue (2026-05-29).
