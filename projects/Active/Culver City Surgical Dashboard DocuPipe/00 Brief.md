# Culver City Surgical Dashboard DocuPipe

## Location

- Original dashboard: `C:\Users\kv8n11\culver-city-surgical-dashboard`
- DocuPipe clone: `C:\Users\kv8n11\culver-city-surgical-dashboard-docupipe`

## Current State

- The original dashboard remains unchanged.
- The clone runs with `node server.js` on `http://localhost:8742`.
- Default mode is `APP_MODE=mock`.
- The clone includes a dependency-free Node proxy, DocuPipe intake UI, editable schema modules, target-specific `Create schema` drafts, Stedi payload preview, dashboard insertion, and Print Center.
- Partial DocuPipe extractions auto-import into the dashboard with a `partial` badge and missing-field warnings, instead of stopping at review.
- Live claim standardizations map the flat DocuPipe payload shape, so `claimId` / `patientName` / `payer` / `billedAmount` / `serviceLines` populate the claim drawer correctly.
- Record drawers are editable for claims, eligibility, providers, payers, enrollments, attachments, appeals, and COB. Claims and providers were verified in Chrome.

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
- `Create schema` action verified in Chrome. It seeds a fresh target preset, flips the schema state to `draft created`, and selects the new module in the editor.
- Partial auto-import verified in Chrome with a synthetic claim. The claims queue accepted a record built from only `patient.fullName`, `claim.claimNumber`, and `diagnosisCodes`, and the import badge read `partial: professionalClaim837P`.
- Live import verified with `Untitled.png` and schema `3CNrau0Z`. The claim drawer now shows `Marcus Marquez`, `Anthem Blue Cross CA`, `Dr. Alejandro Reyes, MD`, and billed `$20,408` instead of the generic imported shell.
- Claim edit verified in Chrome. The first claim row updated to `Edited Patient` with billed `$12,345`. Provider edit verified too, with the first provider row updating to `Dr. Edited Provider` and live enrollments changing to `3`.

## Next

- Add real DocuPipe schema IDs to modules.
- Add `.env` in the clone with `DOCUPIPE_API_KEY`, `STEDI_API_KEY`, and `APP_MODE=live` only when ready for live testing.
- Use Stedi test keys before production workflows when supported.
