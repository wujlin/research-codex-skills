---
name: research-figure-analysis
description: Use when explaining, auditing, extracting, or aligning scientific figures from PDFs, papers, or slides. This skill enforces image-first verification, reliable page extraction, panel-by-panel interpretation, caption checking, and figure-text consistency.
---

# Research Figure Analysis

Use this skill when the task is primarily about reading or validating a figure rather than revising prose.

## Use when

- explaining a figure from a paper, PDF, or slide deck
- checking whether a caption matches the actual image
- resolving conflicts between PDF text extraction and visible panel content
- extracting a page or figure region for inspection before interpretation
- aligning figure explanation with manuscript text

## Core workflow

1. Do not trust PDF text extraction as the primary source for figure content.
2. Rasterize the relevant page or figure region first.
3. Verify panel count, labels, visible symbols, and caption against the image.
4. Treat text extraction as secondary support only.
5. If image content and extracted text disagree, trust the image and caption.
6. Explain the figure panel by panel, then summarize the linear logic across panels.

## Extraction protocol

- If the project provides `scripts/extract_pdf_page_images.py`, use it.
- The minimum reliable workflow is:
  1. split the relevant page into a single-page PDF
  2. rasterize to PNG
  3. optionally crop the figure region
  4. check the generated manifest or self-check output before interpreting the figure
- Do not write figure notes until the extraction passes basic checks.

## References

- Figure style rules: [../research-writing-and-figures/references/visual-style.md](../research-writing-and-figures/references/visual-style.md)
- Workflow norms: [../research-writing-and-figures/references/workflow.md](../research-writing-and-figures/references/workflow.md)

## Boundary

- If the user only wants caption wording polished and no image check is required, use `research-writing`.
- If the task also requires rewriting manuscript text based on the figure reading, coordinate through `research-writing-and-figures`.

## Output defaults

- Explain what each panel shows before interpreting why it matters.
- Keep panel roles distinct.
- Do not import claims from later figures into the current one unless the text says so explicitly.
