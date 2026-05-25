#!/bin/bash
# Setup script for Obsidian Memory Vault
# Run: bash setup.sh

echo "=== Obsidian Memory Vault Setup ==="
echo ""

# Clone repo if not already cloned
if [ ! -d "$HOME/.agent-memory" ]; then
    read -p "Enter your repo URL (e.g. https://github.com/YOUR_USER/obsidian-memory-vault.git): " REPO_URL
    git clone "$REPO_URL" "$HOME/.agent-memory"
    echo "✓ Cloned to ~/.agent-memory"
else
    echo "~/.agent-memory already exists, pulling latest..."
    git -C "$HOME/.agent-memory" pull
fi

# Fill in user profile
echo ""
echo "--- Fill in your global settings ---"
read -p "Your name: " NAME
read -p "Your X handle / social (or press enter to skip): " HANDLE
read -p "Your location/zip (or press enter to skip): " LOC
read -p "Your timezone (e.g. '12-hour PST', '24-hour UTC'): " TZ
read -p "Timezone example (e.g. '2:41 PM PST', '14:41 UTC'): " TZ_EXAMPLE

# Write user profile
cat > "$HOME/.agent-memory/global/user-profile.md" << PROFILE
# User Profile — ${NAME:-REPLACE_ME}

Applies to ALL agents connected to this vault.

## Identity
- Name: ${NAME:-REPLACE_ME}
- X handle / social: ${HANDLE:-REPLACE_ME}
- Location/Zip: ${LOC:-REPLACE_ME}
- Interests: {{YOUR_INTERESTS}}

## Operating Rules (priority order)
1. Flag <90% confidence claims
2. Push back on flawed premises
3. Ask clarifying questions
4. Flag instruction conflicts
5. Lead with main takeaway
6. Be concise
7. Plain prose unless asked
8. No clichés/AI-speak
9. Specific, vivid examples
10. No redundant sentences
11. No preamble/recap
12. Don't fabricate
13. Cite sources
14. Stay on task
15. Code: minimal scope, make it run

## Hard Rules
- **Plan-first:** Present plan and ask for approval before any implementation
PROFILE
echo "✓ Written global/user-profile.md"

# Write timezone
cat > "$HOME/.agent-memory/global/timezone.md" << TIMEZONE
# Timezone — ${TZ:-REPLACE_ME}

Applies to ALL agents connected to this vault.

- **${TZ:-REPLACE_ME}**
- Applies to: timestamps, schedules, every time reference.
- Format: "${TZ_EXAMPLE:-REPLACE_ME}"
TIMEZONE
echo "✓ Written global/timezone.md"

# Set up Claude Code
echo ""
echo "--- Claude Code setup ---"
read -p "Set up Claude Code global config? (y/n): " SETUP_CLAUDE
if [ "$SETUP_CLAUDE" = "y" ]; then
    mkdir -p "$HOME/.claude"
    read -p "Your repo URL again (for Claude Code to push to): " REPO_URL2
    cat > "$HOME/.claude/CLAUDE.md" << CLAUDE
# CLAUDE.md — Global Memory System

## Session Start
1. git -C ~/.agent-memory pull
2. Read ~/.agent-memory/_index.md
3. Read ~/.agent-memory/agents/claude-code/README.md
4. Read ~/.agent-memory/global/user-profile.md
5. Read ~/.agent-memory/global/timezone.md
6. Load any design-system or project files relevant to the task

## Session End
1. Save new info to the vault
2. Update meta/changelog.md
3. Commit and push: git -C ~/.agent-memory add -A && git commit -m "[message]" && git push

## Git
- Remote: ${REPO_URL2}
- Default branch: main
CLAUDE
    echo "✓ Written ~/.claude/CLAUDE.md"
fi

# Update Claude Code README with repo URL
if [ -n "$REPO_URL2" ]; then
    sed -i "s|{{REPO_URL}}|$REPO_URL2|g" "$HOME/.agent-memory/agents/claude-code/README.md"
    echo "✓ Updated agents/claude-code/README.md with repo URL"
fi

# Commit and push
echo ""
echo "--- Committing and pushing changes ---"
cd "$HOME/.agent-memory"
git add -A
git commit -m "Setup: custom user profile and timezone"
git push

echo ""
echo "=== Setup complete! ==="
echo ""
echo "Next steps:"
echo "1. Edit global/user-profile.md to add your interests"
echo "2. Start a session with your agent inside ~/.agent-memory/"
echo "3. Try: 'get this website's aesthetic: https://example.com'"
