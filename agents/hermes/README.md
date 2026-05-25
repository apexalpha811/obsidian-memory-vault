# Hermes Agent — Agent-Specific Config

This file is only read by Hermes Agent. Claude Code and other agents skip this.

## Delivery
- Cron delivery: use explicit `telegram:CHAT_ID` — `origin` and `no_agent` both silently fail to Telegram
- Reliable delivery: cron agent calls `send_message(target="telegram:2064233158")` in prompt

## API Retries
- **HARD RULE:** API 503 retry-until-it-works. Never give up on 503.
- Config: api_max_retries: 5 on deepseek-v4-flash (deepseek API)
- Fallback: stepfun/step-3.5-flash (OpenRouter) if all 5 exhaust

## Cron Dedup
- **HARD RULE:** EVERY cron job MUST have persistent cross-run dedup — no exceptions
- Seen files: seen_creator_videos.json (YT channels), seen_yt_videos.json (YT search), seen_tweets.json (X curated), seen_creators.json (X creators)
- Any new source gets its own seen_*.json
- All prompts include "NEVER report duplicates"
- Auto-prune 48h, script-level dedup is mandatory — no time-window filters in prompts

## X Scrapers
- Scripts at: ~/AppData/Local/hermes/scripts/
- Stack: CloakBrowser (Python), persistent profiles, hourly no_agent cron jobs
- Profiles directory: ~/AppData/Local/hermes/x-news-profile/ and x-foryou-profile/
