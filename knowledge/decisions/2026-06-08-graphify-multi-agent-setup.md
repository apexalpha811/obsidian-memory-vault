---
date: 2026-06-08
title: Graphify Multi-Agent Knowledge Graph Setup
tags: [graphify, multi-agent, hermes, claude-code, codex, knowledge-graph]
---

# Graphify Multi-Agent Knowledge Graph Setup

## What was built

A shared knowledge graph connecting Claude Code, Codex, and Hermes across two Windows laptops, sourced from the agent memory vault.

## Architecture

**Source:** `C:\Users\kv8n11\.agent-memory` (Laptop A)
**Graph outputs:** `C:\Users\kv8n11\graphify\graphify-out\`
**GitHub repo:** https://github.com/apexalpha811/graphify.git

**Laptop A (kv8n11) — Claude Code + Codex**
- `~/graphify/` git repo pushed to GitHub
- Post-commit hook installed in `~/.agent-memory/.git/hooks/post-commit` — rebuilds graph automatically on every memory commit
- Claude Code connected via `graphify install`
- Codex connected via `graphify install --platform codex`

**Laptop B (kaden) — Hermes**
- Cloned same repo to `C:\Users\kaden\graphify\`
- No graphify CLI needed — reads `graph.json` and `GRAPH_REPORT.md` directly
- Pulls latest before each session: `git -C C:\Users\kaden\graphify pull`

## Graph stats (initial build, 2026-06-08)

- 184 nodes, 190 edges, 23 communities
- Source: 168 files, ~117k words
- Key communities: Agent Memory Vault Structure, Multi-Agent System, CCS Pain Chart Form, Claude Code Config, A-NATION Brand Guidelines, Memory Design Decisions

## Daily sync workflow

On Laptop A after any session where memories are saved:
```
git -C C:\Users\kv8n11\graphify add .
git commit -m "update graph"
git push
```

On Laptop B before each Hermes session:
```
git -C C:\Users\kaden\graphify pull
```

## Why graphify lives separately from agent-memory

Graph outputs (40k+ files when obsidian export is included) are too noisy to live inside the memory vault. The dedicated `graphify` repo keeps outputs isolated while the vault stays lean as the source of truth.

## Notes

- `.obsidian/plugins/` JS files were excluded from the graph (dataview and obsidian-git minified code produced 2,730 noise nodes)
- Firecrawl-copycat and ccs_pain_chart_form_EN saved graphs archived to `~/.agent-memory/Archive/saved-graphs/` before the graphs/ folder was deleted
