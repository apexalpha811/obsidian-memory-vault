---
name: time-format
description: Always display times in 12-hour clock with AM/PM, in Pacific Time (PT). Applies to every agent and every context — chat replies, scheduled-task confirmations, log summaries, file timestamps, calendar references.
metadata:
  type: feedback
---

# Time Format — Always 12-Hour, Pacific Time

**Rule:** When displaying any time to the user, use **12-hour clock with AM/PM** and **Pacific Time** (PT — automatically PST or PDT depending on date). Never use 24-hour clock. Never display UTC alone; if UTC is genuinely useful (e.g. coordinating with a UTC-based system), show PT first, UTC in parentheses after.

**Why:** User is in Playa Vista, CA. They asked for this explicitly. 12-hour PT matches how they read time naturally and avoids mental conversion every glance.

**How to apply:**

- **Preferred format:** `Sun May 31, 11:00 PM PT` or shorter `11:00 PM PT` when the date is already clear from context.
- **For ranges:** `6:00 PM → 11:00 PM PT` (en-dash or arrow, not hyphen).
- **PowerShell format string:** `'ddd MMM d, h:mm tt'` for full; `'h:mm tt'` for time-only. Append `PT` literal after.
- **JavaScript / Date:** `toLocaleString('en-US', { timeZone: 'America/Los_Angeles', hour: 'numeric', minute: '2-digit', hour12: true })` plus `' PT'` suffix.
- **Timezone conversion (PowerShell, Windows):** Use `[System.TimeZoneInfo]::FindSystemTimeZoneById('Pacific Standard Time')` — this auto-handles DST despite the "Standard" in the name. `ConvertTimeFromUtc($utcDateTime, $tz)` to convert. Do NOT rely on `.ToLocalTime()` if the user's machine might be on a different timezone — explicit conversion is safer.

**Edge cases:**
- **Cron expressions, scheduled tasks:** The underlying tool may need UTC or its own format — comply with that, but always echo back the time to the user in 12-hour PT.
- **ISO 8601 in code / API payloads:** Keep ISO 8601 (`2026-06-01T06:00:00Z`) where it's load-bearing for machines. Don't reformat data that other code reads. The rule is about human-facing output.
- **Filenames / log timestamps:** If the convention in a tool is `YYYY-MM-DD_HH-MM-SS` for sortability, keep that. The rule is about prose, summaries, and confirmations the user reads.
- **Midnight / noon:** `12:00 AM` for midnight, `12:00 PM` for noon. Never `0:00` or `24:00`.

**Where this already lives:**
- The SessionStart `ccusage` hook in `~/.claude/settings.json` uses `ddd MMM d, h:mm tt` + `PT` suffix and explicit `Pacific Standard Time` TZ conversion.
- `[[session-auto-resume]]` resume confirmations follow this format.

Related: [[user-profile]] (user is in Playa Vista, CA — Pacific Time baseline).
