# claudez-skills

Public registry of skills for [claudez](https://github.com/vuongphamdev/claudez).

## Install a skill

```sh
claudez install <skill-name>            # project scope
claudez install <skill-name> -g         # global scope
```

## Contribute a skill

1. Add a markdown file under `skills/` with frontmatter (`name`, `description`, `version`).
2. Add an entry to `registry.json` with the matching `name`, `filename`, and `url`.
3. Open a PR.

## Structure

- `registry.json` — index of all published skills, fetched by the `claudez` CLI.
- `skills/*.md` — the skill files themselves. Each is downloaded individually on install.
