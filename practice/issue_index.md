# Practice issue index

Create each item as a GitHub Issue. The ticket descriptions are in `practice/issues/`. The tickets are designed to be worked independently from the starter baseline; use a separate branch and PR for each.

## Recommended order

| Ticket ID | Suggested title | Main skill |
|---|---|---|
| MDP-01 | Reject whitespace-only course IDs | Bug report, validation tests, regression coverage |
| MDP-02 | Reject duplicate course IDs consistently | API/repository behavior, exception contract |
| MDP-03 | Preserve existing courses when a load fails | State integrity, failure-path testing |
| MDP-04 | Clear stale errors after a successful load | State transitions, regression tests |
| MDP-05 | Prevent duplicate courses in controller state | Cross-layer behavior, test design |
| MDP-06 | Add a course update operation | Feature planning, API/repository/controller boundaries |
| MDP-07 | Add course search by title | Requirements interpretation, edge cases |
| MDP-08 | Add pagination to course retrieval | API contract, boundary testing |
| MDP-09 | Add a stable error contract for course creation | Error modeling, maintainability |
| MDP-10 | Add repository tests for negative prices and blank titles | Test coverage, test quality |
| MDP-11 | Document local development and test commands | Documentation PR |
| MDP-12 | Expand CI with coverage reporting | GitHub Actions, artifacts, workflow diagnosis |

## Ticket independence

- MDP-01 through MDP-05 are behavior changes or bug fixes and can be done independently.
- MDP-06 through MDP-09 are feature/design exercises; each can be completed without implementing the others.
- MDP-10 is a testing-focused ticket and can be completed at any time.
- MDP-11 is documentation-focused and can be completed at any time.
- MDP-12 is a CI-focused ticket and can be completed at any time.

For every ticket, create a GitHub Issue, comment with your plan, implement tests, open a PR, and record verification evidence. The title in the index is a suggested title, not the answer to the implementation.
