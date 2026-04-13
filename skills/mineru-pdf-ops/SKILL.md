---
name: mineru-pdf-ops
description: Use when deploying MinerU on WSA, starting or checking the MinerU API, extracting PDFs through MinerU, or running the Research_Collector workflow that syncs local PDFs to WSA and returns `.mineru/` outputs. Use `wsa-remote-ops` for generic SSH, proxy, and WSA environment setup.
---

# MinerU PDF Ops

Use this skill when the task involves any of the following:

- deploying or repairing MinerU on the WSA machine
- starting, checking, or restarting the WSA-side MinerU API
- sending local PDFs to WSA for MinerU parsing and syncing results back
- running the Research_Collector PDF extraction pipeline end to end
- post-processing returned MinerU outputs such as image-file renaming

## Boundaries

- For generic SSH, proxy, password, or remote-shell setup, use `wsa-remote-ops`.
- For project-root lookup or local-versus-WSA path mapping, use `project-path-registry`.
- For reading extracted figures or checking captions against visible panels, use `research-figure-analysis`.

## Standard environment

- local repo: `/Users/jinlin/Desktop/Project/Research_Collector`
- WSA repo: `~/projects/Research_Collector`
- conda env: `dpl`
- API port: `18000`
- tmux session: `mineru_api`
- returned output directory: `<pdf_stem>.mineru/` beside the source PDF

## Workflow

1. Sync the repo code to WSA first so both sides use the same scripts.
   Preferred target path: `~/projects/Research_Collector`
2. Ensure the WSA-side MinerU API is up.
   Run: `cd ~/projects/Research_Collector && bash scripts/wsa_ensure_mineru_api.sh`
3. Choose the execution mode.
   For a WSA-local parse, run:
   `CONDA_NO_PLUGINS=true /home/jinlin/miniconda3/bin/conda run -n dpl mineru --api-url http://127.0.0.1:18000 -p <pdf_path> -o <output_dir>`
   For local-to-WSA-to-local automation from the macOS workspace, set `WSA_SSH_PASSWORD` and run:
   `python scripts/extract_pdfs_via_wsa.py pdfs/<date-or-file> --force`
4. Verify the returned output directory beside the source PDF.
   Expect `hybrid_auto/*.md`, `*_content_list.json`, `*_layout.pdf`, `*_middle.json`, and the copied source PDF.
5. If the returned image names are opaque hashes, normalize them with:
   `python scripts/rename_mineru_images.py <pdf_stem>.mineru/hybrid_auto`

## Deployment and repair

- If the WSA environment is missing MinerU, repair it inside `dpl`:
  `CONDA_NO_PLUGINS=true /home/jinlin/miniconda3/bin/conda run -n dpl python -m pip install -U mineru`
- The API launcher expects models to be available locally and sets `MINERU_MODEL_SOURCE=local`.
- After any repair or upgrade, rerun:
  `cd ~/projects/Research_Collector && bash scripts/wsa_ensure_mineru_api.sh`

## Operational notes

- Prefer calling the API from inside WSA via `127.0.0.1:18000`; external raw HTTP to `10.13.12.164:18000` is not the validated path.
- The automation script stages PDFs under `.wsa_mineru/runs/<timestamp>/` inside the WSA repo, runs MinerU there, and syncs results back.
- Local automation requires `expect`, `rsync`, and `WSA_SSH_PASSWORD`.
- If SSH fails before the password phase, return to `wsa-remote-ops` and check the local proxy at `127.0.0.1:1080`.
- If a local `.mineru/` output directory already exists, rerun with `--force` only when overwriting is intended.
