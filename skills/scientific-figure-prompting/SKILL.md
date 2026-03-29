---
name: scientific-figure-prompting
description: Use when generating or revising scientific figure prompts, 科研绘图 prompt, 框架图 prompt, graphical abstract prompt, model architecture diagram prompt, local edit prompt for an already generated figure, or remote sensing journal figure prompt. This skill turns research content or figure feedback into structured, publication-style prompts with composition planning, visual hierarchy, label strategy, targeted correction instructions, style constraints, and negative prompts so outputs look like rigorous paper figures instead of cartoons or generic flowcharts.
---

# Scientific Figure Prompting

Use this skill when the task involves any of the following:

- turning a paper method, dataset design, or evaluation setup into an image-generation prompt
- writing or revising a prompt for a framework diagram, model architecture panel, graphical abstract, mechanism figure, or benchmark overview
- editing an already generated figure with a local revision prompt instead of regenerating the whole image
- making a scientific figure look more publication-grade and less like a cartoon, dashboard, or business slide
- adding prompt structure for composition, stage order, module hierarchy, label handling, or negative constraints
- domain-specific prompting for remote sensing, geospatial, environmental, medical, or engineering visuals

## Core workflow

1. Define the figure job: what one panel or one whole figure must explain.
2. Lock the composition before style wording: orientation, stages, branch split, and the dominant visual anchor.
3. Convert scientific ideas into visible objects and relationships rather than paper-section labels.
4. Split the prompt into blocks: figure role, composition, stage details, style requirements, text policy, and negative prompt.
5. Reserve clean space for labels to be added later; do not rely on the image model to render readable paragraphs, equations, or dense legends.
6. Keep the visual tone publication-grade: light background, restrained palette, crisp geometry, mild depth, and technically credible structure.
7. If the figure already exists, do not default to a full regeneration prompt; write a targeted edit prompt that preserves the approved structure and lists only the must-fix changes.
8. If the figure includes panel letters such as `(a)`, `(b)`, `(c)`, or `(d)`, specify a stable panel-label anchor: keep the letter x-position aligned with the y-axis-title anchor or left label margin, and keep it clear of titles, legends, ticks, and plotted marks.

## Reference map

- For reusable prompt skeletons, figure-type recipes, remote-sensing phrasing, negative-prompt patterns, and local edit templates for already generated figures, read [references/prompt-recipes.md](references/prompt-recipes.md).

## Task routing

- If the user already has scientific content and wants a full prompt, start from the template in `references/prompt-recipes.md`.
- If the user brings an existing prompt, preserve the scientific content and tighten composition, visual hierarchy, style control, and exclusions.
- If the user already has a generated image and wants corrections, prefer a targeted modification prompt over a from-scratch prompt.
- If the figure is a framework or architecture panel, prioritize stage ordering, central model emphasis, and clear branch logic.
- If the figure is remote sensing or geospatial, explicitly specify data tiles, terrain/material/trigger cues, and an earth-tone plus blue-green palette.

## Output defaults

- Prefer structured prompt blocks over one long paragraph.
- Prefer concrete visual nouns and spatial relations over vague adjectives.
- Prefer scientific infographic language over cinematic or concept-art language.
- Keep text inside the image minimal and assume final annotations will be added manually.
- For local corrections, state what must stay unchanged first, then list exact text replacements, layout fixes, and explicit prohibitions.
- For multi-panel plots with lettered subpanels, keep panel letters on a shared left anchor that matches the y-axis-title margin instead of letting them float into the plotting area.
