---
source_file: "free-claude-code/providers/nvidia_nim/errors.py"
type: "code"
community: "Community 33"
location: "L15"
tags:
  - graphify/code
  - graphify/EXTRACTED
  - community/Community_33
---

# map_error()

## Connections
- [[.complete()_1]] - `calls` [EXTRACTED]
- [[.stream_response()_1]] - `calls` [EXTRACTED]
- [[.test_authentication_error()]] - `calls` [INFERRED]
- [[.test_bad_request_error()]] - `calls` [INFERRED]
- [[.test_generic_api_error()]] - `calls` [INFERRED]
- [[.test_internal_server_error_generic()]] - `calls` [INFERRED]
- [[.test_internal_server_error_overloaded()]] - `calls` [INFERRED]
- [[.test_mapping_parametrized()]] - `calls` [INFERRED]
- [[.test_rate_limit_error()]] - `calls` [INFERRED]
- [[.test_unmapped_exception_passthrough()]] - `calls` [INFERRED]
- [[.test_value_error_passthrough()]] - `calls` [INFERRED]
- [[APIError]] - `calls` [EXTRACTED]
- [[AuthenticationError]] - `calls` [EXTRACTED]
- [[Exception]] - `references` [EXTRACTED]
- [[InvalidRequestError]] - `calls` [EXTRACTED]
- [[Map OpenAI exception to specific ProviderError.]] - `rationale_for` [EXTRACTED]
- [[OverloadedError]] - `calls` [EXTRACTED]
- [[RateLimitError]] - `calls` [EXTRACTED]
- [[client.py]] - `imports` [EXTRACTED]
- [[errors.py]] - `contains` [EXTRACTED]

#graphify/code #graphify/EXTRACTED #community/Community_33