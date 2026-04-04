#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: lookup_project.sh <project-name-or-alias>" >&2
  exit 1
fi

query="$1"
base="/Users/jinlin/.codex/skills/project-path-registry/references"
rg -n -i -C 3 -- "$query" "$base/local-projects.md" "$base/wsa-projects.md"
