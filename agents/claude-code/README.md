# Claude Code — Agent-Specific Instructions

This file is only read by Claude Code. Other agents skip this.

## About This Vault
You are inside the Obsidian Memory Vault. It stores:
- **global/** — instructions that apply to every agent (user profile, timezone)
- **design-systems/** — website aesthetic templates extracted from live sites
- **projects/** — long-running project documentation
- **agents/claude-code/** — you are here
- **agents/hermes/** — ignore this folder (it's for another agent)

## Required Actions

### At session start
1. `git -C ~/.agent-memory pull` — get latest vault updates
2. Read `~/.agent-memory/global/user-profile.md` and follow all rules
3. Read `~/.agent-memory/global/timezone.md`
4. Read `~/.agent-memory/design-systems/` — see what templates exist
5. Load any files relevant to the current task

### Website aesthetic extraction
When the user says "get this website's aesthetic" (or similar) with a URL:

1. Navigate to the live site URL (not Behance/Dribbble mockups)
2. Extract from computed CSS:
   - All hex colors (backgrounds, text, accents, buttons, borders)
   - Font names, sizes (px), and weights for H1/H2/H3/body/nav/buttons
   - Button styles (bg color, text color, padding, border-radius)
   - Section background alternation pattern
   - 3-5 aesthetic keywords
3. Format as this exact template:

```
Use this design system for everything you create:

COLORS
[list hex colors with labels]

[section pattern description]

FONTS
[font details with px sizes and weights]
Fallback: [fallback]

STYLE RULES
- [bullet list]

Now apply this style to create [describe your project]. Use only the colors and fonts listed above.
```

4. Save to `design-systems/[site-name].md`
5. Update `meta/changelog.md`
6. Update `_index.md` if needed
7. Commit and push

### At session end
1. Save any new user preferences or project info to the vault
2. Update `meta/changelog.md`
3. `cd ~/.agent-memory && git add -A && git commit -m "[description]" && git push`

## Git Setup
- Clone: `git clone {{REPO_URL}} ~/.agent-memory`
- Remote: {{REPO_URL}}
- Default branch: main
- If no GitHub token: ask the user for a classic token with `repo` scope
