---
type: community
members: 21
---

# Community 35

**Members:** 21 nodes

## Members
- [[.reset_limiter()]] - code - free-claude-code/tests/test_limiter.py
- [[.test_compaction()]] - code - free-claude-code/tests/test_limiter.py
- [[.test_compaction_and_futures_resolution()]] - code - free-claude-code/tests/test_limiter.py
- [[.test_flood_wait_handling()]] - code - free-claude-code/tests/test_limiter.py
- [[.test_flood_wait_retry_after_parsing()]] - code - free-claude-code/tests/test_limiter.py
- [[.test_flood_with_seconds_attribute()]] - code - free-claude-code/tests/test_limiter.py
- [[.test_non_flood_exception_no_pause()]] - code - free-claude-code/tests/test_limiter.py
- [[.test_singleton_pattern()]] - code - free-claude-code/tests/test_limiter.py
- [[Error message with 'retry after N' parses the wait seconds.]] - rationale - free-claude-code/tests/test_limiter.py
- [[Exception with .seconds attribute uses that value for pause.]] - rationale - free-claude-code/tests/test_limiter.py
- [[Global Rate Limiter for Messaging Platforms.  Centralizes outgoing message req]] - rationale - free-claude-code/messaging/limiter.py
- [[Non-flood exception doesn't trigger pause.]] - rationale - free-claude-code/tests/test_limiter.py
- [[Reset singleton and environment before each test.]] - rationale - free-claude-code/tests/test_limiter.py
- [[Test that FloodWait exceptions pause the worker.]] - rationale - free-claude-code/tests/test_limiter.py
- [[Test that get_instance returns the same object.]] - rationale - free-claude-code/tests/test_limiter.py
- [[TestMessagingRateLimiter]] - code - free-claude-code/tests/test_limiter.py
- [[Tests for MessagingRateLimiter.]] - rationale - free-claude-code/tests/test_limiter.py
- [[Verify multiple rapid requests with same dedup_key are compacted.         Logic]] - rationale - free-claude-code/tests/test_limiter.py
- [[Verify that even when compacted, all futures resolve to the result of the LAST e]] - rationale - free-claude-code/tests/test_limiter.py
- [[limiter.py]] - code - free-claude-code/messaging/limiter.py
- [[test_limiter.py]] - code - free-claude-code/tests/test_limiter.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/Community_35
SORT file.name ASC
```

## Connections to other communities
- 2 edges to [[_COMMUNITY_Community 49]]

## Top bridge nodes
- [[TestMessagingRateLimiter]] - degree 11, connects to 1 community
- [[limiter.py]] - degree 3, connects to 1 community