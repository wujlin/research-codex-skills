# research-codex-skills

Personal Codex skills for research workflows.

This repository stores stable, reusable skills that can be shared across projects and devices. It is intended to be the source-of-truth repository for skills that have already been generalized and stripped of project-specific secrets.

## Repository structure

```text
skills/
  <skill-name>/
    SKILL.md
    agents/openai.yaml
    references/
```

## Current skills

- `research-writing-and-figures`
  - scientific manuscript revision
  - caption and figure-text alignment
  - restrained academic figure style
  - research-to-presentation language conversion

- `research-experiment-ops`
  - experiment naming and output structure
  - logging and artifact completeness
  - local/remote sync discipline
  - dataset registration
  - manuscript-readiness checks
  - `git worktree` usage for parallel task streams

## Installation

Install a skill into `~/.codex/skills` with the built-in installer:

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo wujlin/research-codex-skills \
  --path skills/research-writing-and-figures
```

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo wujlin/research-codex-skills \
  --path skills/research-experiment-ops
```

After installation, restart Codex to load new skills.

## Publishing updates

For the promotion path from a project-local draft skill to this repository and then to `~/.codex/skills`, see [RELEASE_WORKFLOW.md](RELEASE_WORKFLOW.md).

## Maintenance rule

Project repositories can contain draft or incubating skills. Only move a skill into this repository after it is:

- reusable across projects
- stripped of secrets and local-only credentials
- structurally stable enough to serve as a long-term reference
