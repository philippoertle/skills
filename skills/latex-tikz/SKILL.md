---
name: latex-tikz
description: >-
  Authors PGF/TikZ vector diagrams in LaTeX—tikzpicture scopes, paths, nodes,
  arrows, styles, coordinates, and common libraries (arrows.meta, calc, angles,
  quotes, decorations). Use when writing or editing TikZ or PGF code, converting
  a sketch to TeX, adding spacetime or mechanics diagrams, commutative-style
  figures, flowcharts, or labeled geometry in pdflatex documents. Use alongside
  exercise or book pipelines that already use pdflatex. Do not use as the primary
  skill for plain MetaPost, Asymptote-only, or full pgfplots dataviz treatises
  unless the user ties them to TikZ; for PGFPlots depth, load this skill then open
  references/pgfplots-notes.md when axis plots are required.
disable-model-invocation: false
---

# LaTeX TikZ (PGF)

## Why this skill exists

TikZ gives **repeatable, versionable** figures in the same toolchain as the prose. Prefer TikZ over describing complex geometry only in words when a small figure would reduce ambiguity.

## Minimal working pattern (pdflatex)

1. Preamble: `\usepackage{tikz}` (once). Add `\usetikzlibrary{...}` **only** for features you use—extra libraries slow compile.
2. Body: wrap each drawing in a scoped environment:

```latex
\begin{tikzpicture}
  % drawing commands
\end{tikzpicture}
```

3. Prefer **explicit coordinates** or named `\coordinate` nodes for anything you will revise later.
4. Keep pictures **narrower than `\textwidth`** unless the layout intentionally uses full width (`max width=\linewidth` patterns in scaled nodes, or `adjustbox`, if needed).

## Libraries (common)

| Library | Typical use |
|---------|-------------|
| `arrows.meta` | Modern arrow tips |
| `calc` | Relative positioning (`$(A)+(1,0)$`) |
| `angles` | Angle arcs and labels |
| `quotes` | Edge labels on paths |
| `positioning` | `right=of A` style placement |
| `decorations.pathmorphing` | Springs, snakes |

Fuller tables and copy-paste snippets: [references/tikz-libraries-and-patterns.md](references/tikz-libraries-and-patterns.md).

## Interaction with colored boxes and footnotes

In exercise layouts that wrap colored `\parbox` blocks with `savenotes` (see **`latex-framed-blocks-footnotes`** and, for Book 1, **`theoretical-minimum-tex-exercise-style`**), keep **footnotes** on running text outside nested `minipage`-like content when possible. A `\begin{tikzpicture}...\end{tikzpicture}` inside a box is usually fine; `\footnote` **inside** TikZ nodes is fragile—use `\footnotemark` / `\footnotetext` or place the note on the preceding line.

## Compile passes

Simple TikZ: one `pdflatex` pass is enough. References to `\label` inside TikZ with `\ref` elsewhere, `remember picture, overlay`, or some `tikzmark` workflows may need **two** passes—mirror the repo’s PDF skill if the `.log` asks for it.

## Things to avoid

- Pulling in `pgfplots` or heavy 3d libraries “just in case.”
- Hard-coded global lengths that fight `geometry` from the host document.
- LuaTeX-only code while the project standard is **pdflatex**—confirm engine before using `lua` syntax extensions.

## Related skills

- **`latex-framed-blocks-footnotes`** — footnote-safe colored blocks and display-math footnote rules (any exercise-style `.tex`).
- **`latex-pdflatex-build`** — `pdflatex` flags, output directory, multi-pass when the log requires it.
- **`theoretical-minimum-tex-exercise-style`** — Book 1 paths under `docs/book1/` and repo-specific box conventions.
- **`theoretical-minimum-pdf-build`** — same as `latex-pdflatex-build` scoped to that repo’s exercise PDF layout.
