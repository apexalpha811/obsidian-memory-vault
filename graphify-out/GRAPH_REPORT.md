# Graph Report - .agent-memory  (2026-08-19)

## Corpus Check
- 173 files · ~119,620 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 65 nodes · 58 edges · 7 communities
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `9925b96a`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]

## God Nodes (most connected - your core abstractions)
1. `Changelog` - 21 edges
2. `Culver City Wellness Website Session Handoff` - 7 edges
3. `Claude Code — Agent-Specific Instructions` - 7 edges
4. `Culver City Surgical Dashboard DocuPipe` - 6 edges
5. `Close every job explicitly` - 4 edges
6. `Required Actions` - 4 edges
7. `Projects` - 3 edges
8. `Codex Agent Memory` - 3 edges
9. `Durable Lessons` - 3 edges
10. `Integration Routing Lessons` - 2 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Import Cycles
- None detected.

## Communities (7 total, 0 thin omitted)

### Community 0 - "Community 0"
Cohesion: 0.09
Nodes (21): 2026-05-28 — liteparse installed as primary document parser (Claude Code, Windows), 2026-05-29 — Added knowledge/ general-memory tree (hybrid: type folders + domain tags), 2026-05-29 — Claude Code wired to Obsidian vault via obsidian-mcp (global, read+write), 2026-05-31 — Auto-resume mechanism wired up (ccusage + SessionStart hook + /check_reset), 2026-05-31 — Global rule: auto-resume at the 5-hour reset, 2026-06-05 — Verification economy: six amendments applied (Claude Code + Codex), 2026-06-05 — Verification economy: stop conditions, not-notation rewrite, narration rule, 2026-06-05 — Verification economy: token-efficient proof ladder (Claude Code + Codex) (+13 more)

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
Cohesion: 0.15
Nodes (12): About This Vault, At session end, At session start, Claude Code — Agent-Specific Instructions, Document parsing — liteparse is the primary tool, DocuPipe, Stedi, and dashboard parsing, Git Setup, Integration Routing Lessons (+4 more)

### Community 5 - "Community 5"
Cohesion: 0.25
Nodes (7): Boundaries, Completed, Culver City Wellness Website Session Handoff, Current state, Remaining, Resume, Verified

### Community 6 - "Community 6"
Cohesion: 0.40
Nodes (4): Close every job explicitly, How to apply, Where this is enforced, Why

## Knowledge Gaps
- **47 isolated node(s):** `Why`, `How to apply`, `Where this is enforced`, `2026-06-17 - PDF export pagination lesson`, `2026-06-12 - Claude Code DocuPipe routing lesson` (+42 more)
  These have ≤1 connection - possible missing edges or undocumented components.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What connects `Why`, `How to apply`, `Where this is enforced` to the rest of the system?**
  _47 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.09090909090909091 - nodes in this community are weakly interconnected._