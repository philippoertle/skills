---
name: theoretical-minimum-tex-backfill-prompt-footnotes
description: Aligns older Book 1 exercise TeX in the theoretical-minimum repo with the footnote-safe colored-box pattern (footnote package + savenotes) so footnotes inside Prompt/Result/Example boxes appear in the PDF. Use when editing pre–lecture-02 exercise sources or fixing missing footnote text in PDFs.
disable-model-invocation: true
---

# Theoretical Minimum — backfill prompt-box footnotes (TeX)

## Problem

`\promptbox`, `\resultbox`, and `\examplebox` use `\colorbox` + `\parbox`. Footnotes issued inside that `\parbox` are **trapped** (minipage-like): markers may show while body text never reaches the page foot, or notes vanish entirely.

## Fix (match lecture 2)

1. After `\usepackage{xcolor}`, add:

```latex
\usepackage{footnote}
```

2. Wrap **each** of the three box macros with `\begin{savenotes}` … `\end{savenotes}` around the existing `\begingroup` … `\colorbox` … `\parbox` … `\endgroup` block (see `docs/book1/lecture-02/exercise-01.tex`).

## When to apply

- Any `docs/book1/**/*.tex` that still duplicates the old macros **without** `footnote` + `savenotes`.
- Prefer doing this **when touching that file** for other edits, so diffs stay reviewable; optional batch pass if the user explicitly wants consistency across Book 1.

## After change

Rebuild PDF per **`theoretical-minimum-pdf-build`**. Re-read the first page to confirm footnote bodies appear.

## Related

- General TeX conventions for new exercises: **`theoretical-minimum-tex-exercise-style`**.
