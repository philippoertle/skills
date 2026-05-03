---
name: theoretical-minimum-tex-exercise-style
description: Standardizes Book 1 exercise LaTeX in the theoretical-minimum repo—paths under docs/book1, Prompt/Result/Example boxes, footnote style, and proactive TikZ where diagrams clarify the physics. Use when authoring or editing docs/book1/**/*.tex exercise write-ups. Load latex-framed-blocks-footnotes for the generic footnote-in-box pattern; load latex-tikz for TikZ content; load latex-pdflatex-build when compiling.
disable-model-invocation: true
---

# Theoretical Minimum — TeX exercise style (Book 1 shim)

## Generic foundation (read first)

- **`latex-framed-blocks-footnotes`** — `footnote` + `savenotes` around colored `\parbox` blocks, display-math footnote rules, TikZ interaction summary.
- **`latex-tikz`** — packages, libraries, scoping, footnote interaction inside figures.
- **`latex-pdflatex-build`** — `pdflatex` invocation and pass count.

This skill adds only **repository- and book-specific** expectations.

## Book 1 layout goals

- Match typography and structure across exercises: `geometry`, `amsmath`/`amssymb`, `fontenc`, `lmodern`, `microtype`, `xcolor`.
- Use three framed blocks: **Prompt.**, **Result.**, **Example.** (bold labels inside colored `\parbox`).
- **Proactively add TikZ figures** when a diagram would clarify setup (coordinates, vectors, simple mechanics or spacetime sketches, small graphs). Default: include at least one helpful `tikzpicture` in new or substantially revised exercises when the physics is geometric or relational; skip only when the exercise is purely algebraic and a figure adds no signal.

## Box macros

Use `\promptbox{...}`, `\resultbox{...}`, `\examplebox{...}`. Implement them with the **footnote-safe** pattern from **`latex-framed-blocks-footnotes`** (not duplicated here).

**Canonical reference implementation:** `docs/book1/lecture-02/exercise-01.tex` preamble and macro definitions.

## Content conventions

- No paragraph indent; use `\setlength{\parskip}{0.5em}` like existing files.
- Add short `\footnote{...}` to explain terms in the same style as `docs/book1/lecture-01/exercise-01.tex` and interlude exercises.

## Optional packages

Some interlude proofs use `amsthm`, `hyperref`—only add if the exercise needs them; keep parity with siblings in the same folder when possible.

## After editing

Rebuild PDF: **`theoretical-minimum-pdf-build`** (repo path expectations). Commit `.tex` and `.pdf` together per that repo’s README.

## Older files

If a file predates the lecture-2 pattern and footnotes in boxes fail in PDF, follow **`theoretical-minimum-tex-backfill-prompt-footnotes`**.
