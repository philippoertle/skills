# TikZ — libraries and small patterns

Use as a cheat sheet; the TikZ/PGF manual remains authoritative.

---

## Table of contents

1. [Axis-like diagrams without pgfplots](#axis-like-diagrams-without-pgfplots)
2. [Forces and vectors](#forces-and-vectors)
3. [Angles and arcs](#angles-and-arcs)
4. [pgfplots (when you need plots)](#pgfplots-when-you-need-plots)

---

## Axis-like diagrams without pgfplots

```latex
\begin{tikzpicture}[>=Latex]
  \draw[->] (-0.2,0) -- (3,0) node[below] {$x$};
  \draw[->] (0,-0.2) -- (0,2) node[left] {$y$};
\end{tikzpicture}
```

Use `\draw` with `node[midway]` for labels along paths.

---

## Forces and vectors

```latex
\draw[->, thick] (0,0) -- (2,1) node[midway, above] {$\vec{v}$};
```

`calc` library: `\coordinate (B) at ($(A)+(1,0)$);`

---

## Angles and arcs

`\usetikzlibrary{angles,quotes}` then `pic` angles between three named coordinates (see TikZ manual, “Angles Library”).

---

## pgfplots (when you need plots)

For function plots and data axes, `\usepackage{pgfplots}` and `\pgfplotsset{compat=...}`—add only if the document already uses or tolerates the extra compile cost. See [pgfplots-notes.md](pgfplots-notes.md) for a minimal axis template.
