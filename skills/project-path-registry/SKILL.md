---
name: project-path-registry
description: Use when locating a project root, dataset directory, global data root, output directory, or local-versus-WSA path mapping for Jinlin's research projects. This skill provides a machine-specific registry of project roots, WSA global data roots, and common data directories so agents can find the right paths quickly instead of guessing or searching the filesystem from scratch.
---

# Project Path Registry

Use this skill when the task involves any of the following:

- finding where a project lives on the local machine
- finding the corresponding project path on the WSA server
- locating the main global data roots on the WSA server
- locating common in-project data, dataset, output, figure, or log directories
- checking whether a local project name differs from the WSA-side project name
- avoiding path drift across agents and sessions

## Core workflow

1. Check the registry before searching the filesystem.
2. Distinguish local macOS paths from WSA paths, and distinguish project roots from global data roots.
3. Report the project root first when relevant, then the relevant data or output directories.
4. If the project exists under different names locally and on WSA, state both names explicitly.
5. If a requested project is missing from the registry, do a shallow inspection, then update the registry.

## Reference map

- For local machine project roots and common data directories, read [references/local-projects.md](references/local-projects.md).
- For WSA-side project roots, global data roots, and common data directories, read [references/wsa-projects.md](references/wsa-projects.md).

## Task routing

- If the user asks about a Mac path, load `local-projects.md` first.
- If the user asks about WSA, `/home/jinlin/projects`, `/home/jinlin/data`, or `/home/jinlin/DATASET`, load `wsa-projects.md` first.
- If the user only gives a project name, check both references and report both paths when available.
- If the project is not yet registered, inspect shallowly and append it to the right reference file.

## Output defaults

- Prefer absolute paths.
- State whether the path is local, WSA, or both.
- Call out aliases and name mismatches explicitly.
- Separate project root from global data roots, in-project data directories, outputs, and document folders.
