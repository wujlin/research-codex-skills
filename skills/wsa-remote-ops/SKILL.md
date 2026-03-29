---
name: wsa-remote-ops
description: Use when the user asks to connect to the WSA server over SSH, inspect or operate on /home/jinlin/projects, run remote commands on 10.13.12.164, sync/check files on that machine, or choose the default Python environment there. This skill standardizes the working SSH path, the required password env var, the local OrbStack SOCKS proxy requirement at 127.0.0.1:1080, the preferred WSA environment `dpl`, the machine's rough compute profile (128 GB RAM, 48-way CPU parallelism, 48 GB GPU), and the first commands to use so agents do not waste time rediscovering proxy, authentication, and environment details.
---

# WSA Remote Ops

Use this skill when the task involves any of the following:

- connecting to the WSA server at `10.13.12.164`
- checking `~/projects` or any project directory on that server
- running remote shell commands, searches, or file inspections there
- syncing or copying files to or from the WSA machine
- choosing which Python environment to use on the WSA machine

## Core workflow

1. Do not reinvent the SSH route. Use the existing host alias `10.13.12.164`.
2. The host alias currently depends on a local SOCKS5 proxy at `127.0.0.1:1080`, normally provided by OrbStack via `~/.ssh/config`.
3. Prefer the bundled script `scripts/run_wsa_ssh.sh` instead of hand-writing `sshpass` commands every time.
4. Provide the password via `WSA_SSH_PASSWORD`; never store it in the skill or repository.
5. If `sshpass` is missing, install it first with `brew install sshpass`.
6. If SSH fails before the password prompt, first check whether `127.0.0.1:1080` is listening; do not assume the password or server is wrong.
7. For discovery tasks, start with a shallow listing of `~/projects` before diving into one repo.
8. If Python work requires an environment on WSA, prefer the `dpl` environment by default unless the project documentation explicitly says otherwise.
9. Treat WSA as the default heavy-compute target: plan around roughly `128 GB` RAM, up to `48` CPU workers for parallel preprocessing, and one `48 GB` GPU for CUDA workloads.
10. Do not default to laptop-scale worker counts on WSA. Choose resource-aware settings and state them explicitly.

## Task routing

- For one-off remote commands, use `scripts/run_wsa_ssh.sh 'command'`.
- For an interactive shell, run `scripts/run_wsa_ssh.sh` with no arguments.
- For project discovery, first run `ls -la ~/projects` and then `find ~/projects -maxdepth 2 -mindepth 1 -type d | sort`.
- If Python, pip, notebook, or experiment commands are needed on WSA, activate `dpl` first unless a project-specific override is documented.
- If the task is CPU-bound preprocessing, consider scaling workers toward the machine limit instead of staying at conservative defaults; use a lower value only when I/O, dataset size, or library behavior justifies it.
- If the task is memory-heavy, budget explicitly against the machine's `128 GB` RAM instead of assuming a small workstation.
- If the task is GPU-bound, size batch, model, or shard settings against the available `48 GB` VRAM.
- If SSH dies before the password phase, run `lsof -iTCP:1080 -sTCP:LISTEN -n -P` first and confirm OrbStack is providing the local proxy.
- If the host alias fails after the proxy check, inspect `~/.ssh/config` before trying alternate connection methods.

## Output defaults

- Report the remote path explicitly.
- Keep directory listings shallow unless the user asks for a deeper tree.
- Do not repeat the password in output.
- If a remote command depends on Python packages, state whether it was run inside `dpl`.
- If compute settings matter, report the chosen worker count, memory assumptions, or GPU usage rather than leaving them implicit.
- If SSH fails, report whether the local proxy at `127.0.0.1:1080` was listening.
