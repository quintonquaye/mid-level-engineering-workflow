# MDP-06 — Add a course update operation

## Problem
The current data flow supports fetching and creating courses but has no defined operation for updating an existing course.

## Expected behavior
A caller can update an existing course by ID. Updating a missing ID must fail clearly, and the stored course must retain fields not included in the requested change.

## Acceptance criteria
- [ ] Define the update behavior and public method contract before implementation.
- [ ] Add API-level tests for updating an existing course.
- [ ] Add a test for attempting to update a missing course ID.
- [ ] Add repository-level tests for input validation and update behavior.
- [ ] Add controller-level tests for successful state updates and failed updates.
- [ ] Ensure unrelated courses remain unchanged.
- [ ] Document any decision about whether IDs can be changed.

## Investigation prompts
- What is the smallest API/repository/controller change that supports this feature?
- Should the operation accept a complete `Course` or partial update data?
- How should the controller behave if the API update fails?
- What should happen if the requested title is blank?

## Implementation constraints
- Keep responsibilities separated by layer.
- Do not add a UI; this is a domain/data-flow exercise.

## Definition of done
The feature is covered at appropriate layers, failure behavior is documented, and the PR explains the API contract and design trade-offs.
