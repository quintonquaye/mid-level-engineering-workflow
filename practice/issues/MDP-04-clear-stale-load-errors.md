# MDP-04 — Clear stale errors after a successful load

## Problem
After a request fails, a later successful request should not leave the controller in a misleading error state.

## Expected behavior
A successful course load clears any error from an earlier failed load and updates the course list to the successful result.

## Acceptance criteria
- [ ] Configure a fetch failure and call `loadCourses`.
- [ ] Verify the controller records an error.
- [ ] Allow a subsequent fetch to succeed.
- [ ] Verify the successful result replaces the displayed list.
- [ ] Verify the old error is cleared.
- [ ] Verify the loading state is false after both operations complete.

## Investigation prompts
- Which state transitions should happen before a request starts, when it succeeds, and when it fails?
- How can the test simulate the failure and recovery without relying on timing delays?
- Could a test accidentally pass without proving the recovery behavior?

## Definition of done
The failure-then-recovery sequence is tested. The PR describes the intended state transition and does not rely on arbitrary `Future.delayed` timing.
