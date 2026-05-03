---
name: theoretical-minimum-tex-backfill-prompt-footnotes
description: Aligns older Book 1 exercise TeX in the theoretical-minimum repo with the footnote-safe colored-box pattern so footnotes inside Prompt/Result/Example boxes appear in the PDF. Use when editing pre–lecture-02 exercise sources under docs/book1 or fixing missing footnote text in those PDFs. Load latex-framed-blocks-footnotes for the full reusable migration steps.
disable-model-invocation: true
---

# Theoretical Minimum — backfill prompt-box footnotes (Book 1 shim)

## Generic procedure

Apply **`latex-framed-blocks-footnotes`** in full: `\usepackage{footnote}` and `\begin{savenotes}...\end{savenotes}` around each of `\promptbox`, `\resultbox`, and `\examplebox` inner blocks, matching the pattern in `docs/book1/lecture-02/exercise-01.tex`.

## When to apply (this repo)

- Any `docs/book1/**/*.tex` that still duplicates the old macros **without** `footnote` + `savenotes`.
- Prefer doing this **when touching that file** for other edits, so diffs stay reviewable; optional batch pass if the user explicitly wants consistency across Book 1.

## After change

Rebuild PDF per **`theoretical-minimum-pdf-build`**. Re-read the first page to confirm footnote bodies appear.

## Related

- **`theoretical-minimum-tex-exercise-style`** — current Book 1 authoring conventions.
- **`latex-tikz`** — avoid `\footnote` inside TikZ nodes; use marks / external text.
