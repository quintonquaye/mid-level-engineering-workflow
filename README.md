# Mid-Level Mobile Developer Practice Lab

A guided Flutter/Dart-style engineering lab for practicing **GitHub Issues, implementation planning, tests, commits, pull requests, code review, and GitHub Actions**.

This is a deliberately small Dart package using a photography-course domain, similar to the Flutter Unit Testing Practice lab. The goal is not to finish everything quickly. The goal is to practice a professional workflow for each independent ticket.

## Learning rules

- Do not implement every ticket on one branch.
- Each ticket should have its own issue, branch, tests, commits, and pull request.
- Read the ticket before inspecting implementation details.
- Write or update tests that prove the expected behavior.
- Do not change production code merely to make a test pass. First decide whether the test expresses the requirement correctly or the implementation is defective.
- Do not copy a solution from elsewhere. Investigate, propose an approach, and verify it.
- Keep each pull request focused and link it to its issue.
- Never commit secrets, local environment files, build output, or unrelated changes.

## Suggested setup

1. Create a new GitHub repository for this lab.
2. Copy these files into your local repository.
3. Open the folder in VS Code.
4. Run `dart pub get`.
5. Run `dart test` to establish the baseline.
6. Create GitHub Issues from the Markdown files in `practice/issues/`.
7. Work on **one ticket at a time** using the workflow below.

> If you want to use Flutter tooling, you can place these Dart files inside a Flutter project later. This starter is a pure Dart package so the repository, test, and CI workflow stays small and easy to inspect.

## Workflow for every ticket

1. **Ticket:** Read the issue. Restate the problem in your own words. Identify unclear requirements and ask a question before coding if necessary.
2. **Plan:** Identify affected files, expected behavior, edge cases, and tests. Add a short plan as an issue comment.
3. **Branch:** Start from the current `main` branch and create a focused branch, for example `fix/course-id-validation`.
4. **Reproduce:** For a bug, first create a test that demonstrates the reported defect. For a feature, write tests for the acceptance criteria.
5. **Implement:** Make the smallest maintainable change that meets the requirement.
6. **Verify:** Run `dart format .`, `dart analyze`, and `dart test`. Add other checks when the ticket calls for them.
7. **Commit:** Use a focused Conventional Commit message.
8. **Pull request:** Use `.github/pull_request_template.md`; link the issue using `Closes #<issue-number>`.
9. **CI:** Read the GitHub Actions result. If it fails, diagnose the failing step rather than bypassing it.
10. **Review:** Review your own diff as if you were a teammate. Address feedback and push revisions.
11. **Merge:** Merge only when required checks pass and review is complete. Delete the branch if appropriate.
12. **Reflect:** Add a short issue or PR comment explaining what you learned and any trade-off.

## Definition of done

A ticket is complete only when:
- Its acceptance criteria are met.
- Tests cover relevant expected behavior and important edge cases.
- Formatting, analysis, and tests pass.
- The diff contains only relevant changes.
- The PR explains the change and testing performed.
- CI is green.
- The issue and PR are linked and closed appropriately.

## Practice tickets

Read `practice/issue_index.md` for the recommended order. The full ticket descriptions are in `practice/issues/`. Tickets are designed to be independent unless the index explicitly says otherwise.

## Useful commands

```bash
dart pub get
dart format .
dart analyze
dart test

git status
git diff
git diff --cached
git log --oneline -5
```

## Important

The starter code is intentionally small. The starter includes a small number of intentional defects and incomplete contracts. The practice tickets describe the behavior you should deliver, but **do not include solutions or identify the exact lines containing defects**. Some tickets require you to decide the appropriate design, test cases, and implementation details. Document your reasoning in the issue and PR.
# mid-level-engineering-workflow
