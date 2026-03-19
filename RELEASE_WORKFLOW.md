# Release Workflow

This repository is the stable source of truth for reusable Codex skills.

## Rule of thumb

- Develop and revise a skill inside a project repository first.
- Promote it here only after it is reusable, de-sensitive, and structurally stable.
- Install or refresh it from this repository into `~/.codex/skills`.

## Recommended flow

1. **Draft in a project repo**
   - Work in `project/skills/<skill-name>/`.
   - Iterate until the skill is genuinely reusable.

2. **Generalize before promotion**
   - Remove passwords, tokens, private paths, and machine-specific secrets.
   - Remove project-only noise that does not belong in a cross-project skill.

3. **Copy into this repository**
   - Sync the finalized skill into `research-codex-skills/skills/<skill-name>/`.
   - Keep the skill structure minimal:
     - `SKILL.md`
     - `agents/openai.yaml`
     - `references/`

4. **Review the diff**
   - Check that only intended files changed.
   - Confirm the skill description still matches the actual trigger use case.

5. **Commit and push**
   - Commit the promoted skill or skill update here.
   - Push to GitHub so other devices can install the same version.

6. **Refresh local installation**
   - Reinstall or sync the updated skill into `~/.codex/skills`.
   - Restart Codex so the new version is loaded.

## Important boundaries

- Do **not** develop directly inside `~/.codex/skills`.
- Do **not** store secrets in this repository.
- Do **not** promote half-finished, project-specific draft skills here.
