# claudez-skills

Public registry of skills for [claudez](https://github.com/vuongphamdev/claudez).

## Getting started

### 1. Install claudez

```sh
npm install -g claudez
```

### 2. Search for a skill

```sh
claudez search review
```

### 3. Install a skill

```sh
claudez install code-review        # project scope
claudez install code-review -g     # global scope (available in every project)
```

### 4. Use the skill in Claude Code

Once installed, invoke the skill as a slash command inside Claude Code:

```
/code-review
```

## Commands

### `claudez install [source]`

Install a skill from the registry, a GitHub URL, or an `owner/repo` reference.

| Flag | Description |
|------|-------------|
| `-a, --all` | Install every skill listed in the registry |
| `-g, --global` | Install to user-level (`~/.claude/commands`) instead of project-level (`./.claude/commands`) |
| `-f, --force` | Overwrite an existing skill without asking for confirmation |

### `claudez list`

List skills installed in the current project and globally.

| Flag | Description |
|------|-------------|
| `-g, --global` | Only show user-level skills |

### `claudez remove [name]`

Remove an installed skill (or all with `--all`).

| Flag | Description |
|------|-------------|
| `-a, --all` | Remove every installed skill in the target scope |
| `-g, --global` | Remove from user-level skills |
| `-f, --force` | Skip the confirmation prompt when using `--all` |

### `claudez search <query>`

Search the registry for skills by name, description, or tags.

## Examples

```sh
claudez search review              # Search the registry for "review"
claudez install code-review        # Install a registry skill to the current project
claudez install --all              # Install every skill from the registry
claudez install -a -g              # Install every registry skill globally
claudez install code-review -g     # Install globally (available in every project)
claudez install owner/repo         # Install all skills from a GitHub repo
claudez install owner/repo/path.md # Install a single file from a GitHub repo
claudez install <name> -f          # Skip the overwrite prompt
claudez list                       # Show installed skills (project + global)
claudez remove <name>              # Remove a skill from the current project
claudez remove --all               # Remove every project skill (prompts to confirm)
claudez remove -a -g -f            # Remove every global skill without confirming
```

## Contribute a skill

1. Add a markdown file under `skills/` with frontmatter (`name`, `description`, `version`).
2. Add an entry to `registry.json` with the matching `name`, `filename`, and `url`.
3. Open a PR.

## Structure

- `registry.json` — index of all published skills, fetched by the `claudez` CLI.
- `skills/*.md` — the skill files themselves. Each is downloaded individually on install.
