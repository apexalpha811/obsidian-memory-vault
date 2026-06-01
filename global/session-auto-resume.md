---
name: session-auto-resume
description: Auto-check the 5-hour usage window at every session start via ccusage hook; auto-schedule a resume when in-flight work would be cut off; respond to /check_reset on demand.
metadata:
  type: feedback
---

# Session Auto-Resume at the 5-Hour Reset

## How the data reaches me

Anthropic does NOT expose remaining-quota or reset-time from inside the model. State this honestly when explaining limits. The reset time IS knowable from outside — `ccusage` reads Claude Code's local usage logs in `~/.claude/projects/*/` and computes the rolling 5-hour block.

**Wired up (Claude Code, Windows):**
- `ccusage` is installed globally (`npm i -g ccusage`). Verified working.
- A SessionStart hook in `~/.claude/settings.json` runs `ccusage blocks --active --json` at every session start and injects a block summary into my context. The hook lives in the SessionStart array alongside the agent-memory loader.

The injected summary looks like:
```
=== CLAUDE 5-HOUR USAGE WINDOW (auto-loaded) ===
Block started:  YYYY-MM-DD HH:MM local  (HH:MM UTC)
Window resets:  YYYY-MM-DD HH:MM local  (HH:MM UTC)
Time to reset:  N wall-clock minutes
Burn-projected usage-minutes left: N
Tokens used: N,NNN  |  Projected total: N,NNN
=== End usage window ===
```

If the block is missing (`Burn-projected usage-minutes left` ≥ `Time to reset` with large headroom), the user has plenty of room. If burn-projected ≤ time-to-reset, they're on track to hit the cap before the window ends.

## Rule 1 — Auto-schedule resume at session start (when warranted)

When the SessionStart hook reports an active block, judge whether to auto-schedule a resume for `Window resets` time:

**Auto-schedule when ANY of these are true:**
- `tasks/todo.md` exists with open (unchecked) items — clear in-flight work
- The user opens the session with a clearly long-running task ("build", "research the entire X", "audit all of Y", multi-step plan-mode work)
- Burn-projected usage-minutes left ≤ Time to reset (i.e. cap will hit before window ends)

**Do NOT auto-schedule when:**
- It's clearly a one-off Q&A, single-file fix, or short conversation
- A scheduled task already exists for this block's reset time (check via `mcp__scheduled-tasks__list_scheduled_tasks` if available before creating)
- The user has explicitly said "no scheduling" this session

**Scheduling mechanics:**
- Use `mcp__scheduled-tasks__create_scheduled_task` (one-shot, preferred) — NOT `CronCreate` unless recurring is genuinely wanted.
- The scheduled prompt is self-contained — re-enters cold. Include: (a) what task to continue, (b) "Read `tasks/todo.md`" pointer, (c) any project folder to `cd` into first, (d) reminder to verify work.
- Confirm in one line: "Scheduled resume for [local time] — will pick up [task]."
- One schedule per block reset. Don't stack.

## Rule 2 — `/check_reset` trigger phrase

When the user types `/check_reset` (exact match, case-insensitive, possibly with surrounding text), do this:

1. Run `ccusage blocks --active --json` via Bash/PowerShell.
2. Parse it with the same logic the hook uses. **Critical gotcha:** PowerShell's `ConvertFrom-Json` returns DateTime objects with `Kind=Utc` already — do NOT re-parse via `[datetime]::Parse` or `[DateTimeOffset]::Parse`, that strips the timezone and shifts by the local offset. Just call `.ToLocalTime()` directly on the parsed property.
3. Report back: block start (local), window reset (local), wall-clock minutes to reset, burn-projected usage-minutes left, tokens used vs projected total.
4. If there's clear in-flight work and no scheduled resume exists for this window, offer: "Want me to schedule a resume for [reset time]?"

## Why the schedule is just a backup

The schedule fires a fresh Claude Code session at the reset moment. It works because quota is restored at reset. But it's a *backup* — the goal is for the user to be able to walk away, hit the cap mid-task, and not lose progress. So:

- The scheduled prompt must point at a breadcrumb in `tasks/todo.md`, not assume in-memory context survives.
- Before any likely cutoff, WRITE current state + next steps to `tasks/todo.md`. This is the load-bearing artifact.
- The resumed session must verify the prior session's claimed progress, not trust it. (See [[feedback_verify_work]].)

## Honest limitations to state when relevant

- Cannot detect "the last token before cutoff." No signal exists from Anthropic to the model for this.
- ccusage reads local logs — if the user is signed in on multiple machines hitting the same plan, ccusage on machine A doesn't see machine B's usage. Reset time is still accurate (it's based on first-message timestamp), but burn-projection underestimates.
- ccusage's `endTime` is `startTime + 5h` — this is the block boundary, which is when quota refills. That's the actual reset moment.

## Related
- [[feedback_verify_work]] — resumed sessions verify, never assume.
- Mirror in Claude Code's auto-memory: `feedback_session_auto_resume.md` indexed in `MEMORY.md`.
- The CLAUDE.md root rule "Session Continuity — Auto-Resume at the 5-Hour Reset" pre-dates this mechanism and aligns with it.
