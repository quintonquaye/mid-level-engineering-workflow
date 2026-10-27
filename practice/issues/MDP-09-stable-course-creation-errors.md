# MDP-09 — Define a stable error contract for course creation

## Problem
Callers should be able to handle expected validation failures differently from unexpected service failures. Review the current error behavior and propose a small, maintainable contract.

## Expected behavior
Expected invalid input and duplicate-ID failures should be distinguishable from an API operation failure. Avoid forcing callers to parse arbitrary human-readable exception strings.

## Acceptance criteria
- [ ] Document the proposed error categories before implementation.
- [ ] Add tests for blank ID, blank title, negative price, duplicate ID, and API create failure.
- [ ] Verify callers can distinguish expected validation/conflict errors from service failures.
- [ ] Preserve the original cause or useful diagnostic context where appropriate.
- [ ] Ensure tests do not depend on full exception-message wording unless the message itself is part of the public contract.
- [ ] Explain compatibility impact in the PR.

## Investigation prompts
- Would typed exceptions, a result type, or another approach fit the current code best?
- How much abstraction is justified for this small package?
- Which details belong in a user-facing message versus diagnostic logs?

## Implementation constraints
- Do not swallow errors silently.
- Do not expose sensitive implementation details as user-facing error messages.

## Definition of done
The error contract is documented and tested across relevant layers. The PR explains the chosen approach and why it is proportionate to the project.
