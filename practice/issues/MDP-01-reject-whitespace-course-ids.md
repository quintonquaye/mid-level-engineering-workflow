# MDP-01 — Reject whitespace-only course IDs

## Problem
The repository is expected to reject IDs that contain no meaningful characters. Verify whether inputs containing only spaces, tabs, or line breaks are rejected consistently. A validation rule that only checks whether a string is literally empty may not satisfy this requirement.

## Expected behavior
A course cannot be created with an ID that is empty or contains only whitespace. Valid IDs with leading or trailing whitespace should follow a consistent, documented normalization policy.

## Acceptance criteria
- [ ] Add tests for an empty ID and an ID containing only spaces.
- [ ] Include at least one additional whitespace case, such as a tab or newline.
- [ ] Verify that invalid input is rejected with the documented error type.
- [ ] Verify that a valid ID can still be created.
- [ ] Verify that the invalid course is not added to the API's stored courses.
- [ ] Add regression coverage for the reported behavior.

## Investigation prompts
- Which layer should own input validation, and why?
- Is the current public error behavior documented clearly enough?
- Should the API also defend its own invariants, or should validation live only in the repository?

## Implementation constraints
- Keep the existing Controller → Repository → API separation.
- Do not weaken or delete existing tests to make the new tests pass.

## Definition of done
Acceptance criteria pass, tests cover invalid and valid input, analysis and formatting pass, and the PR explains the chosen validation boundary.
