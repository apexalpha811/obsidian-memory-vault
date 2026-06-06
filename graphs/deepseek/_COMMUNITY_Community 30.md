---
type: community
members: 24
---

# Community 30

**Members:** 24 nodes

## Members
- [[.test_cancel_nonexistent_tree()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_cleanup_stale_nodes()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_concurrent_create_trees()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_concurrent_trees_independent()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_enqueue_no_tree()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_enqueue_queues_when_busy()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_get_tree_for_node()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_get_tree_for_node_nonexistent()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_mark_node_error_nonexistent()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_mark_node_error_with_propagation()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[.test_rapid_messages_all_queued()]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[Concurrency tests for TreeQueueManager.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Creating multiple trees concurrently should all succeed.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Enqueue for a node not in any tree returns False.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Enqueue should queue when tree is already processing.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Processing in one tree shouldn't affect another.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[Rapid sequential enqueues should all be queued without loss.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[TestTreeQueueManagerConcurrency]] - code - free-claude-code/tests/test_tree_concurrency.py
- [[cancel_tree for nonexistent tree returns empty list.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[cleanup_stale_nodes marks PENDINGIN_PROGRESS nodes as ERROR.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[get_tree_for_node returns None for unknown nodes.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[get_tree_for_node returns the right tree.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[mark_node_error for nonexistent node returns empty.]] - rationale - free-claude-code/tests/test_tree_concurrency.py
- [[mark_node_error should propagate to pending children.]] - rationale - free-claude-code/tests/test_tree_concurrency.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/Community_30
SORT file.name ASC
```

## Connections to other communities
- 13 edges to [[_COMMUNITY_Community 39]]
- 12 edges to [[_COMMUNITY_Community 1]]
- 3 edges to [[_COMMUNITY_Community 0]]
- 1 edge to [[_COMMUNITY_Community 2]]
- 1 edge to [[_COMMUNITY_Community 29]]

## Top bridge nodes
- [[TestTreeQueueManagerConcurrency]] - degree 25, connects to 5 communities
- [[.test_enqueue_queues_when_busy()]] - degree 4, connects to 2 communities
- [[.test_cleanup_stale_nodes()]] - degree 4, connects to 2 communities
- [[.test_mark_node_error_with_propagation()]] - degree 4, connects to 2 communities
- [[.test_get_tree_for_node()]] - degree 4, connects to 2 communities