#!/usr/bin/env bash
set -euo pipefail

if ! command -v sshpass >/dev/null 2>&1; then
  echo "sshpass is not installed. Install it with: brew install sshpass" >&2
  exit 1
fi

: "${WSA_SSH_PASSWORD:?Set WSA_SSH_PASSWORD before using this script.}"

export SSHPASS="${WSA_SSH_PASSWORD}"
target="${WSA_SSH_TARGET:-10.13.12.164}"
proxy_host="${WSA_SOCKS_HOST:-127.0.0.1}"
proxy_port="${WSA_SOCKS_PORT:-1080}"
ssh_opts=(-o NumberOfPasswordPrompts=1 -o StrictHostKeyChecking=no)

if [[ "${WSA_SKIP_PROXY_CHECK:-0}" != "1" ]]; then
  if ! nc -z "${proxy_host}" "${proxy_port}" >/dev/null 2>&1; then
    echo "Local SOCKS proxy ${proxy_host}:${proxy_port} is not listening." >&2
    echo "This WSA SSH route expects OrbStack to expose 127.0.0.1:1080 via ~/.ssh/config." >&2
    echo "Check with: lsof -iTCP:${proxy_port} -sTCP:LISTEN -n -P" >&2
    exit 1
  fi
fi

if [[ $# -eq 0 ]]; then
  exec sshpass -e ssh -tt "${ssh_opts[@]}" "${target}"
else
  exec sshpass -e ssh "${ssh_opts[@]}" "${target}" "$@"
fi
