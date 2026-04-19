---
name: commit
description: Generate conventional commit messages from staged changes and create the commit.
version: 1.0.0
---

# Commit

Generate a conventional commit message from the current staged changes and create the commit.

## Instructions

When the user invokes this skill:

1. Run `git diff --cached` to inspect all staged changes. If nothing is staged, tell the user and stop.
2. Run `git log --oneline -10` to see recent commit style for consistency.
3. Analyze the staged diff and draft a commit message following the **Conventional Commits** format:

   ```
   <type>(<scope>): <short summary>

   <optional body>
   ```

   - **type**: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `style`, `perf`, `ci`, or `build`.
   - **scope**: the area of the codebase affected (e.g., `auth`, `api`, `ui`). Omit if the change is broad.
   - **short summary**: imperative mood, lowercase, no period, under 72 characters.
   - **body**: only include when the "why" isn't obvious from the summary. Keep it concise.

4. Present the proposed message to the user and ask for confirmation or edits before committing.
5. Create the commit with the confirmed message using `git commit -m "<message>"`.
