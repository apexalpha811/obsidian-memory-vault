---
type: community
members: 18
---

# Community 43

**Members:** 18 nodes

## Members
- [[.test_add_node_invalid_parent_raises()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_concurrent_add_node_serialized()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_concurrent_enqueue_dequeue_no_loss()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_concurrent_update_state()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_dequeue_empty_returns_none()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_enqueue_returns_position()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_queue_snapshot_matches_enqueue_order()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_update_state_nonexistent_node()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[Adding a node with nonexistent parent should raise ValueError.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Concurrency tests for MessageTree operations.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Concurrent add_node calls should all succeed via lock serialization.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Concurrent enqueuedequeue should not lose items.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Concurrent state updates should all apply (last writer wins).]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Dequeue on empty queue returns None.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Enqueue should return 1-indexed position.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Queue snapshot should return items in FIFO order.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[TestMessageTreeConcurrency]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[Updating state of a nonexistent node should not raise.]] - rationale - free-claude-code/tests/test_tree_concurrency.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/Community_43
SORT file.name ASC
```

## Connections to other communities
- 9 edges to [[_COMMUNITY_Community 29]]
- 5 edges to [[_COMMUNITY_Community 39]]
- 3 edges to [[_COMMUNITY_Community 0]]
- 1 edge to [[_COMMUNITY_Community 2]]
- 1 edge to [[_COMMUNITY_Community 1]]

## Top bridge nodes
- [[TestMessageTreeConcurrency]] - degree 15, connects to 4 communities
- [[.test_concurrent_enqueue_dequeue_no_loss()]] - degree 4, connects to 2 communities
- [[.test_concurrent_update_state()]] - degree 4, connects to 2 communities
- [[.test_add_node_invalid_parent_raises()]] - degree 4, connects to 2 communities
- [[.test_queue_snapshot_matches_enqueue_order()]] - degree 4, connects to 2 communities