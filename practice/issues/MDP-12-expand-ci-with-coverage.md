# MDP-12 — Expand CI with coverage reporting

## Problem
The current CI workflow runs formatting, static analysis, and tests but does not retain a coverage report for later inspection.

## Expected behavior
The CI workflow produces a coverage report when tests run and makes the report available as a workflow artifact. A report-generation or upload failure should be visible rather than silently ignored.

## Acceptance criteria
- [ ] Investigate Dart's available coverage output for the current test setup.
- [ ] Update the workflow to generate coverage data.
- [ ] Produce a human-inspectable report or coverage data artifact.
- [ ] Upload the report as a GitHub Actions artifact.
- [ ] Ensure the workflow still runs formatting, analysis, and tests.
- [ ] Confirm the artifact is available on a successful workflow run.
- [ ] Document how to retrieve and inspect the artifact.
- [ ] Avoid exposing secrets or uploading unrelated workspace files.

## Investigation prompts
- Which command produces the needed coverage data?
- Does the runner need an additional tool to render an HTML report?
- Should the workflow fail if report generation or artifact upload fails?
- How will you keep the artifact scope limited to relevant coverage output?

## Definition of done
A successful workflow run provides a usable coverage artifact, the required checks still work, and the PR explains the artifact contents and any added dependencies.
