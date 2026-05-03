---
name: theoretical-minimum-tex-exercise-style
description: Standardizes Book 1 exercise LaTeX in the theoretical-minimum repo—preamble, Prompt/Result/Example boxes, footnotes for basics, and footnote-safe colored boxes. Use when authoring or editing docs/book1/**/*.tex exercise write-ups.
disable-model-invocation: true
---

# Theoretical Minimum — TeX exercise style

## Goals

- Match typography and structure across exercises: `geometry`, `amsmath`/`amssymb`, `fontenc`, `lmodern`, `microtype`, `xcolor`.
- Use three framed blocks: **Prompt.**, **Result.**, **Example.** (bold labels inside colored `\parbox`).

## Box macros (required pattern for footnotes in prompts)

`\footnote` inside `\colorbox{...}{\parbox{...}{...}}` is trapped (minipage-like); notes may not appear at the page foot.

**Fix:** load `\usepackage{footnote}` and wrap each box body in `\begin{savenotes}...\end{savenotes}` around the existing `\begingroup` / `\colorbox` / `\parbox` / `\endgroup` pattern. Apply to `\promptbox`, `\resultbox`, and `\examplebox` for consistency.

Reference implementation: `docs/book1/lecture-02/exercise-01.tex` preamble and macro definitions.

## Content conventions

- No paragraph indent; use `\setlength{\parskip}{0.5em}` like existing files.
- Use `\promptbox{...}`, `\resultbox{...}`, `\examplebox{...}` for the three block types.
- Add short `\footnote{...}` to explain terms (closed system, radians, ln, product rule, etc.) in the same style as `docs/book1/lecture-01/exercise-01.tex` and interlude exercises.
- Avoid `\footnote` **inside** display math `\[...\]`; place the footnote on nearby running text or immediately after `\]` on its own.

## Optional packages

- Some interlude proofs use `amsthm`, `hyperref`—only add if the exercise needs them; keep parity with siblings in the same folder when possible.

## After editing

Rebuild PDF per **`theoretical-minimum-pdf-build`**. Commit `.tex` and `.pdf` together per repo README.

## Migrating older files

If a file predates the lecture-2 pattern and footnotes in boxes fail in PDF, follow **`theoretical-minimum-tex-backfill-prompt-footnotes`**.
