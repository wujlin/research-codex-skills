---
name: youtube-lecture-digest
description: Turn a YouTube research lecture into a cleaned transcript, curated slides, and an integrated Chinese study note inside the Research_Collector workflow. Use when the user asks to transcribe a research talk, clean accent-heavy ASR output, extract PPT or slide frames, align sections with slides, or build a reusable lecture study pack from a long-form video.
---

# YouTube Lecture Digest

## Overview

Use the existing project scripts instead of rebuilding the workflow ad hoc. Treat the final deliverable as a study pack with four outputs:

- cleaned transcript
- curated slides
- Chinese integrated note
- explicit self-check

The slide pipeline has two layers:

- `extract_video_slides.py` for rough scene-detect drafts
- `cleanup_slide_assets.py` for final cleanup of the curated set

For blackboard-heavy lectures or talks with very few hard scene cuts, the extraction step may need interval-based sampling rather than pure scene detection.

If the repo does not contain the expected scripts, inspect the repo first instead of assuming this skill applies unchanged.

## Preconditions

- Confirm these scripts exist:
  - `scripts/transcribe_youtube.py`
  - `scripts/refine_youtube_transcript.py`
  - `scripts/extract_video_slides.py`
  - `scripts/cleanup_slide_assets.py`
- Confirm outputs live under:
  - `youtube/transcripts/`
  - `youtube/slides/`
- Respect the project digest layout:
  - daily digests live under `digests/YYYY-MM-DD/`
  - reusable lecture or topic notes should live outside `digests/`, typically under `youtube/notes/`
- For long videos, heavy models, or network-sensitive downloads on Jinlin's machine, use `wsa-remote-ops` and prefer the `dpl` environment.

## Workflow

### 1. Transcribe

- Prefer `large-v3`.
- Fall back to `medium.en` only if VRAM, runtime, or remote contention makes `large-v3` impractical.
- Pass an `--initial-prompt` containing speaker name, field terms, theorem names, and recurring technical vocabulary.
- Write results into `youtube/transcripts/<video-id>-<slug>/`.
- Overwrite weaker earlier runs with `--force`; do not keep multiple competing “final” transcripts.

### 2. Refine Transcript

- Run `scripts/refine_youtube_transcript.py <transcript_dir>`.
- Update `config/transcript_terms.yaml` when recurring domain errors appear.
- Prioritize concept-critical repairs:
  - theorem names
  - speaker names
  - field terminology
  - physically meaningful variables or quantities
- Do not over-edit noisy Q&A into polished prose. Preserve uncertainty where ASR is still weak.

### 3. Build Slides

- Treat `scripts/extract_video_slides.py` as a rough first pass only.
- Do not trust scene-detection output as the final slide set for research notes.
- If scene detection under-fires, rerun extraction with fallback interval sampling and then curate board frames instead of insisting on PPT-like slides.
- For the final artifact, build a `curated/` slide subset from hand-chosen timestamps aligned with the lecture’s conceptual sections.
- Target roughly `10-20` frames spanning the whole lecture, not just the opening or animation-heavy parts.
- Remove near-duplicates.
- For blackboard lectures, treat the image set as `key board states`, not literal slide pages.
- After the curated set is assembled, run `scripts/cleanup_slide_assets.py` on the lecture slide directory.
- The cleanup pass should:
  - crop away black borders
  - remove obvious video-conference overlays such as the top-right meeting tile
  - regenerate `curated/contact_sheet.jpg`
  - purge legacy root-level `slide-*.jpg` artifacts when they are no longer needed
- The lecture root should end with a short index that points to `curated/` as the canonical slide package, not a second competing frame list.
- Produce:
  - `curated/index.md`
  - `curated/contact_sheet.jpg`

### 4. Write Integrated Chinese Note

- Create a lecture note under `youtube/notes/`, not inside the transcript directory.
- Use a semantic filename based on speaker and topic, for example:
  - `youtube/notes/takahiro-sagawa-stochastic-thermodynamics.md`
  - `youtube/notes/bernard-derrida-large-deviations-of-non-equilibrium-diffusive-systems.md`
- Organize by concept sections, not minute-by-minute dumping.
- For each section, include:
  - time range
  - 1-3 representative curated frames
  - concise Chinese synthesis
- Keep the opening minimal. Do not add low-information boilerplate such as:
  - `How To Read`
  - `Note type`
  - process narration about ASR, cleaning, or frame extraction
  unless the user explicitly asks for workflow details inside the note.
- Keep the distinction clear:
  - transcript cleanup is “better English”
  - integrated note is “Chinese conceptual digest”

### 5. Place Study Outputs In The Right Layer

- The transcript directory keeps only transcript-local artifacts such as:
  - `metadata.json`
  - `transcript.md`
  - `transcript.json`
  - `transcript.txt`
- The lecture-local Chinese study note lives under `youtube/notes/`.
- If the user also wants a daily workflow summary, fold it into the day's `digests/YYYY-MM-DD/study-guide.md`.
- Do not create extra daily files such as `start-here.md` or standalone lecture companion pages when the content can live inside `study-guide.md`.
- Reusable concept notes also live under `youtube/notes/`; do not duplicate the same lecture note under both `youtube/transcripts/` and `youtube/notes/`.

### 6. Self-Check Before Finishing

- Verify every image and Markdown link exists.
- Check that slides cover the full lecture arc.
- Check that curated slides do not contain obvious duplicates.
- Check that final curated slides are visually clean:
  - no black side borders
  - no obvious meeting overlay or speaker tile
- Check that lecture outputs are not split across conflicting locations:
  - transcript artifacts remain under `youtube/transcripts/`
  - slide artifacts remain under `youtube/slides/`
  - lecture notes and reusable topic notes go to `youtube/notes/`
  - daily workflow summaries, if needed, go to `digests/YYYY-MM-DD/study-guide.md`
- Check that terminology is consistent across transcript, slide index, and Chinese note.
- State any remaining uncertainty, especially in Q&A-heavy segments.

## Quality Bar

- Transcript is readable enough for study.
- Key theorems and technical terms are corrected.
- Curated slides are representative and low-duplicate.
- Curated slides look study-ready rather than screen-capture raw.
- The Chinese note is usable without replaying the whole video.
- Do not stop after generating partial artifacts.

## Reference

Read [workflow.md](./references/workflow.md) when you need concrete command patterns, artifact layout, or the final verification checklist.
