# MDP-07 — Add course search by title

## Problem
Callers need to find courses by title without manually filtering every result themselves.

## Expected behavior
Provide a search capability with a clearly documented matching rule. Decide whether matching is case-insensitive and whether leading/trailing spaces in the query are ignored, then test the chosen behavior.

## Acceptance criteria
- [ ] Write down the matching rules in the issue or PR before implementation.
- [ ] Add tests for a matching title and a non-matching title.
- [ ] Add a test for case differences.
- [ ] Add a test for an empty or whitespace-only query.
- [ ] Add a test that distinguishes substring matching from exact matching.
- [ ] Confirm the existing `getCourses` behavior remains unchanged.
- [ ] Keep published-only filtering behavior predictable when search and filtering are combined.

## Investigation prompts
- Should searching be a repository operation or a separate domain service?
- Should an empty query return all courses or no courses?
- How can tests prove the matching rule without testing private helpers?

## Definition of done
Search behavior is documented and tested, existing behavior remains covered, and the PR explains any ambiguity resolved during implementation.
