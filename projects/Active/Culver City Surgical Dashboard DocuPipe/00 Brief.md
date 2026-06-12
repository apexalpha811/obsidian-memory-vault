# Culver City Surgical Dashboard DocuPipe

## Location

- Original dashboard: `C:\Users\kv8n11\culver-city-surgical-dashboard`
- DocuPipe clone: `C:\Users\kv8n11\culver-city-surgical-dashboard-docupipe`

## Current State

- The original dashboard remains unchanged.
- The clone runs with `node server.js` on `http://localhost:8742`.
- Default mode is `APP_MODE=mock`.
- The clone includes a dependency-free Node proxy, DocuPipe intake UI, editable schema modules, Stedi payload preview, dashboard insertion, and Print Center.

## Added Clone Files

- `server.js`
- `data/docupipe-modules.json`
- `lib/docupipe.js`
- `DOCUPIPE_SETUP.md`
- Updated clone `.env.example`
- Updated clone `.claude/launch.json`
- Updated clone `README.md`
- Updated clone `index.html`

## Verification

- `node --check server.js` passed.
- `node --check lib/docupipe.js` passed.
- `data/docupipe-modules.json` parsed successfully.
- Original dashboard `git status --short` stayed clean.
- Browser automation verified five modules, mock upload, mock standardization, Stedi preview, dashboard claim insertion, Print Center popup, and zero console errors.
- Live DocuPipe PNG upload was tested with `C:\Users\kv8n11\Downloads\test.png`.
- Upload gotcha fixed: DocuPipe expects base64 local file content at `document.file.contents`, not `document.file.base64`.
- Live result: document `QC3CFTsP`, job `lhDjlUD1`, both completed. One PNG page parsed, language `en`, result length `770`, 1 credit, processing time about `3.37s`.

## Next

- Add real DocuPipe schema IDs to modules.
- Add `.env` in the clone with `DOCUPIPE_API_KEY`, `STEDI_API_KEY`, and `APP_MODE=live` only when ready for live testing.
- Use Stedi test keys before production workflows when supported.
