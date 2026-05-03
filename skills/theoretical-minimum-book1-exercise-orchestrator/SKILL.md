---
name: theoretical-minimum-book1-exercise-orchestrator
description: Single entry point for adding or solving a Book 1 exercise in the theoretical-minimum repo—TeX/PDF, README, optional Python and tests—by running one ordered workflow that names prerequisite skills for detail. Use when the user wants one skill for the full exercise lifecycle instead of invoking theoretical-minimum-add-exercise, tex, pdf, python, or backfill skills separately.
disable-model-invocation: true
---

# Book 1 exercise — one-shot orchestrator (`theoretical-minimum`)

Use **only this skill** when the user asks to add, solve, or extend a Book 1 exercise in the **theoretical-minimum** repository. Execute the phases **in order**. Treat the skills below as **prerequisites**: load each named skill’s `SKILL.md` when it exists under `~/.cursor/skills/<name>/` or in the personal skills repo at `skills/skills/<name>/`; if a file is not available, follow the **inline fallback** bullets in that phase.

## Prerequisite map (detail on demand)

| Order | Skill name | Role |
|------:|------------|------|
| 1 | `theoretical-minimum-add-exercise` | Paths, README bullet, overall checklist |
| 2 | `theoretical-minimum-tex-exercise-style` | Preamble, boxes, footnote style |
| 3 | `theoretical-minimum-tex-backfill-prompt-footnotes` | Only if the `.tex` predates `footnote` + `savenotes` on colored boxes |
| 4 | `theoretical-minimum-pdf-build` | `pdflatex` command and hygiene |
| 5 | `theoretical-minimum-exercise-python-tests` | Only if Python/tests change |

## Phase 1 — Plan and scaffold

**Prerequisite:** `theoretical-minimum-add-exercise`.

**Fallback:** Create or edit `docs/book1/lecture-MM/exercise-NN.tex` or `docs/book1/lecture-MM/interlude-KK/exercise-NN.tex`; mirror names in `src/theoretical_minimum/book1/` (underscores) and `tests/book1/` (`test_...`). Add a README “Written solutions” bullet with PDF + TeX links when adding a new exercise.

## Phase 2 — TeX body

**Prerequisite:** `theoretical-minimum-tex-exercise-style`.

**Fallback:** Match existing Book 1 articles: `geometry`, `amsmath`/`amssymb`, `fontenc`, `lmodern`, `microtype`, `xcolor`; `\promptbox` / `\resultbox` / `\examplebox`; footnotes for basics; no `\footnote` inside display math.

**If footnotes in colored boxes fail in PDF:** apply **`theoretical-minimum-tex-backfill-prompt-footnotes`** (`\usepackage{footnote}` + `\begin{savenotes}` around each box macro, per `docs/book1/lecture-02/exercise-01.tex`).

## Phase 3 — PDF

**Prerequisite:** `theoretical-minimum-pdf-build`.

**Fallback:** `pdflatex -interaction=nonstopmode -halt-on-error -output-directory "<dir-of-tex>" "<absolute-path-to.tex>"`; commit `.pdf` with `.tex`; remove stray `.aux`/`.log` if not tracked.

## Phase 4 — Python and tests (optional)

**Prerequisite:** `theoretical-minimum-exercise-python-tests`.

**Fallback:** Only if the exercise needs code: `from __future__ import annotations`, strict-friendly typing, module docstring with TeX/PDF paths; tests under `tests/book1/`; run `python -m pytest`, `python -m ruff check`, `python -m mypy` as appropriate (`pyproject.toml`).

## Phase 5 — Verify

- [ ] TeX compiles; footnotes visible where used  
- [ ] README lists the exercise if new  
- [ ] Tests and linters pass if Python changed  

## For maintainers

Keep the five prerequisite skills as the **source of truth** for edge cases; extend this orchestrator only with high-level ordering, not duplicated long procedures.
