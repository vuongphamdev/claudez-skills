---
name: example-skill
description: Example skill showing the expected format. Replace or remove before publishing real skills.
version: 1.0.0
---

# Example Skill

This is a placeholder skill. When a user runs `claudez install example-skill`, the whole folder is copied into `.claude/skills/example-skill/` and Claude Code will discover it as the `example-skill` skill.

## Folder structure

A skill folder can contain:

```
skills/example-skill/
├── SKILL.md          # Required — this file
├── scripts/          # Optional — helper scripts
├── references/       # Optional — reference docs or specs
└── assets/           # Optional — images, templates, or static files
```

## Instructions

Write the actual skill instructions here. For example:

> When the user asks you to do X, follow these steps:
> 1. ...
> 2. ...
