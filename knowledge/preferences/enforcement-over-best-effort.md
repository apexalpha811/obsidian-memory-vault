---
title: Prefers enforced mechanisms over best-effort; wants reliability gaps named
type: preference
tags: [work]
created: 2026-05-29
updated: 2026-05-29
---

When automating a behavior, the user wants it **guaranteed by mechanism**, not left to
best-effort prompt instructions — and wants the reliability limits stated plainly, not glossed.

**Why:** Across the 2026-05-29 memory-system build, the user repeatedly probed whether things
*would actually happen* ("so you will go look", "so sessionend will auto-commit") and
consistently chose the enforced option (hooks, explicit slash commands) once the best-effort
gap was explained. They value honest confidence levels (e.g. "~70% sure SessionEnd fires on
every exit") over reassurance.

**How to apply:**
- For "do X automatically" requests, reach for a hook / enforced mechanism, not a memory or a
  prompt habit. If only a best-effort path exists, say so explicitly.
- State activation caveats and confidence levels up front (what won't fire, when, how sure).
- Split judgment vs mechanism: judgment → explicit command the user triggers; mechanism →
  hook. See [[2026-05-29-memory-loading-via-hooks]].
