# Hermes Agent — Agent-Specific Config

This file is only read by Hermes Agent. Claude Code and other agents skip this.

## Delivery
- Cron delivery: configure your preferred delivery target (e.g. Telegram, Discord, email)
- If using Hermes: `send_message(target="platform:chat_id")` for reliable delivery

## API Retries
- Configure retry behavior for your primary and fallback providers
- Example: max_retries: 5 on provider-A, fallback provider-B if all exhaust

## Cron Dedup
- **Recommended:** EVERY cron job should have persistent cross-run dedup
- Use seen_*.json files with auto-prune (e.g. 48h)
- Include "NEVER report duplicates" in all cron prompts

## Agent-Specific Notes
- Add your own Hermes-specific workflows, tool configurations, and fixed paths here
