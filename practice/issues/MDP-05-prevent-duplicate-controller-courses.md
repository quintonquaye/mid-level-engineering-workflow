# MDP-05 — Prevent duplicate courses in controller state

## Problem
Repeated user actions or retries can cause the same course to be represented more than once in controller state. Investigate the interaction between API uniqueness and controller state.

## Expected behavior
The controller must not report a course as newly added when the repository rejects the creation. Its in-memory list must remain consistent with successful repository operations.

## Acceptance criteria
- [ ] Load or add a course successfully.
- [ ] Attempt to add another course using the same ID.
- [ ] Verify the second attempt reports failure according to the controller's public contract.
- [ ] Verify the controller list contains only one copy of the course.
- [ ] Verify the controller exposes an actionable error state.
- [ ] Verify a later valid add still succeeds.

## Investigation prompts
- Does the controller update state before or after the repository operation succeeds?
- What should the boolean return value mean?
- Should uniqueness be enforced by one layer or multiple layers, and what is each layer responsible for?

## Definition of done
Tests verify success, duplicate failure, state integrity, and recovery. The PR explains why the controller state stays consistent with repository results.
