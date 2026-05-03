---
name: theoretical-minimum-pdf-build
description: Rebuilds exercise PDFs with pdflatex for the theoretical-minimum repo—output directory next to sources, halt-on-error, optional cleanup of aux/log. Use after editing docs/book1/**/*.tex or when the user asks to compile exercise PDFs.
disable-model-invocation: true
---

# Theoretical Minimum — PDF build

## Command

From the repository root, compile so the PDF lands **next to** the `.tex` file (same directory as README “Authoring and rendering workflow”):

```bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory "<dir-containing-tex>" "<path-to-exercise-NN.tex>"
```

Replace placeholders with the **absolute** path to the exercise directory and the **absolute** path to the `.tex` file. On Windows, quoting handles spaces in path segments (e.g. `theoretical minimum`).

## Practice

- Run **once** unless `hyperref` or TOC warnings ask for a second pass (rare for these short articles).
- If the repo does not track `.aux` / `.log`, delete them after a successful build to keep `git status` clean.
- The canonical artifact for readers is the committed **`exercise-NN.pdf`** alongside **`exercise-NN.tex`**.

## Failure handling

If `pdflatex` errors, read the `.log` in the output directory; fix the TeX, then re-run. Do not commit a broken PDF.
