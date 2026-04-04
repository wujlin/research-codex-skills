# Icon Taxonomy

## Goal

Give each visible element one role and one visual grammar. A scientific figure becomes messy when data objects, model modules, latent states, and outputs all look like the same rounded rectangle.

## Six roles

### 1. Data object

Use for:

- census summaries
- input imagery or tiles
- microdata tables
- observed statistics

Visual grammar:

- compact cards or tiles
- low to medium depth
- simple front face with one internal cue
- grouped as a bundle rather than one giant block

Avoid:

- making data objects look like neural network modules

### 2. Model module

Use for:

- predictor
- encoder
- refiner
- decoder
- fusion module

Visual grammar:

- layered scientific block
- shallow extrusion
- crisp front face plus subtle top edge
- 2 to 4 nested or stacked internal plates
- this is the main pseudo-3D family

Avoid:

- flat office-slide rectangles
- glossy sci-fi cubes
- clipart brains or clouds

### 3. Latent or state object

Use for:

- prior
- latent state
- joint state
- memory state

Visual grammar:

- floating slab, translucent plate, or suspended matrix
- lighter than a model module
- should look like a state being carried, not a processor block

Avoid:

- rendering states as identical boxes to modules

### 4. Training inset

Use for:

- noise-prediction training
- auxiliary objective
- small mechanism reminder

Visual grammar:

- small chip, badge, or inset panel
- thin border
- minimal depth
- secondary visual importance

Avoid:

- giving the inset the same scale as the main module

### 5. Output object

Use for:

- joint heatmap
- synthetic population
- benchmark output

Visual grammar:

- cleaner and calmer than the middle learning stage
- enough depth to avoid flatness
- should feel like the result of the model, not another module

### 6. Action

Use for:

- sample
- fuse
- refine
- predict

Visual grammar:

- arrows only
- short verbs only
- never create a separate large box just for an action

## Dominance rules

1. The model-learning stage should own the strongest block language.
2. Data objects should be simpler and lighter than modules.
3. States should float between modules rather than compete with them.
4. Outputs should look resolved and stable, not mechanically busy.
5. If everything looks equally important, the figure will read as clutter.
