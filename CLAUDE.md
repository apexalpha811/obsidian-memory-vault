# CLAUDE.md — Agent Memory Vault Instructions

You are operating inside the **Obsidian Memory Vault** (`~/.agent-memory/`). This is a persistent markdown knowledge base shared across AI agents and sessions. You must read, write, and maintain this vault autonomously.

## Vault Structure

```
~/.agent-memory/
├── _index.md              # Master index — update when adding files
├── CLAUDE.md              # You are here
├── preferences/
│   └── user.md            # Operating rules, timezone, delivery
├── design-systems/        # Website aesthetic templates
├── projects/              # Long-running project documentation
├── meta/
│   └── changelog.md       # Append entry on every change
└── logs/                  # Session notes (optional)
```

## Your Responsibilities

1. **Read the vault** at session start — check `_index.md` and any relevant files before answering
2. **Write to the vault** — save design systems, project decisions, preferences you discover
3. **Keep it organized** — update `_index.md` when adding files, append to `changelog.md`
4. **Push to GitHub** after every batch of changes

---

## Workflow: Website Aesthetic Extraction

When the user says "get this website's aesthetic" (or similar) with a URL:

### Step 1 — Visit the live site
Use your browser or terminal to navigate to the URL. **Always use the live production site**, not Behance/Dribbble mockups.

### Step 2 — Extract design tokens
Extract from **computed CSS** — don't guess colors or fonts:

- **Colors:** Get hex codes for every color on the page:
  - Background colors (dark sections AND light sections)
  - Text colors (on dark bg + on light bg)
  - Accent/highlight colors
  - Button background and text colors
  - Border colors, hover states
  - Nav text color and opacity

- **Fonts:** Get the exact font family, size (in px), and weight for each level:
  - H1 (hero heading)
  - H2 (section titles)
  - H3 (subheadings, if present)
  - Body text
  - Nav links
  - Buttons
  - Numbers/stats

- **Buttons:** Background color, text color, padding, border-radius, font size, font weight

- **Layout:** Section background alternation pattern, gradients or solid colors

- **Aesthetic:** 3-5 keywords describing the feel (e.g. "clean, modern, healthcare-tech, warm, human")

### Step 3 — Format the template
Output exactly in this format with no preamble:

```
Use this design system for everything you create:

COLORS
[list all hex colors with labels]

[Describe section alternation pattern]

FONTS
[font name for each level with px sizes and weights]
Fallback: [fallback]

STYLE RULES
- [bullet list of all style rules]

Now apply this style to create [describe your project]. Use only the colors and fonts listed above.
```

### Step 4 — Save to vault
Save the full template to `design-systems/[site-name].md`

### Step 5 — Update index and changelog
- Add a link in `_index.md` under the design-systems section
- Append an entry to `meta/changelog.md`

### Step 6 — Commit and push
```bash
cd ~/.agent-memory
git add -A
git commit -m "[descriptive message]"
git push
```

---

## Workflow: Saving User Preferences

When the user tells you something about how they want things done:

1. Write or update `preferences/user.md`
2. Update `meta/changelog.md`
3. Commit and push

---

## Git Setup

Remote: `https://github.com/apexalpha811/obsidian-memory-vault.git`

If you don't have a GitHub token:
1. Ask the user to create one at `github.com/settings/tokens` (classic, `repo` scope)
2. Store it or use it inline for `git push`

---

## Rules

- **Plan-first before implementing anything** — present the plan, get approval
- **Use 12-hour PST for all timestamps**
- **Never fabricate colors or fonts** — always check computed CSS
- **Never truncate** — the vault has unlimited space, write full content
- **Check both light and dark sections** of any website
- **Scroll through the full page** — don't judge by the hero section alone
