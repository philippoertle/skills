---
name: latex-pdflatex-build
description: >-
  Compiles standalone LaTeX sources with pdflatex: nonstopmode, halt-on-error,
  output directory next to the source, optional aux/log cleanup, and when to run
  a second pass for hyperref, labels, or TikZ remember-picture workflows. Use
  whenever the user asks to build, compile, or render a .tex file to PDF with
  pdflatex, fix compile commands on Windows or Unix paths with spaces, or mirror
  a reproducible one-file PDF artifact next to its source—even if the project is
  not the theoretical-minimum repo. For TikZ authoring details, use latex-tikz.
---

# pdflatex: single-document build

## Default command

From a shell, compile so the PDF lands **next to** the `.tex` file (set both placeholders to **absolute** paths; quoting handles spaces on Windows):

```bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory "<dir-containing-tex>" "<path-to-document.tex>"
```

Repeat with the **same** flags if the `.log` asks for another pass (unresolved references, `hyperref` rerun warnings, or TikZ `remember picture` / `overlay` / `tikzmark` cross-picture references).

## Practice

- **One pass** is enough for many short articles and inline `tikzpicture` blocks without cross-picture refs.
- **Two passes** when the log indicates undefined refs that should resolve on rerun, or for certain TikZ overlay flows (see **`latex-tikz`**).
- Remove stray `.aux` / `.log` after a successful build if the repository does not track them, to keep `git status` clean.
- Do not commit a broken PDF; read the `.log` in the output directory on failure, fix the TeX, then re-run.

## Engine note

This skill assumes **pdflatex**. If the document requires LuaLaTeX or XeLaTeX (fonts, `fontspec`), switch engine consistently—do not mix Lua-only syntax with a pdflatex pipeline.

## Related

- **`latex-tikz`** — figures, libraries, multi-pass hints for TikZ-heavy sources.
- **`latex-framed-blocks-footnotes`** — footnote-safe colored boxes often compiled with this flow.
- **`theoretical-minimum-pdf-build`** — thin shim when the artifact lives under `docs/book1/` in that repo.
