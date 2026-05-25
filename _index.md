# Agent Memory Vault

Persistent knowledge base shared between human and AI agents. All files are plain markdown — readable by Claude Code, Codex, Hermes, Cursor, or any text editor.

## Structure

```
~/.agent-memory/
├── _index.md                 # You are here
├── CLAUDE.md                 # Agent instructions (read this first if you're Claude Code)
├── preferences/
│   └── user.md               # Operating rules, timezone, profile
├── design-systems/
│   ├── a-nation-media.md     # A-NATION aesthetic template
│   └── transform9.md         # Transform9 aesthetic template
├── projects/
│   └── x-scrapers.md         # X scraping infrastructure
├── meta/
│   └── changelog.md          # What was added and when
└── logs/                     # Session notes
```

## Quick Reference

- **Timezone:** 12-hour PST always
- **User:** @tha2844 on X
- **Zip:** 90094
- **Cron delivery:** Use explicit `telegram:CHAT_ID` — `origin` and `no_agent` silently fail
- **Dedup rule:** Every cron job needs cross-run dedup with 48h auto-prune
- **API retries:** max_retries: 5 on deepseek-v4-flash, fallback stepfun/step-3.5-flash (OpenRouter)
