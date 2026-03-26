#!/usr/bin/env bash
set -euo pipefail

if ! command -v sshpass >/dev/null 2>&1; then
  echo "sshpass is not installed. Install it with: brew install sshpass" >&2
  exit 1
fi

: "${WSA_SSH_PASSWORD:?Set WSA_SSH_PASSWORD before using this script.}"

export SSHPASS="${WSA_SSH_PASSWORD}"
target="${WSA_SSH_TARGET:-10.13.12.164}"
ssh_opts=(-o NumberOfPasswordPrompts=1 -o StrictHostKeyChecking=no)

if [[ $# -eq 0 ]]; then
  exec sshpass -e ssh -tt "${ssh_opts[@]}" "${target}"
else
  exec sshpass -e ssh "${ssh_opts[@]}" "${target}" "$@"
fi
