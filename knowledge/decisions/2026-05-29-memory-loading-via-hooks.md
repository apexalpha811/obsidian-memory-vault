---
title: Enforce vault load/save via hooks + explicit slash commands, not prompt routine or trigger words
type: decision
tags: [work]
created: 2026-05-29
updated: 2026-05-29
---

**Decision:** Make memory loading and saving reliable by moving the load-bearing parts onto
harness-enforced **hooks** and explicit **slash commands**, instead of relying on the
CLAUDE.md prose routine or a magic trigger word.

**Why:** The CLAUDE.md "read the vault at session start" routine is best-effort — Claude can
deprioritize it when a task grabs attention (it did exactly that this session: the routine was
in context and got skipped). Best-effort instructions are not a guarantee.

**Alternatives considered:**
- *Bare trigger words "end"/"exit"* to save — rejected: (1) same best-effort gap (relies on
  Claude noticing), (2) false-fires on ordinary text ("exit code 1", "let's end with…").
- *A single SessionEnd hook to do everything* — rejected as the primary path: a hook runs a
  script, so it can commit files but cannot reason about WHAT to capture.

**How to apply:**
- Loading: SessionStart hook auto-pulls + injects key vault files every session (enforced).
- Saving (judgment): `/save_obsidian` (write only) and `/commit_obsidian` (write + push) —
  explicit, unambiguous, no false-fire.
- Saving (mechanism): SessionEnd hook auto-commits any already-written changes as a backstop.
- General rule: put *judgment* in slash commands, *mechanism* in hooks; never leave a
  load-bearing behavior to a best-effort prompt routine.

Implementation details: [[agent-memory-workflow]]. Related: [[enforcement-over-best-effort]].
