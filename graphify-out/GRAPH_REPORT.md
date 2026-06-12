# Graph Report - .agent-memory  (2026-06-12)

## Corpus Check
- 171 files · ~118,628 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 49 nodes · 44 edges · 6 communities
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `a8b9e3c4`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]

## God Nodes (most connected - your core abstractions)
1. `Changelog` - 18 edges
2. `Claude Code — Agent-Specific Instructions` - 7 edges
3. `Culver City Surgical Dashboard DocuPipe` - 6 edges
4. `Required Actions` - 4 edges
5. `Codex Agent Memory` - 3 edges
6. `Durable Lessons` - 3 edges
7. `Projects` - 3 edges
8. `Integration Routing Lessons` - 2 edges
9. `Local Environment & Tooling (this machine — Windows)` - 2 edges
10. `About This Vault` - 1 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Import Cycles
- None detected.

## Communities (6 total, 0 thin omitted)

### Community 0 - "Community 0"
Cohesion: 0.11
Nodes (18): 2026-05-28 — liteparse installed as primary document parser (Claude Code, Windows), 2026-05-29 — Added knowledge/ general-memory tree (hybrid: type folders + domain tags), 2026-05-29 — Claude Code wired to Obsidian vault via obsidian-mcp (global, read+write), 2026-05-31 — Auto-resume mechanism wired up (ccusage + SessionStart hook + /check_reset), 2026-05-31 — Global rule: auto-resume at the 5-hour reset, 2026-06-05 — Verification economy: six amendments applied (Claude Code + Codex), 2026-06-05 — Verification economy: stop conditions, not-notation rewrite, narration rule, 2026-06-05 — Verification economy: token-efficient proof ladder (Claude Code + Codex) (+10 more)

### Community 1 - "Community 1"
Cohesion: 0.29
Nodes (6): Added Clone Files, Culver City Surgical Dashboard DocuPipe, Current State, Location, Next, Verification

### Community 2 - "Community 2"
Cohesion: 0.50
Nodes (3): Active Projects, Projects, Standard Project Structure

### Community 3 - "Community 3"
Cohesion: 0.33
Nodes (5): Codex Agent Memory, Durable Lessons, Integration routing configs are production data, Session Start, Verify values, not just success responses

### Community 4 - "Community 4"
Cohesion: 0.22
Nodes (8): About This Vault, Claude Code — Agent-Specific Instructions, Document parsing — liteparse is the primary tool, DocuPipe, Stedi, and dashboard parsing, Git Setup, Integration Routing Lessons, Local Environment & Tooling (this machine — Windows), Verification economy (token-efficient proof)

### Community 5 - "Community 5"
Cohesion: 0.50
Nodes (4): At session end, At session start, Required Actions, Website aesthetic extraction

## Knowledge Gaps
- **35 isolated node(s):** `About This Vault`, `At session start`, `Website aesthetic extraction`, `At session end`, `Verification economy (token-efficient proof)` (+30 more)
  These have ≤1 connection - possible missing edges or undocumented components.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Claude Code — Agent-Specific Instructions` connect `Community 4` to `Community 5`?**
  _High betweenness centrality (0.051) - this node is a cross-community bridge._
- **Why does `Required Actions` connect `Community 5` to `Community 4`?**
  _High betweenness centrality (0.027) - this node is a cross-community bridge._
- **What connects `About This Vault`, `At session start`, `Website aesthetic extraction` to the rest of the system?**
  _35 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.10526315789473684 - nodes in this community are weakly interconnected._