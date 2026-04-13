# Workflow Reference

## Expected Inputs

- A YouTube lecture URL
- A repo that already contains:
  - `scripts/transcribe_youtube.py`
  - `scripts/refine_youtube_transcript.py`
  - `scripts/extract_video_slides.py`
  - `scripts/cleanup_slide_assets.py`

## Expected Outputs

For a video `m023IrSLF-k-an-introduction-to-stochastic-thermodynamics-takahiro-sagawa`:

- `youtube/transcripts/m023IrSLF-k-an-introduction-to-stochastic-thermodynamics-takahiro-sagawa/metadata.json`
- `youtube/transcripts/m023IrSLF-k-an-introduction-to-stochastic-thermodynamics-takahiro-sagawa/transcript.md`
- `youtube/notes/takahiro-sagawa-stochastic-thermodynamics.md`
- `youtube/slides/m023IrSLF-k-an-introduction-to-stochastic-thermodynamics-takahiro-sagawa-nest/curated/index.md`
- `youtube/slides/m023IrSLF-k-an-introduction-to-stochastic-thermodynamics-takahiro-sagawa-nest/curated/contact_sheet.jpg`
- `youtube/slides/m023IrSLF-k-an-introduction-to-stochastic-thermodynamics-takahiro-sagawa-nest/index.md`

If the user also wants daily workflow material, use the project digest conventions:

- `digests/YYYY-MM-DD/study-guide.md` for same-day reading workflow
- `youtube/notes/<topic>.md` for reusable lecture or concept notes

Do not create extra digest wrappers such as `start-here.md` for lecture work.

## Command Patterns

### Transcript

```bash
python scripts/transcribe_youtube.py "<youtube-url>" \
  --backend whisper \
  --model large-v3 \
  --language en \
  --device cuda \
  --beam-size 8 \
  --initial-prompt "speaker name, field terms, theorem names" \
  --force
```

### Refinement

```bash
python scripts/refine_youtube_transcript.py \
  youtube/transcripts/<video-id>-<slug>
```

### Rough Slide Pass

```bash
python scripts/extract_video_slides.py "<youtube-url>" --force
```

Use this only as a draft. For final notes, curate timestamps manually and extract representative frames with `ffmpeg`.

If the talk is a blackboard lecture or has very few hard scene cuts, rerun with fallback interval sampling:

```bash
python scripts/extract_video_slides.py "<youtube-url>" \
  --max-height 720 \
  --minimum-slides 8 \
  --fallback-interval-seconds 180 \
  --force
```

### Final Slide Cleanup

```bash
python scripts/cleanup_slide_assets.py \
  youtube/slides/<video-id>-<slug> \
  --purge-root
```

Use this after the `curated/` folder is final. The cleanup pass should leave:

- cropped curated frames
- a regenerated `curated/contact_sheet.jpg`
- no stale root-level `slide-*.jpg`
- a root `index.md` that points to `curated/` as the canonical package

## Curated Slide Policy

- Prefer section-aligned timestamps over automatic scene changes.
- For blackboard lectures, treat the image set as key board states rather than literal slide pages.
- Keep one final curated set.
- Do not keep a second “legacy” frame list visible to users once curation is complete.
- Use filenames that preserve order and semantic labels, such as:
  - `01-outline.jpg`
  - `05-jarzynski.jpg`
  - `14-wasserstein-bound.jpg`
- Final slides should be visually cleaned:
  - black borders removed
  - obvious meeting overlays removed or masked

## Digest Placement Policy

- Keep transcript-local canonical artifacts under `youtube/transcripts/<video-id>-<slug>/`.
- Keep slide-local canonical artifacts under `youtube/slides/<video-id>-<slug>/`.
- Put lecture notes and cross-day reusable topic notes in `youtube/notes/`.
- Put same-day reading workflow into `digests/YYYY-MM-DD/study-guide.md` only when the user explicitly wants a daily digest entry.
- Do not leave the same lecture summarized in multiple parallel digest files.

## Verification Checklist

- `metadata.json` shows the intended model, ideally `large-v3`.
- `transcript.md` no longer contains recurring high-impact ASR errors.
- The lecture note under `youtube/notes/` links only to the curated slide set and the matching transcript.
- The lecture note does not begin with low-signal boilerplate such as `How To Read`, `Note type`, or internal workflow narration unless explicitly requested.
- `curated/` covers the start, middle, and end of the lecture.
- No obvious duplicate frames remain.
- Curated slides are free of raw screen-capture clutter such as side black bars or meeting tiles.
- The lecture root contains only the curated-facing index, not stale extracted frames.
- No redundant digest wrappers were created for the same lecture task.
- All local links resolve.
