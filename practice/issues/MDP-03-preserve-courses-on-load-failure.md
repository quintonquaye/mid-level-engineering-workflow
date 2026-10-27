# MDP-03 — Preserve existing courses when loading fails

## Problem
A failed refresh should not accidentally destroy data already held by the controller. Investigate the current behavior when a controller has successfully loaded courses and a later request fails.

## Expected behavior
If a refresh fails, the controller should expose the error and stop loading while retaining the last successfully loaded course list.

## Acceptance criteria
- [ ] Start with a controller that successfully loads at least one course.
- [ ] Configure the fake API to fail on a subsequent fetch.
- [ ] Verify the previous course list remains unchanged.
- [ ] Verify an error is exposed to the caller.
- [ ] Verify the loading flag is false after failure.
- [ ] Verify the failure does not mutate the API's stored data.

## Investigation prompts
- At what point should controller state be replaced?
- What state must be restored or preserved when an asynchronous operation fails?
- Is the test observing public behavior rather than private implementation details?

## Definition of done
The failure path is covered by a regression test. The PR explains the state-integrity rule and reports the test command used.
