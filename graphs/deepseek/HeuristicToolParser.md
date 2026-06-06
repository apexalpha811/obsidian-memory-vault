---
source_file: "free-claude-code/providers/nvidia_nim/utils/heuristic_tool_parser.py"
type: "code"
community: "Community 34"
location: "L16"
tags:
  - graphify/code
  - graphify/INFERRED
  - community/Community_34
---

# HeuristicToolParser

## Connections
- [[.__init__()_18]] - `method` [EXTRACTED]
- [[.feed()]] - `method` [EXTRACTED]
- [[.flush()]] - `method` [EXTRACTED]
- [[.stream_response()_1]] - `calls` [EXTRACTED]
- [[Stateful parser that detects raw text tool calls in the format     ● function]] - `rationale_for` [EXTRACTED]
- [[__init__.py_7]] - `imports` [EXTRACTED]
- [[client.py]] - `imports` [EXTRACTED]
- [[heuristic_tool_parser.py]] - `contains` [EXTRACTED]
- [[test_garbage_interleaved()]] - `calls` [INFERRED]
- [[test_heuristic_tool_parser_basic()]] - `calls` [INFERRED]
- [[test_heuristic_tool_parser_empty_input()]] - `calls` [INFERRED]
- [[test_heuristic_tool_parser_flush()]] - `calls` [INFERRED]
- [[test_heuristic_tool_parser_flush_no_tool()]] - `calls` [INFERRED]
- [[test_heuristic_tool_parser_malformed_function_tag()]] - `calls` [INFERRED]
- [[test_heuristic_tool_parser_streaming()]] - `calls` [INFERRED]
- [[test_heuristic_tool_parser_unicode_function_name()]] - `calls` [INFERRED]
- [[test_incomplete_tag_flush()]] - `calls` [INFERRED]
- [[test_interleaved_thinking_and_tools()]] - `calls` [INFERRED]
- [[test_multiple_params_split()]] - `calls` [INFERRED]
- [[test_partial_interleaved_streaming()]] - `calls` [INFERRED]
- [[test_split_across_markers()]] - `calls` [INFERRED]
- [[test_text_between_params_lost()]] - `calls` [INFERRED]
- [[test_value_with_special_chars()]] - `calls` [INFERRED]

#graphify/code #graphify/INFERRED #community/Community_34