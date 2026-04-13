# research-codex-skills

Personal Codex skills for research workflows.

This repository stores stable skills for cross-project reuse, plus a small number of intentionally maintained private registry skills that are machine-specific but still safe to version because they contain no credentials or secrets.

## Repository structure

```text
skills/
  <skill-name>/
    SKILL.md
    agents/openai.yaml
    references/
    scripts/   # optional
```

## Current skills

- `autonomous-skill`
  - long-running, multi-session execution with task decomposition and continuation prompts

- `project-path-registry`
  - local project roots and common subdirectories
  - WSA project roots and global data roots
  - local-versus-WSA name mapping
  - fast lookup for project, dataset, output, and document paths

- `research-experiment-ops`
  - experiment naming and output structure
  - logging and artifact completeness
  - local/remote sync discipline
  - dataset registration
  - manuscript-readiness checks
  - `git worktree` usage for parallel task streams

- `research-figure-analysis`
  - PDF figure extraction
  - panel-by-panel reading and caption alignment
  - figure-text consistency checks for research notes and manuscripts

- `research-writing`
  - scientific manuscript drafting and revision
  - linear exposition and terminology control
  - low-redundancy research notes and digest writing

- `research-writing-and-figures`
  - use when writing and figure interpretation need to be handled together
  - shared routing layer between `research-writing` and `research-figure-analysis`

- `scientific-figure-prompting`
  - publication-grade research figure prompting
  - framework diagram and architecture panel prompts
  - graphical abstract and benchmark overview prompts
  - structured negative prompts and label-space control

- `scientific-module-iconography`
  - scientific icon taxonomy for framework figures
  - pseudo-3D and isometric module language
  - local edit patterns for weak or flat model stages
  - visual object grammar for data, modules, states, and outputs

- `wsa-remote-ops`
  - SSH access to the WSA server
  - remote project inspection under `/home/jinlin/projects`
  - standardized proxy, password, and environment conventions
  - WSA-side MinerU PDF extraction workflow for `Research_Collector`
  - MinerU workflow lives in `skills/wsa-remote-ops/SKILL.md`, section `## MinerU on WSA`

- `youtube-lecture-digest`
  - YouTube research lecture transcription and transcript cleanup
  - curated slide extraction and cleanup
  - Chinese integrated lecture notes and final self-check

## Installation

Install a skill into `~/.codex/skills` with the built-in installer:

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo wujlin/research-codex-skills \
  --path skills/<skill-name>
```

Available `<skill-name>` values in this repository:

- `autonomous-skill`
- `project-path-registry`
- `research-experiment-ops`
- `research-figure-analysis`
- `research-writing`
- `research-writing-and-figures`
- `scientific-figure-prompting`
- `scientific-module-iconography`
- `wsa-remote-ops`
- `youtube-lecture-digest`

Example:

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo wujlin/research-codex-skills \
  --path skills/wsa-remote-ops
```

After installation, restart Codex to load new skills.

## WSL quick start

If you are using Codex inside WSL, the smoothest setup is:

1. Make sure `python` is available inside WSL.
2. Install the skill directly from GitHub into the WSL-side `~/.codex/skills`.
3. Restart Codex inside WSL.

Example:

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo wujlin/research-codex-skills \
  --path skills/wsa-remote-ops
```

This installs the skills into the Linux/WSL home directory, not the Windows user profile.

## System notes

### macOS / Linux / WSL

- The commands above should work directly.
- `~/.codex/skills` is the normal installation location.

### Windows native

- The skill repository is still usable, but your Codex installation path may differ.
- You may need to adjust the path that points to the built-in installer script.
- If possible, prefer WSL over Windows-native shell for the smoothest experience.

### Important boundary

- This repository is cross-device and cross-project.
- Do not store passwords, tokens, SSH secrets, or other credentials here.
- Private machine-specific path registries are acceptable only when they contain no secrets and are intentionally maintained as part of this personal repository.
- Keep `~/.codex/skills` as the installed copy, not the development copy.

## Publishing updates

For the promotion path from a project-local draft skill to this repository and then to `~/.codex/skills`, see [RELEASE_WORKFLOW.md](RELEASE_WORKFLOW.md).

## Maintenance rule

Project repositories can contain draft or incubating skills. Only move a skill into this repository after it is:

- reusable across projects
- stripped of secrets and local-only credentials
- structurally stable enough to serve as a long-term reference

Exception:

- a private registry skill may live here even if it is machine-specific, as long as it contains no secrets and is useful as stable infrastructure across sessions and devices
