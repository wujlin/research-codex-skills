# Remote and Sync

## Core principle

Remote and local environments must be treated as two explicit locations with different roles:

- remote: training, heavy data, heavy outputs
- local: writing, review, figure polishing, small-scale checks

For Jinlin's setup, default heavy compute to WSA rather than the local laptop. Assume roughly:

- `128 GB` RAM
- up to `48` CPU workers for preprocessing or parallel data jobs
- one `48 GB` GPU for CUDA workloads

## Rules

- Never rely on memory for remote paths; register them.
- Sync only what is needed for writing or verification.
- Large raw data should stay out of git.
- Sample files, manifests, and small summaries should be versioned when they help interpretation.
- Do not default to conservative laptop-scale worker counts on WSA. Pick resource-aware settings and state them explicitly.

## What to sync back

Prioritize:

- `run_summary.json`
- `metrics/*.json`
- figure/table exports used by the manuscript
- lightweight sample outputs that explain a large dataset

Avoid syncing by default:

- giant raw data files
- transient caches
- incomplete checkpoints with no downstream value
- reproducible heavy intermediates that can be rebuilt remotely faster than they can be copied

## SSH hygiene

- Store host, username, and path conventions as reusable notes or references.
- Do **not** store passwords or other secrets inside the skill or repository.
- If a host matters to the project, record its purpose, not just its address.

## Sync discipline

Before editing manuscript text from a remote result, confirm:

1. the referenced run exists remotely
2. the relevant summary files are synced locally
3. the local manuscript is reading the same run you think it is reading

For remote runs, also record:

1. worker count or process count
2. GPU count and any batch-size assumption
3. whether the run depended on WSA-only memory headroom
