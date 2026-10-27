# MDP-08 — Add pagination to course retrieval

## Problem
Fetching every course becomes inefficient as the number of records grows. Add a simple, deterministic pagination contract to the in-memory API and repository.

## Expected behavior
A caller can request a page of results using a documented page-size and offset/page-number convention. Boundary conditions must be predictable.

## Acceptance criteria
- [ ] Choose and document either offset-based or page-number-based pagination.
- [ ] Test the first page.
- [ ] Test a later page.
- [ ] Test a request beyond the available results.
- [ ] Test invalid page values or sizes according to the chosen contract.
- [ ] Verify records are not duplicated between adjacent pages.
- [ ] Verify existing non-paginated callers remain compatible, or document the intentional API change.

## Investigation prompts
- What should happen when the requested page is empty?
- Should an invalid page size throw an error or be normalized?
- How will filtering interact with pagination?
- What does deterministic ordering mean for this API?

## Definition of done
The pagination contract is explicit, edge cases are tested, and the PR includes example calls or documentation showing how callers should use it.
