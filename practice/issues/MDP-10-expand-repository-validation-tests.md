# MDP-10 — Expand repository validation tests

## Problem
The repository has validation rules, but the test suite does not yet demonstrate the full expected contract for all invalid inputs and boundary values.

## Expected behavior
Repository validation must reject invalid course data before it is persisted, and valid data must still be accepted.

## Acceptance criteria
- [ ] Add a test for a blank title.
- [ ] Add a test for a whitespace-only title.
- [ ] Add a test for a negative price.
- [ ] For each invalid case, verify the expected error type.
- [ ] For each invalid case, verify no course was persisted.
- [ ] Add a valid boundary case, such as a zero price.
- [ ] Keep each test focused on one behavior and give it a descriptive name.

## Investigation prompts
- What is the difference between testing an exception and testing that invalid data was not persisted?
- Are the tests checking public behavior or implementation details?
- Can test setup be shared without hiding the Arrange/Act/Assert sequence?

## Definition of done
The validation contract is covered by readable tests and all tests pass without weakening existing assertions.
