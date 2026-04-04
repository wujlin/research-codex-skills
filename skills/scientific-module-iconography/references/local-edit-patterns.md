# Local Edit Patterns

Use these when the layout is acceptable but the module appearance is weak.

## Edit order

1. Freeze the layout.
2. Upgrade the model-learning stage icon family.
3. Quiet the supporting objects.
4. Reduce arrow clutter.
5. Only then fix labels.

## Reliable correction prompts

### Pattern 1: Flat middle stage

```text
基于当前这张图做局部修改，不要改变整体布局。

重点修改中间模型学习层：
1. 把所有普通矩形框改成统一的浅层 pseudo-3D 科研模块体块
2. 主模块做成最大的 layered architecture block
3. 次模块缩小，并做成较轻的 stacked block
4. 中间状态不要画成普通模块框，改成悬浮的半透明 slab

限制：
- 不要重画整体结构
- 不要新增长句
- 不要做成发亮或夸张的商业海报风
```

### Pattern 2: Main module not dominant

```text
保留当前整体布局，局部强化主模型模块。

必须修改：
1. 放大中间主模块
2. 增加 layered scientific block 的层次
3. 给主模块增加 shallow extrusion 和 soft shadows
4. 让辅助模块更轻、更小

限制：
- 不要新增新的模块
- 不要增加更多箭头
```

### Pattern 3: Icon family is inconsistent

```text
保留现有布局，但统一图标语言。

要求：
1. 数据对象统一成卡片/tiles 家族
2. 模型模块统一成 pseudo-3D layered blocks 家族
3. 状态对象统一成 floating slab 家族
4. 输出对象统一成 calmer result objects

限制：
- 不要把所有元素画成相同矩形
- 不要混入 clipart 或 dashboard 风格
```

## Default output form

When using this skill on an existing figure, prefer three deliverables:

- one icon brief sheet
- one local edit prompt
- one short list of 5 to 8 must-fix visual items
