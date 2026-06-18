# Codex Agent Memory

## Session Start

1. Pull the vault before working: `git -C ~/.agent-memory pull || true`.
2. Read `~/.agent-memory/_index.md`.
3. Read this file.
4. Read `~/.agent-memory/global/user-profile.md`.
5. Load project-specific `tasks/lessons.md` and `tasks/todo.md` before editing code.

## Durable Lessons
### PDF export is a print problem, not a screenshot problem

When exporting HTML to PDF, never scale a tall responsive screen capture down to fit a page. Build an offscreen fixed-width export clone at letter proportions, paginate long content into multiple export pages, and verify the worst pages individually, especially the first page and the longest consent pages. Keep loading text, navigation, and other UI chrome out of the export root. If Playwright cannot launch its bundled browser, attach to a headless Chrome with remote debugging so export verification still runs.


### Integration routing configs are production data

For API-to-dashboard integrations, treat local module files, saved schemas, target selectors, endpoint mappings, and preview builders as one production route. Before declaring parsing fixed, audit the full route:

`source document -> parser schema or auto selection -> integration target -> server endpoint -> preview builder -> dashboard target -> rendered record`

Do not save test junk into a real module ID. Use throwaway fixtures or temporary IDs. Stale draft modules must not stay selectable after schema creation is removed, because they can send good extracted data through the wrong target and make parsing look broken.

### Verify values, not just success responses

For document import work, a `200` response is not proof. Verify that the expected business fields land in the dashboard shape. For claims, check patient, payer, provider, billed, paid, date of service, payer claim number, CPT lines, and ICD codes. Restart the server after server-side mapping changes before testing.

