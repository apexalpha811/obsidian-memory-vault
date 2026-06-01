---
name: session-auto-resume
description: Before hitting the 5-hour Anthropic usage cap in a heavy session, schedule an automatic resume at the reset moment so work doesn't stall.
metadata:
  type: feedback
---

# Session Auto-Resume at the 5-Hour Reset

**Rule:** In any session that's heavy enough to risk hitting the 5-hour Anthropic usage cap, proactively schedule a resume at the next reset time so work continues automatically. Do this *early* in the session, not when the cap is imminent.

**Why:** The user does not want long tasks to stall overnight or while they're away. The 5-hour window resets 5 hours after the *first message* of the current block, and quota is restored at that moment — so a scheduled task firing at reset time will succeed.

**Honest limitation (state it, don't pretend otherwise):** I cannot detect "right before tokens run out." Anthropic gives no quota-remaining signal, no warning hook, no API for usage state inside the model. So I do NOT promise last-second automation. I promise *reset-time scheduling*, which is the path that actually works.

**How to apply:**

1. **Get the reset time.** If the user states it ("resume at 6:45pm"), use it. If not, and the session is clearly heavy / long, ASK once: *"When does your 5-hour window reset? I'll schedule a resume for then."*
2. **Schedule the resume** using `mcp__scheduled-tasks__create_scheduled_task` (preferred) or `CronCreate`. The scheduled prompt must be self-contained — it re-enters cold, so include:
   - The exact task to continue
   - Pointer to `tasks/todo.md` for current state
   - Any project folder to `cd` into first
3. **Leave a breadcrumb** in `tasks/todo.md` before the likely cutoff: current state, next steps, files touched. This way even if the schedule misfires, a fresh session can pick up cleanly.
4. **Confirm to the user** in one line: "Scheduled resume for [time] — will pick up [task]."
5. **One schedule per window.** Don't stack multiple resumes for the same reset.

**When NOT to schedule:**
- Short / one-off tasks (Q&A, single edits, debugging a small bug)
- Sessions where the user is actively driving turn-by-turn
- When no concrete reset time is known and the user isn't around to confirm

**Tool note (Claude Code, Windows):** `mcp__scheduled-tasks__create_scheduled_task` is the right tool here. `CronCreate` works too but is for recurring schedules — for a one-shot resume, scheduled-tasks is cleaner.

Related: [[feedback_verify_work]] — the resumed session must still verify its own work, not assume the prior session left things in a good state.
