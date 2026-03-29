# Prompt Recipes

## Prompt anatomy

Build prompts in this order:

1. Figure role
2. Composition
3. Stage-by-stage content
4. Style requirements
5. Text handling
6. Negative prompt

Use explicit section headers or short paragraphs so the model can keep structure stable.

## Base template

```text
Create a publication-quality scientific [figure_type] for a [domain] paper, [panel role if needed].

The figure should be a clean, rigorous, visually rich research overview, not a cartoon and not a generic flowchart.

Composition:
- [horizontal / vertical / radial]
- [number of stages or branches]
- [dominant central module or main comparison]

Stage 1: [inputs or context]
- show [visible object 1]
- show [visible object 2]
- show [visible object 3]
- use [specific visual treatment]

Stage 2: [core method or mechanism]
- show [main module]
- include [submodule or fusion logic]
- emphasize [feature stream / change stream / routing / state]
- keep the structure technically credible and visually dominant

Stage 3: [outputs / benchmarks / implications]
- branch into [branch A]
- branch into [branch B]
- show [evaluation cues / output maps / decision products]

Style requirements:
- publication-grade scientific infographic
- clean white or very light gray background
- restrained palette matched to the domain
- crisp edges, subtle shadows, mild depth
- no dark theme
- no decorative clutter

Very important:
- do not render readable text paragraphs
- do not include fake equations
- leave clean title strips or empty label space for later annotation
- use arrows, grouping, and module shapes instead of text-heavy explanation

Negative prompt:
[cartoon, childish infographic, dark background, neon colors, dashboard UI, random labels, illegible text, overcrowded layout]
```

## Figure-type recipes

### Framework or architecture panel

Use a left-to-right or center-dominant layout:

- left: inputs, data sources, or physical context
- center: the model, adapter, or mechanism as the visual anchor
- right: outputs, evaluation settings, or downstream tasks

Useful phrasing:

- "visually dominant 3D architecture block"
- "twin encoder branches"
- "central feature-difference stream"
- "dual-expert fusion or routing"
- "smaller auxiliary side modules"
- "elegant arrows, layered feature blocks, mild depth"

### Graphical abstract

Keep the story to three jobs only:

- problem context
- core mechanism
- outcome or scientific value

Avoid turning a graphical abstract into a full pipeline schematic.

### Benchmark or evaluation overview

Show settings as grouped branches instead of a table screenshot:

- clean branch for in-domain or frontier evaluation
- harder branch for heterogeneous transfer or stress testing
- compact cues for tasks, outputs, and reliability differences

## Remote sensing and geospatial phrasing

When the figure is about Earth observation or hazards, prefer visible scientific layers rather than software-interface language.

Useful objects:

- optical imagery tile
- SAR or change-view tile
- DEM or slope relief tile
- lithology, land-cover, or soil layer
- rainfall, moisture, or trigger layer
- benchmark platform or curated dataset block

Useful style cues:

- subtle terrain relief
- satellite-texture cues
- translucent layer stacking
- restrained earth-tone and blue-green palette
- pseudo-3D or isometric geospatial tiles

Avoid:

- fake map labels
- busy legends
- city or building scenes unless the science needs them
- glossy dashboard panels

## Editing heuristics

If a prompt feels weak, fix it in this order:

1. Clarify the figure's single job.
2. Replace abstract words with visible modules or layers.
3. Add a dominant anchor so the eye knows where to land.
4. Cut text-rendering demands and move labels to blank strips.
5. Strengthen the negative prompt so the output does not drift into clipart or UI.

## Multi-panel label placement

If a figure contains panel letters such as `(a)`, `(b)`, `(c)`, and `(d)`, treat their placement as part of the layout spec rather than an afterthought.

Use these rules:

- keep all panel letters on the same left-side x anchor across panels
- align that x anchor with the y-axis-title anchor or the reserved y-label margin
- keep the letter outside the main plotting marks when possible
- keep clear separation from plot titles, legends, tick labels, and inset elements
- do not let panel letters drift independently from panel to panel

Useful phrasing:

- "place panel letters on a shared left anchor aligned with the y-axis-title margin"
- "keep `(a)`, `(b)`, `(c)`, `(d)` clear of legends and plotted marks"
- "do not let panel labels overlap titles, y-axis labels, or inset annotations"

## Revising an already generated figure

When a draft image already exists, do not default to a fresh full prompt. Prefer a targeted edit prompt that behaves like annotated revision notes.

### Core rule

Switch from "describe the ideal image" to "mark what is wrong and how to fix it."

### Default structure for edit prompts

Write the prompt in this order:

1. What must stay unchanged
2. Exact text corrections
3. Layout adjustments
4. Hard limits

### What works best

- Start by freezing the approved structure: "keep the current four-stage horizontal layout" or "do not redraw the whole composition"
- Separate text corrections from layout changes
- Write text fixes as exact replacements: "change X to Y", not "improve wording"
- Point out semantic mistakes explicitly: if the figure highlights buildings rather than residents, say so and state the corrected wording
- Compress error-prone labels into short tags of 2 to 5 words
- Limit each round to roughly 5 to 8 must-fix items instead of rewriting everything at once

### Hard limits that reduce repeated failures

Use explicit prohibitions when the model keeps overproducing text or redesigning the panel:

- do not add long sentences
- do not add bullet lists
- do not change the overall layout
- if text cannot be rendered accurately, leave it blank

For text-heavy stages, redirect the model toward graphics:

- use icons, arrows, or heat highlights instead of explanatory sentences

### Chinese for local corrections

For local editing of existing images, Chinese often works better than English, especially when the goal is:

- correcting wrong words or garbled text
- fixing semantic mismatches in labels
- adjusting local spacing, size, or placement

Use short, direct Chinese instructions for replacement and deletion. Keep the wording operational rather than descriptive.

### Reusable edit template

```text
基于当前这张图做局部修改，不要重画整体结构，保留现有布局。

必须修改的文字：
1. 把“X”改成“Y”
2. 删除“Z”
3. 这句话语义不对，因为[原因]，改成“[...]”

版式调整：
1. 放大[模块]
2. 删除[空白框/多余元素]
3. 用图标、箭头或高亮代替说明文字

限制：
- 不要新增长句
- 不要新增 bullet list
- 不要改变整体布局
- 如果文字不能准确渲染，就留空
```

### Practical revision loop

Use this loop for iterative image repair:

1. State what remains unchanged.
2. List 5 to 8 must-fix items.
3. Write every text fix as an exact replacement.
4. List layout fixes separately.
5. Add explicit prohibitions against long text, gibberish, extra explanations, or layout redesign.
6. After the next image returns, run another local correction round instead of restarting with a new full prompt.

## Compact example

Use this pattern for a remote-sensing framework panel:

```text
Create a publication-quality scientific framework diagram for a remote sensing paper, one panel of a multi-panel figure. The composition should be horizontal and organized into three stages from left to right: multi-source geospatial inputs, a central physics-aware model block, and two evaluation branches with different scientific roles. Use stacked 3D data tiles for imagery, terrain, material, and trigger context; a visually dominant modular architecture in the center; and clear output branches on the right. Keep the background light, the palette restrained, the geometry crisp, and the overall tone rigorous rather than decorative. Leave clean spaces for manual labels and use a strong negative prompt to avoid cartoon style, fake text, dashboard UI, or crowded arrows.
```
