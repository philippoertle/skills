---
name: theoretical-minimum-pdf-build
description: Rebuilds exercise PDFs with pdflatex for the theoretical-minimum repo—output next to docs/book1/**/*.tex sources, halt-on-error, optional cleanup of aux/log, including TikZ-heavy sources that may need a second pass. Use after editing docs/book1/**/*.tex or when the user asks to compile exercise PDFs in that repository. For the generic command line and pass rules, load latex-pdflatex-build.
disable-model-invocation: true
---

# Theoretical Minimum — PDF build (repo shim)

## Generic instructions

Follow **`latex-pdflatex-build`** for flags, quoting, multi-pass behavior, and log hygiene.

## Repo-specific command

From the **theoretical-minimum** repository root, compile so the PDF lands **next to** the `.tex` file (same directory as that repo’s README “Authoring and rendering workflow”):

```bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory "<dir-containing-tex>" "<path-to-exercise-NN.tex>"
```

Use **absolute** paths for placeholders. On Windows, quoting handles spaces in path segments.

## Practice

- Run **once** unless the `.log` or **`latex-pdflatex-build`** guidance indicates a second pass.
- The canonical artifact for readers is the committed **`exercise-NN.pdf`** alongside **`exercise-NN.tex`**.
- If the repo does not track `.aux` / `.log`, delete them after a successful build to keep `git status` clean.

## Failure handling

If `pdflatex` errors, read the `.log` in the output directory; fix the TeX, then re-run. Do not commit a broken PDF.

## Related

- **`latex-tikz`** — ordinary vs overlay TikZ and pass hints.
- **`latex-pdflatex-build`** — portable build recipe for any single `.tex` file.
