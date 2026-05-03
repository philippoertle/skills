---
name: theoretical-minimum-book1-exercise-orchestrator
description: Single entry point for adding or solving a Book 1 exercise in the theoretical-minimum repo—TeX/PDF, README, optional Python and tests, plus TikZ diagrams where they help—by running one ordered workflow that names prerequisite skills for detail. Use when the user wants one skill for the full exercise lifecycle instead of invoking theoretical-minimum-add-exercise, tex, pdf, python, or backfill skills separately; load latex-framed-blocks-footnotes, latex-pdflatex-build, and latex-tikz during TeX authoring.
disable-model-invocation: true
---

# Book 1 exercise — one-shot orchestrator (`theoretical-minimum`)

Use **only this skill** when the user asks to add, solve, or extend a Book 1 exercise in the **theoretical-minimum** repository. Execute the phases **in order**. Treat the skills below as **prerequisites**: load each named skill’s `SKILL.md` when it exists under `~/.cursor/skills/<name>/` or in the personal skills repo at `skills/skills/<name>/`; if a file is not available, follow the **inline fallback** bullets in that phase.

## Prerequisite map (detail on demand)

| Order | Skill name | Role |
|------:|------------|------|
| 1 | `theoretical-minimum-add-exercise` | Paths, README bullet, overall checklist |
| 2 | `latex-framed-blocks-footnotes` | Generic footnote-safe colored boxes (load with TeX for any new exercise article) |
| 2a | `theoretical-minimum-tex-exercise-style` | Book 1 paths, Prompt/Result/Example conventions; **proactive TikZ** when useful |
| 2b | `latex-tikz` | TikZ/pgf details—load **whenever** authoring or editing `tikzpicture` / diagram TeX in Phase 2 |
| 3 | `theoretical-minimum-tex-backfill-prompt-footnotes` | Only if the `.tex` predates `footnote` + `savenotes` on colored boxes |
| 4 | `latex-pdflatex-build` | Generic `pdflatex` flags and passes; **`theoretical-minimum-pdf-build`** for repo path wording |
| 5 | `theoretical-minimum-exercise-python-tests` | Only if Python/tests change |

## Phase 1 — Plan and scaffold

**Prerequisite:** `theoretical-minimum-add-exercise`.

**Fallback:** Create or edit `docs/book1/lecture-MM/exercise-NN.tex` or `docs/book1/lecture-MM/interlude-KK/exercise-NN.tex`; mirror names in `src/theoretical_minimum/book1/` (underscores) and `tests/book1/` (`test_...`). Add a README “Written solutions” bullet with PDF + TeX links when adding a new exercise.

## Phase 2 — TeX body

**Prerequisites:** `latex-framed-blocks-footnotes`, `theoretical-minimum-tex-exercise-style`, and **`latex-tikz`** whenever there is a diagram (coordinates, vectors, small plots, spacetime sketches—add figures proactively per the Book 1 style skill).

**Fallback:** Match existing Book 1 articles: `geometry`, `amsmath`/`amssymb`, `fontenc`, `lmodern`, `microtype`, `xcolor`; `\promptbox` / `\resultbox` / `\examplebox`; footnote-safe boxes per **`latex-framed-blocks-footnotes`**; no `\footnote` inside display math. Use `\usepackage{tikz}` and minimal `\usetikzlibrary{...}` when including `tikzpicture` blocks.

**If footnotes in colored boxes fail in PDF:** apply **`theoretical-minimum-tex-backfill-prompt-footnotes`** (delegates to **`latex-framed-blocks-footnotes`**; canonical pattern in `docs/book1/lecture-02/exercise-01.tex`).

## Phase 3 — PDF

**Prerequisites:** **`latex-pdflatex-build`** (generic) and **`theoretical-minimum-pdf-build`** (repo phrasing).

**Fallback:** `pdflatex -interaction=nonstopmode -halt-on-error -output-directory "<dir-of-tex>" "<absolute-path-to.tex>"`; commit `.pdf` with `.tex`; remove stray `.aux`/`.log` if not tracked.

## Phase 4 — Python and tests (optional)

**Prerequisite:** `theoretical-minimum-exercise-python-tests`.

**Fallback:** Only if the exercise needs code: `from __future__ import annotations`, strict-friendly typing, module docstring with TeX/PDF paths; tests under `tests/book1/`; run `python -m pytest`, `python -m ruff check`, `python -m mypy` as appropriate (`pyproject.toml`).

## Phase 5 — Verify

- [ ] TeX compiles; footnotes visible where used  
- [ ] Diagrams: if the physics is geometric or relational, a TikZ figure is present or explicitly justified as unnecessary (see **`latex-tikz`**)  
- [ ] README lists the exercise if new  
- [ ] Tests and linters pass if Python changed  

## For maintainers

Keep the named prerequisite skills (**`latex-framed-blocks-footnotes`**, **`latex-pdflatex-build`**, **`latex-tikz`**, and the `theoretical-minimum-*` shims) as the **source of truth** for edge cases; extend this orchestrator only with high-level ordering, not duplicated long procedures.
