# Module Block Recipes

## Goal

Make the model-learning stage feel like scientific machinery rather than a flat workflow chart.

## Core visual family

Use this family for the main learning stage:

- layered scientific blocks
- shallow extrusion
- subtle pseudo-3D
- crisp front planes
- soft shadows
- mild isometric hint, not strong perspective

## Recipe 1: Small predictor block

Use for:

- structure predictor
- coarse predictor
- encoder-like helper module

Appearance:

- medium-small module
- 2 layered plates
- one embedded internal cue such as a tiny matrix, channel strip, or feature slab
- slightly rounded edges
- less dominant than the main refiner

Good phrasing:

- "small layered scientific predictor block"
- "compact pseudo-3D module with two internal plates"

## Recipe 2: Prior or joint-state slab

Use for:

- regional joint prior
- latent joint state
- intermediate probabilistic structure

Appearance:

- suspended translucent slab
- heatmap or structured matrix on the front face
- thinner than a model block
- mild glow is acceptable if very restrained

Good phrasing:

- "floating translucent heatmap slab"
- "thin probability-table plate with shallow depth"

## Recipe 3: Main refiner block

Use for:

- diffusion refiner
- full-joint generator
- central model block

Appearance:

- largest module in the figure
- 3 or 4 layered internal planes
- a visually clear core cavity or central stack
- stronger depth than all other modules
- clean but not toy-like

Good phrasing:

- "visually dominant layered scientific architecture block"
- "main pseudo-3D refiner module with nested internal plates"
- "central architecture block with shallow extrusion and crisp edges"

Avoid:

- giant blank rectangle
- transformer cartoon
- glowing sci-fi object

## Recipe 4: Training inset chip

Use for:

- noise-prediction training
- auxiliary objective reminder

Appearance:

- small inset at the top of the learning stage
- can include two tiny texture or matrix tiles and one simple arrow
- should read as a mechanism note, not as a second main module

Good phrasing:

- "small training inset chip"
- "compact objective badge with two tiny matrix tiles"

## Recipe 5: Middle-stage hierarchy

For a three-part learning stage like your current framework:

- left or upper-left: smaller predictor block
- center or center-right: prior slab
- main center or lower-center: dominant refiner block
- top edge: tiny training inset

This arrangement keeps the stage lively without making it noisy.

## What makes Step 2 ugly

Common failure modes:

- every block is the same rectangle
- the main refiner has no visual priority
- the prior looks like just another module
- inset mechanisms are too large
- the stage is held together only by arrows, not by hierarchy

## What to ask for in prompts

Ask for:

- one dominant central architecture block
- smaller supporting predictor block
- floating state slab between modules
- shallow extrusion
- layered feature plates
- restrained pseudo-3D

Do not ask for:

- fancy futuristic rendering
- many icons mixed together
- thick perspective or deep vanishing-point 3D
