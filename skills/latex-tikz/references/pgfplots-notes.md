# pgfplots — minimal axis (optional)

Use only when the task needs plotted functions or axis grids, not for every TikZ figure.

```latex
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
% ...
\begin{tikzpicture}
  \begin{axis}[width=0.9\linewidth, xmin=0, xmax=1, ymin=0, ymax=1]
    \addplot[domain=0:1, samples=100] {x^2};
  \end{axis}
\end{tikzpicture}
```

Match `compat` to the TeX distribution in CI or the user’s TeX Live version when known.
