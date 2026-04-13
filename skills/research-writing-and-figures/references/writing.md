# Writing Reference

## Core rule

Scientific writing should answer:

1. What is the finding?
2. How does the evidence support it?
3. What is the scope or boundary of the claim?

If a sentence does not serve one of these functions, cut or rewrite it.

## Paragraph discipline

- One paragraph, one main job.
- Start with the claim or question of the paragraph.
- End with the take-home message, not a preview of the next section.
- In English scientific writing, put the important point early and then unfold the support linearly.
- Keep paragraph roles distinct. If one paragraph is trying to orient the subsection, define notation, justify a data choice, and interpret a result at the same time, it is overloaded.

Avoid:

- abstract opening sentences with little content
- mixing figure reading, statistical results, and mechanism in one paragraph
- piling up abstract nouns where a concrete phenomenon would do
- thread-like writing that braids several partially related ideas before the reader knows the main point

## Recall versus repetition

Recall and repetition are not the same.

- Use recall only after the earlier section or paragraph has already established the object, claim, or setup clearly.
- A recall sentence should be brief and functional. Its job is to reactivate something the reader already knows because the current logic depends on it.
- Repetition is a writing error. It occurs when the text restates earlier explanation with the same or similar language but does not advance the current argument.

Practical test:

1. Has the earlier text already explained this object or claim clearly enough on its own?
2. Does the current sentence help the reader perform the next logical step?
3. If the sentence is removed, does the local argument become harder to follow for a real reason, or does nothing change?

If the answer to 1 and 2 is no, or 3 suggests no real loss, cut the sentence.

Good recall:

- "The Michigan results establish the regional full-joint benchmark. We now turn to external spatial validation in Detroit."

Weak repetition:

- Re-explaining what the Michigan benchmark measured after the benchmark subsection has already defined it.

## Subsection openings

Use the first paragraph of a subsection to cue the reader about the role of the subsection.

- State the goal of the subsection.
- Name the main objects, outputs, or questions that the subsection will develop.
- Keep this opening paragraph short and functional.

Do not use the opening paragraph to execute all of the subsection's content at once. Its job is orientation, not compression.

## Linear English exposition

Prefer this order:

1. state the point or function first
2. define the object being discussed
3. explain how it works or how it is constructed
4. give the reason, implication, or boundary

Within a sentence or paragraph, prefer purpose before action when that improves emphasis and clarity:

- "To represent the empirical regional distribution, we construct the target vector `p` from survey-weighted counts."

This helps the reader understand why the operation matters before reading its mechanics.

Do not default to a Chinese-style winding buildup where the reader must collect several hints before learning the point.

Good pattern:

- "Step 1 constructs coarse conditioning signals for later generation. It has two stages: [...]. We introduce `c` as [...], because [...]."

Weak pattern:

- opening with several loosely connected motivations
- introducing notation before the reader knows why it exists
- mixing step purpose, data source, and downstream effect in one long sentence

## Section-specific rules

### Introduction

- Define the problem and the gap early.
- Do not front-load method components.
- Avoid contribution lists unless absolutely necessary.

### Methods

- Describe actions, representations, and evaluation design.
- Do not report results here.
- Prefer verbs such as `construct`, `define`, `compare`, `estimate`, `evaluate`.
- Let each method subsection solve a distinct problem, and let each paragraph play one local role in that sequence.
- If a methods subsection begins abruptly, add a short opening paragraph that states the goal of the subsection and the main artifacts it produces.

### Results

- Lead with the evidence.
- Keep comparison objects explicit.
- State what is being compared before interpreting the difference.
- Do not use the main text to restate what each panel contains if the caption already does that. Use the text to tell the reader what patterns matter and why.

### Discussion

- Explain what the results mean and where the explanation stops.
- Do not just restate the results with softer wording.

## Terminology consistency

- Define abbreviations once unless the context truly resets.
- Keep one primary term per concept.
- Distinguish scientific objects from computational objects when needed.
- If the same object appears across sections, keep the same noun phrase unless you are making a real distinction.
- If two expressions refer to the same thing, choose one as the default and remove the others.
- In long-form scientific writing, do not vary noun phrases for stylistic freshness. Reuse the same term if the object is the same.
- Treat apparent synonym variation as a possible source of confusion, not as a stylistic improvement.

Examples of recurring distinctions:

- `copula` vs `joint distribution`
- data source vs spatial unit
- raw output vs calibrated output
- reference baseline vs main benchmark

Common failure mode:

- one paragraph says `conditioning signal`
- another says `context feature`
- a third says `control variable`

If they all mean the same object, collapse them to one term and keep the symbol mapping stable.

Another common failure mode:

- one sentence says `PUMA-level vectors`
- the next says `regional inputs`
- a third says `vectors for each region`

If these all refer to the same PUMA-level objects, keep the wording stable instead of rotating phrases.

## Step and stage structuring

Do not split one step into multiple stages unless the stage boundary helps the reader understand a real transition.

Good reasons to split a step into stages:

- the input/output representation changes
- the operation changes from construction to filtering, or from encoding to aggregation
- the object being produced in Stage A becomes the explicit input to Stage B
- the notation introduced in one part is consumed in the next part

Weak reasons to split:

- cosmetic symmetry
- wanting the method to look more complicated
- breaking one simple operation into labels that add no explanatory value

A practical test:

1. Can each stage be described in one sentence with a different verb?
2. Does Stage B depend on a named artifact from Stage A?
3. Would removing the stage boundary make the reader lose a real piece of logic?

If the answer is mostly no, keep it as one step.

## Introducing notation and condition variables

Do not introduce a symbol like `c` in an isolated sentence with no rhetorical job.

Introduce it through four linked pieces of information:

1. role: what `c` is for
2. content: what information `c` contains
3. source: where `c` comes from
4. usage: where `c` enters the next part of the method

Preferred pattern:

- "To condition the downstream generator on coarse contextual information, we construct a condition vector `c` from [...]. This vector summarizes [...]. We then use `c` in Step 2 to [...]."

Avoid:

- "`c` denotes the condition."
- introducing `c` after the paragraph has already described later computations that depend on it
- defining `c` with one phrase and then calling it something else later

If `c` feels like it has little to say, that usually means it should be introduced as a bridge object rather than as a stand-alone idea. Explain why the method needs a compact condition first, then name `c`, then state what it contains.

## Captions

Captions should help the reader read the figure:

- what each panel shows
- what colors, markers, or lines mean
- minimal context needed to parse the visual

Captions should not duplicate the main argument, effect sizes, or statistical interpretation already given in the text.

## Figure-text alignment

- If the experimental scope changes, update figure, caption, and body text together.
- Remove panels that only repeat what other panels or the text already show.
- Keep figure logic and subsection logic aligned.

## Precision rules

- Do not describe expected counts as sampled individuals.
- Do not use vague comparison phrases if the comparison target is ambiguous.
- If a term like `profile` could mean multiple things, replace it with the actual statistical object.

## Supplementary material

- Only promise what is actually present.
- Never leave placeholder sections that say what “will be included”.
- Cite supplementary figures, tables, or sections precisely.
