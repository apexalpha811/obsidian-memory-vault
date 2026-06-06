# Graphify Knowledge Graphs

Auto-generated knowledge graphs for all projects. Each subfolder is an Obsidian vault export from a fully-built graph.

## How to use

From inside any project folder in Claude Code, Codex, or Hermes:

```
/graphify query "how does X work?"
/graphify path "ComponentA" "ComponentB"
/graphify explain "SomeFunction"
/graphify . --update    # refresh after file changes
```

## Fully graphed projects (GRAPH_REPORT.md ready)

- **email-mcp-server** — `C:\Users\kv8n11\Desktop\email-mcp-server\graphify-out\` — 68 nodes, 81 edges, 7 communities
- **resume** — `C:\Users\kv8n11\Desktop\resume\graphify-out\` — 11 nodes, 10 edges, 1 community

## Needs API key for full semantic extraction

The projects below have code extracted but docs/images were skipped (no LLM key at build time). To complete them, set `GEMINI_API_KEY` (free via Google AI Studio) and re-run `/graphify . --update` inside each project.

Projects: anation-hero, availity-parser, ccs_pain_chart_form_EN, claude, claudetest, clinic, culver, culver_v2, deepseek, docupipe, mission-control, pmpretty, rejuvanate-design, websites, AIS-OS, anthropic-skills, codegraph, Firecrawl-copycat, hermes-agent, polishmepretty, skills, tasks

## To add a new project

```bash
cd /path/to/project
/graphify .
```

With Gemini key for full semantic extraction (docs, PDFs, images):
```bash
GEMINI_API_KEY=your_key /graphify .
```
