@echo off
REM Setup script for Obsidian Memory Vault (Windows)
REM Run: setup.bat

echo === Obsidian Memory Vault Setup ===
echo.

REM Check if repo already cloned
if exist "%USERPROFILE%\.agent-memory" (
    echo ~/.agent-memory already exists, pulling latest...
    cd /d "%USERPROFILE%\.agent-memory"
    git pull
    echo ✓ Pulled latest
) else (
    set /p REPO_URL="Enter your repo URL (e.g. https://github.com/YOUR_USER/obsidian-memory-vault.git): "
    git clone "%REPO_URL%" "%USERPROFILE%\.agent-memory"
    echo ✓ Cloned to ~/.agent-memory
)

REM Fill in user profile
echo.
echo --- Fill in your global settings ---
set /p NAME="Your name: "
set /p HANDLE="Your X handle / social (or press enter to skip): "
set /p LOC="Your location/zip (or press enter to skip): "
set /p TZ="Your timezone (e.g. 12-hour PST, 24-hour UTC): "
set /p TZ_EXAMPLE="Timezone example (e.g. 2:41 PM PST, 14:41 UTC): "

REM Write user profile
> "%USERPROFILE%\.agent-memory\global\user-profile.md" (
    echo # User Profile %mdash% %NAME:REPLACE_ME%
    echo.
    echo Applies to ALL agents connected to this vault.
    echo.
    echo ## Identity
    echo - Name: %NAME:REPLACE_ME%
    echo - X handle / social: %HANDLE:REPLACE_ME%
    echo - Location/Zip: %LOC:REPLACE_ME%
    echo - Interests: {{YOUR_INTERESTS}}
    echo.
    echo ## Operating Rules (priority order)
    echo 1. Flag ^<90%%^ confidence claims
    echo 2. Push back on flawed premises
    echo 3. Ask clarifying questions
    echo 4. Flag instruction conflicts
    echo 5. Lead with main takeaway
    echo 6. Be concise
    echo 7. Plain prose unless asked
    echo 8. No cliches/AI-speak
    echo 9. Specific, vivid examples
    echo 10. No redundant sentences
    echo 11. No preamble/recap
    echo 12. Don't fabricate
    echo 13. Cite sources
    echo 14. Stay on task
    echo 15. Code: minimal scope, make it run
    echo.
    echo ## Hard Rules
    echo - **Plan-first:** Present plan and get approval before implementing
)
echo ✓ Written global/user-profile.md

REM Write timezone
> "%USERPROFILE%\.agent-memory\global\timezone.md" (
    echo # Timezone %mdash% %TZ:REPLACE_ME%
    echo.
    echo Applies to ALL agents connected to this vault.
    echo.
    echo - **%TZ:REPLACE_ME%**
    echo - Applies to: timestamps, schedules, every time reference.
    echo - Format: "%TZ_EXAMPLE:REPLACE_ME%"
)
echo ✓ Written global/timezone.md

REM Set up Claude Code
echo.
set /p SETUP_CLAUDE="Set up Claude Code global config? (y/n): "
if /i "%SETUP_CLAUDE%"=="y" (
    if not exist "%USERPROFILE%\.claude" mkdir "%USERPROFILE%\.claude"
    set /p REPO_URL2="Your repo URL (for Claude Code to push to): "

    > "%USERPROFILE%\.claude\CLAUDE.md" (
        echo # CLAUDE.md %mdash% Global Memory System
        echo.
        echo ## Session Start
        echo 1. git -C ~/.agent-memory pull
        echo 2. Read ~/.agent-memory/_index.md
        echo 3. Read ~/.agent-memory/agents/claude-code/README.md
        echo 4. Read ~/.agent-memory/global/user-profile.md
        echo 5. Read ~/.agent-memory/global/timezone.md
        echo 6. Load any files relevant to the task
        echo.
        echo ## Session End
        echo 1. Save new info to the vault
        echo 2. Update meta/changelog.md
        echo 3. Commit and push
        echo.
        echo ## Git
        echo - Remote: %REPO_URL2%
        echo - Default branch: main
    )
    echo ✓ Written ~/.claude/CLAUDE.md
)

REM Commit and push
echo.
echo --- Committing and pushing changes ---
cd /d "%USERPROFILE%\.agent-memory"
git add -A
git commit -m "Setup: custom user profile and timezone"
git push

echo.
echo === Setup complete! ===
echo.
echo Next steps:
echo 1. Edit global/user-profile.md to add your interests
echo 2. Start a session with your agent inside ~/.agent-memory/
echo 3. Try: get this website's aesthetic: https://example.com
pause
