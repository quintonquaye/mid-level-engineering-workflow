# MDP-02 — Reject duplicate course IDs consistently

## Problem
The API currently prevents duplicate IDs, but the behavior needs a clear test contract and predictable handling through the repository boundary.

## Expected behavior
Creating a course whose ID already exists must not create a second record. The caller should receive a consistent, documented failure rather than a successful result that hides the conflict.

## Acceptance criteria
- [ ] Test creating two courses with the same ID.
- [ ] Verify that the second creation fails with the agreed error type.
- [ ] Verify that only one course with that ID remains stored.
- [ ] Verify that creating a different ID still succeeds after a duplicate attempt.
- [ ] Add a test that makes the failure behavior clear at the repository boundary.

## Investigation prompts
- Which layer currently detects duplicates?
- Should the repository translate lower-level errors or preserve them?
- How would a caller distinguish a duplicate from a network/API failure?

## Implementation constraints
- Avoid introducing a new error abstraction unless you can explain why it is justified.
- Preserve the existing public behavior except where the acceptance criteria require a change.

## Definition of done
Tests prove both the duplicate failure and the integrity of stored data. The PR documents the chosen error contract and any compatibility considerations.
