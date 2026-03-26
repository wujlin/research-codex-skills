---
name: wsa-remote-ops
description: Use when the user asks to connect to the WSA server over SSH, inspect or operate on /home/jinlin/projects, run remote commands on 10.13.12.164, sync/check files on that machine, or choose the default Python environment there. This skill standardizes the working SSH path, the required password env var, the preferred WSA environment `dpl`, and the first commands to use so agents do not waste time rediscovering proxy, authentication, and environment details.
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
2. Prefer the bundled script `scripts/run_wsa_ssh.sh` instead of hand-writing `sshpass` commands every time.
3. Provide the password via `WSA_SSH_PASSWORD`; never store it in the skill or repository.
4. If `sshpass` is missing, install it first with `brew install sshpass`.
5. For discovery tasks, start with a shallow listing of `~/projects` before diving into one repo.
6. If Python work requires an environment on WSA, prefer the `dpl` environment by default unless the project documentation explicitly says otherwise.

## Task routing

- For one-off remote commands, use `scripts/run_wsa_ssh.sh 'command'`.
- For an interactive shell, run `scripts/run_wsa_ssh.sh` with no arguments.
- For project discovery, first run `ls -la ~/projects` and then `find ~/projects -maxdepth 2 -mindepth 1 -type d | sort`.
- If Python, pip, notebook, or experiment commands are needed on WSA, activate `dpl` first unless a project-specific override is documented.
- If the host alias fails, inspect `~/.ssh/config` before trying alternate connection methods.

## Output defaults

- Report the remote path explicitly.
- Keep directory listings shallow unless the user asks for a deeper tree.
- Do not repeat the password in output.
- If a remote command depends on Python packages, state whether it was run inside `dpl`.
