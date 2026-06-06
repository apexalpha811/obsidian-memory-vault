---
type: community
members: 40
---

# Community 7

**Members:** 40 nodes

## Members
- [[.test_cleanup_sessions_malformed_timestamp()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_cleanup_trees_malformed_timestamp()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_cleanup_trees_missing_created_at()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_get_session_by_msg_not_found()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_get_session_record_not_found()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_load_corrupted_json()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_load_empty_file()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_load_legacy_int_fields()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_load_nonexistent_file()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_load_truncated_json()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_rename_session_not_found()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_save_io_error_handled()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_update_last_message_not_found()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[.test_update_tree_node_nonexistent_tree()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[Corrupted JSON file is handled gracefully (logs error, starts empty).]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Create a SessionStore using a temp file.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Edge case tests for messagingsession.py SessionStore.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Empty file is handled gracefully.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Getting non-existent session record returns None.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Legacy format with int chat_idmsg_id is converted to string.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Looking up non-existent message returns None.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Malformed created_at in cleanup doesn't crash.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Malformed created_at in cleanup_old_trees doesn't crash.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Non-existent file starts with empty state.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[TestSessionStoreCleanupEdgeCases]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[TestSessionStoreLoadEdgeCases]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[TestSessionStoreOperationEdgeCases]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[TestSessionStoreSaveEdgeCases]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[Tests for cleanup with malformed data.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Tests for edge cases in session operations.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Tests for loading corruptedmalformed data.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Tests for save failure handling.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Tree node without created_at is not cleaned up.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Truncated JSON file is handled gracefully.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Updating a node in a nonexistent tree logs warning.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[Write failure in _save() is logged but doesn't raise.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[rename_session with non-existent old_id returns False.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py
- [[test_session_store_edge_cases.py]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[tmp_store()]] - code - free-claude-code/tests/test_session_store_edge_cases.py
- [[update_last_message with unknown session_id logs warning.]] - rationale - free-claude-code/tests/test_session_store_edge_cases.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/Community_7
SORT file.name ASC
```

## Connections to other communities
- 1 edge to [[_COMMUNITY_Community 2]]

## Top bridge nodes
- [[test_session_store_edge_cases.py]] - degree 7, connects to 1 community