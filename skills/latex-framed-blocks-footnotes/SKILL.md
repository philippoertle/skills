---
name: latex-framed-blocks-footnotes
description: >-
  Authors LaTeX framed or colored blocks (parbox, colorbox, tcolorbox-style
  layouts) without trapping footnotes: footnote package, savenotes environment,
  and footnote placement rules near display math. Use whenever the user writes
  exercises, worksheets, solutions, or notes with Prompt/Answer/Example-style
  boxes, colored parboxes, or asks why footnotes disappear inside colored
  frames—even outside any specific textbook repo. For TikZ inside frames, pair
  with latex-tikz. For the pdflatex command line, pair with latex-pdflatex-build.
---

# Framed blocks and footnotes (reusable TeX patterns)

## Problem

`\footnote` inside `\colorbox{...}{\parbox{...}{...}}` (and similar minipage-like wrappers) is **trapped**: markers may appear while body text never reaches the page foot, or notes vanish.

## Fix (standard pattern)

1. Load `\usepackage{footnote}` (in addition to your color stack, e.g. `xcolor`).
2. Wrap each framed block body in `\begin{savenotes}...\end{savenotes}` around the existing grouping + `\colorbox` / `\parbox` (or wrap the macro definition so every box type is consistent).

Apply the same pattern to **all** parallel box macros (e.g. prompt, result, example) so behavior matches across the document.

## Display math

Avoid `\footnote` **inside** display math `\[...\]`; place the footnote on nearby running text or immediately after `\]` on its own line.

## TikZ inside frames

A `tikzpicture` inside a box is usually fine. Avoid `\footnote` **inside** TikZ nodes—prefer `\footnotemark` / `\footnotetext` or a note on running text (see **`latex-tikz`**).

## Optional typography baseline

Exercise-style articles often share: `geometry`, `amsmath` / `amssymb`, `fontenc`, `lmodern`, `microtype`, `xcolor`. Add only packages the document uses; do not cargo-cult an entire preamble from another project without checking.

## Backfill / migration

When touching older sources that predate `footnote` + `savenotes`:

- Add `\usepackage{footnote}` after `xcolor` (or with the rest of the preamble).
- Wrap each box macro’s inner `\begingroup` … `\colorbox` … `\parbox` … `\endgroup` with `\begin{savenotes}` … `\end{savenotes}`.
- Prefer migrating **when the file is already being edited** so diffs stay reviewable.

## After editing

Rebuild PDF using **`latex-pdflatex-build`** (or the project’s documented wrapper).

## Related

- **`latex-tikz`** — diagrams in the same toolchain.
- **`theoretical-minimum-tex-exercise-style`** — Book 1 file layout and reference path to a canonical example in that repo.
- **`theoretical-minimum-tex-backfill-prompt-footnotes`** — Book 1–scoped reminder to apply this pattern under `docs/book1/`.
