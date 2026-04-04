# WSA Projects

WSA host: `10.13.12.164`
WSA root: `/home/jinlin/projects`

Use this file for server-side paths.

## Global data roots

These are the main WSA-side data roots outside `/home/jinlin/projects`. Prefer these two paths when the user asks for the server-level data directory rather than a project-local `data/` folder.

### /home/jinlin/data

- root: `/home/jinlin/data`
- role: primary WSA global data root
- observed size: about `228G` on 2026-03-26
- top-level entries: `Facebook_Disaster`, `GLAN_processed_backup_20251207_081903`, `Mobility_Data`, `Mobility_Data.tar.gz`, `experiments`, `geoexplicit_data`, `mobility_data`, `upload_parts`

### /home/jinlin/DATASET

- root: `/home/jinlin/DATASET`
- role: secondary WSA global dataset root
- observed size: about `270G` on 2026-03-26
- top-level entries: `GLAN`, `Height`, `LoD1`, `era5`, plus several `.tif` and `.geojson` files

### Exclusions

- `/home/jinlin/.cursor-server/data` is a tool-internal directory, not a research data root

## Registered projects

### Disaster_Analysis

- root: `/home/jinlin/projects/Disaster_Analysis`
- repo: yes
- data dirs: `datasets`
- output dirs: `outputs`, `logs`
- doc dirs: `Docs`, `Essay`, `present_researches`

### Geoexplicit_SFM

- root: `/home/jinlin/projects/Geoexplicit_SFM`
- repo: yes
- data dirs: `data`, `dataset`

### Mixed_dynamics

- root: `/home/jinlin/projects/Mixed_dynamics`
- repo: yes
- data dirs: `data`
- output dirs: `outputs`
- doc dirs: `docs`, `Essay_Physical`
- notes: likely corresponds to local `Complex_dynamics/Mixed_dynamics`

### Mobility_Population

- root: `/home/jinlin/projects/Mobility_Population`
- repo: yes
- data dirs: `Mobility_Data`
- doc dirs: `docs`

### Mobility_v3

- root: `/home/jinlin/projects/Mobility_v3`
- repo: yes
- local alias: `v3`
- data dirs: `data`
- output dirs: `_sync`, `_tmp`, `logs`
- figure dirs: `figures`
- doc dirs: `docs`, `essay`, `nsfc`, `problem`, `reference`

### PM25

- root: `/home/jinlin/projects/PM25`
- repo: yes
- output dirs: `interim`, `results`, `logs`
- figure dirs: `figures`
- doc dirs: `reports`, `参考仓库`, `数据库`, `重要文献`

### Synthetic_City

- root: `/home/jinlin/projects/Synthetic_City`
- repo: yes
- data dirs: `data`
- output dirs: `outputs`, `_sync`
- figure dirs: `figures`
- doc dirs: `docs`, `Essay`, `NSFC`, `present_researches`

### wellspace

- root: `/home/jinlin/projects/wellspace`
- repo: yes
- data dirs: `GLAN_processed`, `ShadowMap`
- output dirs: `task_backups`

### wellspace_v2

- root: `/home/jinlin/projects/wellspace_v2`
- repo: no git dir seen at shallow depth
- notes: contains nested `wellspace/`

### delta

- root: `/home/jinlin/projects/delta`
- repo: no git dir seen at shallow depth

### 南沙河网_大图

- root: `/home/jinlin/projects/南沙河网_大图`
- repo: no git dir seen at shallow depth
- data dirs: `L20`, `南沙区裁剪结果_WGS84`, `南沙掩膜`, `南沙行政边界`, `底图`, `沙田聚落最终识别结果`, `河道矢量结果`

### 土地分割

- root: `/home/jinlin/projects/土地分割`
- repo: no git dir seen at shallow depth
- data dirs: `CN-MSLU-DEMO-100K`

## Update rule

When adding a new WSA project, record:

- project name
- absolute root path under `/home/jinlin/projects`
- whether it is a git repo
- main data dirs
- main output dirs
- local alias if it differs from the Mac-side name
