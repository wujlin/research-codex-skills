---
name: scientific-module-iconography
description: Use when designing or revising the icon system, module shapes, pseudo-3D block language, or visual object grammar of a scientific figure, especially for framework or architecture panels where the model-learning stage looks flat, generic, visually inconsistent, or not publication-grade. This skill defines icon taxonomy, module recipes, object rendering rules, and local-edit patterns so scientific diagrams look lively, technically credible, and visually coherent rather than like plain rectangles or business flowcharts. Triggers include 图标系统, 模块美化, 伪3D, isometric, iconography, Step 2 不够美观, model stage looks flat, and scientific module design.
---

# Scientific Module Iconography

Use this skill when the task involves any of the following:

- improving the icon system of a scientific framework or architecture figure
- making a model-learning stage look more publication-grade, lively, or technically credible
- deciding how modules, states, data objects, and outputs should differ visually
- revising a prompt that already has decent composition but weak module appearance
- editing an existing figure whose middle stage looks flat, generic, or visually incoherent

## Core workflow

1. Define the icon job: which panel or stage needs a visual-language upgrade and what scientific role it serves.
2. Classify each visible element as one of six roles: data object, model module, latent/state object, training inset, output object, or action.
3. Assign one icon family per role. Do not mix unrelated visual grammars in the same stage.
4. Give the model-learning stage the dominant visual language: layered scientific blocks, shallow extrusion, restrained pseudo-3D, and minimal arrow clutter.
5. Produce one or more of these outputs:
   - icon brief sheet
   - prompt patch
   - local edit prompt

## Reference map

- For role definitions and dominance rules, read [references/icon-taxonomy.md](references/icon-taxonomy.md).
- For module appearance recipes, especially the middle model-learning stage, read [references/module-block-recipes.md](references/module-block-recipes.md).
- For scientific objects such as summary tiles, microdata cards, heatmap slabs, and population icons, read [references/scientific-object-recipes.md](references/scientific-object-recipes.md).
- For local correction wording when a figure already exists, read [references/local-edit-patterns.md](references/local-edit-patterns.md).

## Task routing

- If the figure is a framework or architecture panel, read `module-block-recipes.md` first.
- If the main complaint is “Step 2 looks flat / ugly / too generic,” read `icon-taxonomy.md` and `module-block-recipes.md`.
- If the composition is already approved and only icon quality is weak, use this skill instead of rewriting the whole figure prompt.
- If the user already has a generated figure, prefer `local-edit-patterns.md` over a from-scratch prompt.
- Use this skill together with `scientific-figure-prompting` when both composition and icon language need work.

## Output defaults

- Prefer icon brief sheets over vague style advice.
- Prefer one coherent family of pseudo-3D blocks over many unrelated icons.
- Prefer object/module/state/action separation over mixed labels.
- Keep the 3D effect restrained, publication-grade, and never glossy.
- When editing an existing figure, freeze the layout first and modify icon language second.
