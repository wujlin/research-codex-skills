---
name: research-map-image2
description: Use when the user wants image2 or image generation for a scientific research map, academic knowledge map, reading-map, research workflow figure, conceptual atlas, or expressive memory-aid diagram from papers, confirmed deep-read notes, research digests, or an evolving research trajectory. This skill turns research notes into a linear, publication-grade visual prompt and then uses image_gen/image2 to generate the bitmap figure.
---

# Research Map Image2

Use this skill for `image2`, `科研流程绘图`, `学术地图`, `阅读脉络图`, `knowledge map`, `research roadmap`, `conceptual atlas`, or a visual memory aid that summarizes papers and research logic.

This skill composes with:

- `research-writing`: linearize the argument before drawing.
- `scientific-figure-prompting`: structure the image prompt.
- `scientific-module-iconography`: make modules, objects, and routes visually distinct.
- `imagegen`: execute the final bitmap generation with `image_gen`.

## Source Discipline

1. Prefer the user's specified source file. For Jinlin's reading trajectory, prefer `digests/shared/confirmed_deep_read_map.md` as the source of truth.
2. Do not infer that every file under `digests/` is already deeply read. Separate confirmed deep-read papers from collected PDFs or auto-generated notes.
3. If the map is meant to support memory, include only the stable conceptual spine and a small number of high-signal paper anchors.

## Linearization Workflow

1. State one thesis for the map in plain language.
2. Compress the material into 3-5 conceptual regions. Each region should answer a different question, not just name a topic.
3. Choose a route structure before choosing style:
   - left-to-right river for a research trajectory
   - numbered subway line for a reading path
   - topographic atlas for conceptual terrain
   - control-circuit map for methods and transformations
4. Assign every paper or idea a role tag: foundation, bridge, method, warning, extension, or application.
5. Draw relationships as visible operations: stochastic process, entropy current, value function, posterior cloud, measure field, path sampler, world model, or project target.

## Prompt Structure

Build a self-contained prompt with these blocks:

1. Figure role: what the academic map must help the reader remember.
2. Composition: route direction, main regions, hierarchy, and focal path.
3. Region details: short labels, paper anchors, and visible objects.
4. Visual grammar: arrows, ribbons, basins, particles, panels, pseudo-3D modules, and spatial metaphors.
5. Text policy: only short labels; no paragraphs, dense equations, or long citations inside the image.
6. Style requirements: publication-grade, expressive, crisp, readable, light background, restrained but vivid palette.
7. Negative prompt: no business flowchart, no cartoon mascots, no generic mind-map clutter, no unreadable tiny text, no dark purple default aesthetic.

## Academic Map Defaults

For a broad reading map, default to a one-page 16:9 landscape figure. A strong default metaphor is a topographic subway atlas: one main route crossing conceptual regions, with side branches for paper anchors and method objects.

## Target Path Rules

1. Before generating, decide the repository target path and mention it in the working update.
2. If the user gives a target path, use that path.
3. For `Research_Collector`, default to `knowledge_map/generated/<descriptive-slug>-YYYY-MM-DD.png`.
4. The image tool may still save into Codex's default generated-images directory first. After generation, copy the generated file into the target path and leave the original file in place unless the user explicitly asks to delete it.
5. Use stable descriptive filenames such as `confirmed-reading-map-2026-04-24.png`, not opaque image IDs.

For the current confirmed reading trajectory, the default route is:

`non-equilibrium stochastic process -> entropy and irreversibility -> HJ/HJB control and transport -> inverse problem, VI, and UQ -> structured objects such as measure, path, posterior family, and world model -> Synthetic City`.

Use compact labels such as:

- `Stochastic Thermodynamics`
- `Entropy / Irreversibility`
- `Diffusion Regimes`
- `HJB / Control / Transport`
- `Posterior Path Sampling`
- `VI / Inverse Problems`
- `Measure-Valued Dynamics`
- `Memory / Non-Markov`
- `Active Inference`
- `Synthetic City`

## Image2 Execution Rules

1. Call `image_gen` only after the prompt is self-contained enough to generate the figure without further context.
2. Ask the image model for reserved label plaques and readable short labels, but assume final exact annotation may need manual cleanup.
3. Prefer a single high-quality image over multiple loose variations unless the user explicitly asks for alternatives.
4. If a repository target path was chosen, copy the generated bitmap there immediately after the tool returns.
5. After generating, do not add extra commentary if the image tool has just been called.
