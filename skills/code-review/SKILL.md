---
name: code-review
description: Review code changes for bugs, security issues, and best practices, then output a structured report.
version: 1.0.0
---

# Code Review

Review staged or committed code changes and produce a structured review report.

## Instructions

When the user invokes this skill:

1. Determine the diff to review:
   - If the user provides a commit hash or branch, use `git diff <ref>`.
   - Otherwise, run `git diff --cached`. If nothing is staged, fall back to `git diff` (unstaged changes).
   - If there are no changes at all, tell the user and stop.

2. Run the helper script to gather context:

   ```sh
   bash ./scripts/gather-context.sh
   ```

   This collects repo metadata (language breakdown, recent contributors, open TODOs) that informs the review.

3. Analyze the diff against the checklist in `references/checklist.md`. For each category, note any issues found.

4. Rate the overall severity:
   - **Critical** — bugs, security vulnerabilities, data loss risks
   - **Warning** — performance issues, missing error handling, code smells
   - **Suggestion** — style, naming, readability improvements

5. Output the review using the template in `assets/review-template.md`.

6. If critical issues are found, ask the user whether they'd like you to fix them automatically.
