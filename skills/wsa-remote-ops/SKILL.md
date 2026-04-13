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
- For scripted password-auth `ssh`/`rsync` automation, `expect -c 'spawn ssh/rsync ...; expect "password:"; send ...'` is acceptable when direct interactive `ssh` is reliable but `sshpass`-style flows are not.
- If the task is CPU-bound preprocessing, consider scaling workers toward the machine limit instead of staying at conservative defaults; use a lower value only when I/O, dataset size, or library behavior justifies it.
- If the task is memory-heavy, budget explicitly against the machine's `128 GB` RAM instead of assuming a small workstation.
- If the task is GPU-bound, size batch, model, or shard settings against the available `48 GB` VRAM.
- If SSH dies before the password phase, run `lsof -iTCP:1080 -sTCP:LISTEN -n -P` first and confirm OrbStack is providing the local proxy.
- If the host alias fails after the proxy check, inspect `~/.ssh/config` before trying alternate connection methods.

## MinerU on WSA

The current WSA setup for PDF extraction is:

- repo path: `~/projects/Research_Collector`
- conda env: `dpl`
- MinerU version: `3.0.9`
- config file: `~/mineru.json`
- local model source: `local` with models already downloaded under `~/.cache/modelscope`
- API session: `tmux` session `mineru_api`
- API port: `18000` because port `8000` is already occupied on this machine

Use this flow when the task is to parse PDFs on WSA and bring results back:

1. Sync the repo code first so local and WSA use the same extraction scripts.
   Preferred target path: `~/projects/Research_Collector`
2. Ensure the WSA-side MinerU API is available.
   Run: `cd ~/projects/Research_Collector && bash scripts/wsa_ensure_mineru_api.sh`
3. Decide the execution mode.
   For a WSA-local parse, run:
   `CONDA_NO_PLUGINS=true /home/jinlin/miniconda3/bin/conda run -n dpl mineru --api-url http://127.0.0.1:18000 -p <pdf_path> -o <output_dir>`
   For local-to-WSA-to-local automation from the macOS workspace, set `WSA_SSH_PASSWORD` and run:
   `python scripts/extract_pdfs_via_wsa.py pdfs/<date-or-file> --force`
4. Verify the returned output directory beside the source PDF.
   Expected local path: `<pdf_stem>.mineru/`
5. Inspect the core return files.
   Expect `hybrid_auto/*.md`, `*_content_list.json`, `*_layout.pdf`, `*_middle.json`, and copied source PDF.

Operational notes:

- Prefer calling the API from inside WSA via `127.0.0.1:18000`; external raw HTTP to `10.13.12.164:18000` is not the validated path.
- The automation script stages PDFs under the remote repo's `.wsa_mineru/runs/<timestamp>/` area, runs MinerU there, and syncs results back.
- The returned output should include `hybrid_auto/*.md`, `*_content_list.json`, `*_layout.pdf`, and the original copied PDF.

## Output defaults

- Report the remote path explicitly.
- Keep directory listings shallow unless the user asks for a deeper tree.
- Do not repeat the password in output.
- If a remote command depends on Python packages, state whether it was run inside `dpl`.
- If compute settings matter, report the chosen worker count, memory assumptions, or GPU usage rather than leaving them implicit.
- If SSH fails, report whether the local proxy at `127.0.0.1:1080` was listening.
