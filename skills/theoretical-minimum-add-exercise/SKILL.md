---
name: theoretical-minimum-add-exercise
description: Adds or extends a Theoretical Minimum book exercise across TeX/PDF docs, optional Python in src/theoretical_minimum, pytest tests, README written-solution links, and TikZ figures where they clarify the physics. Use when the user asks to solve, add, or mirror a lecture or interlude exercise in the theoretical-minimum repo; use latex-framed-blocks-footnotes, latex-pdflatex-build, latex-tikz, and theoretical-minimum-tex-exercise-style during TeX phases.
disable-model-invocation: true
---

# Theoretical Minimum — add exercise (end-to-end)

**Single entry point:** for one skill name covering the full lifecycle (this plus TeX, PDF, Python, backfill in order), use **`theoretical-minimum-book1-exercise-orchestrator`**; keep this skill for path/checklist detail alone.

## Scope

Applies to the **`theoretical-minimum`** Python package repo: written solutions under `docs/book1/`, code under `src/theoretical_minimum/book1/`, tests under `tests/book1/`.

## Checklist

Copy and track progress:

```
- [ ] TeX: docs/book1/<lecture-or-interlude>/exercise-NN.tex (include TikZ figures when they clarify geometry or setup—skill `latex-tikz`)
- [ ] PDF: same folder, exercise-NN.pdf (rebuild after TeX changes)
- [ ] README: bullet under "## Written solutions" (PDF + TeX links)
- [ ] Python (if needed): src/theoretical_minimum/book1/.../exercise_NN.py
- [ ] Tests (if code): tests/book1/test_<lecture>_exercise_NN.py
- [ ] Run: python -m pytest, python -m ruff check, python -m mypy (as applicable)
```

## Path naming

| Artifact | Path pattern |
|----------|----------------|
| Lecture exercise | `docs/book1/lecture-MM/exercise-NN.tex` |
| Interlude exercise | `docs/book1/lecture-MM/interlude-KK/exercise-NN.tex` |
| Python module | `src/theoretical_minimum/book1/lecture_MM/exercise_NN.py` or `.../lecture_MM/interlude_KK/exercise_NN.py` |
| Test file | `tests/book1/test_lecture_MM_exercise_NN.py` or `test_lecture_MM_interlude_KK_exercise_NN.py` |

Use **hyphens** in `docs/` paths (`lecture-02`, `exercise-01`) and **underscores** in Python/test module names (`lecture_02`, `exercise_01`).

## Python module docstring

At top of each exercise module, link the TeX and PDF paths (repo-relative), matching existing exercises:

```text
TeX/PDF write-up:
``docs/book1/.../exercise-NN.tex``,
``docs/book1/.../exercise-NN.pdf``.
```

## README entry format

Match existing bullets: **Book 1, Lecture M, …** — [Title (PDF)](docs/...pdf) ([TeX source](docs/...tex))

## Deeper conventions

- TikZ / PGF figures: **`latex-tikz`** (use proactively with TeX per **`theoretical-minimum-tex-exercise-style`**).
- Framed blocks + footnotes (generic): **`latex-framed-blocks-footnotes`**.
- Book 1 TeX layout and paths: **`theoretical-minimum-tex-exercise-style`**.
- Older TeX missing `footnote` + `savenotes` on colored boxes: **`theoretical-minimum-tex-backfill-prompt-footnotes`** (applies **`latex-framed-blocks-footnotes`** in `docs/book1/`).
- `pdflatex` (generic): **`latex-pdflatex-build`**; repo-scoped wrapper: **`theoretical-minimum-pdf-build`**.
- Strict typing, pytest, ruff: **`theoretical-minimum-exercise-python-tests`**.

## Where this repo lives vs Cursor

Canonical skill trees in this `skills` repository live under `skills/skills/<name>/` (see repo README). Cursor loads from `~/.cursor/skills/<name>/` (user) or `.cursor/skills/` (project). After adding skills here, run `tools/install-cursor-skills.ps1` (or copy the new folders) so Cursor sees them.
