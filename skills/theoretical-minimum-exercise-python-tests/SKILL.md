---
name: theoretical-minimum-exercise-python-tests
description: Implements strict-typed exercise modules and pytest tests for the theoretical-minimum Python package—imports, docstrings linking TeX/PDF, numeric checks, ruff, mypy. Use when adding or changing src/theoretical_minimum/book1/**/*.py or tests/book1/**/*.py for exercises.
disable-model-invocation: true
---

# Theoretical Minimum — exercise Python and tests

## Project rules (`pyproject.toml`)

- **Python:** `>=3.11`, packages under `src/theoretical_minimum`, `mypy` strict on `theoretical_minimum`.
- **Ruff:** `src` + `tests`, line length 100, selects E, F, I, UP, W.
- **Pytest:** `testpaths = ["tests"]`, `pythonpath = ["src"]` (import package as `theoretical_minimum...`).

## Module style

- Start with `from __future__ import annotations`.
- Use typed signatures and explicit `raise ValueError(msg)` with a string `msg = "..."` when validating inputs (keeps ruff/mypy happy).
- Module docstring: one-line summary + TeX/PDF paths in double backticks (see `src/theoretical_minimum/book1/lecture_02/exercise_01.py`).
- Prefer **stdlib** (`math`) for exercise math unless the exercise truly needs numpy/sympy; keeps optional deps minimal.

## Test file style

- Path: `tests/book1/test_lecture_MM_exercise_NN.py` or `test_lecture_MM_interlude_KK_exercise_NN.py`.
- Import: `from theoretical_minimum.book1.lecture_MM import exercise_NN` (adjust for interlude subpackage).
- Use `pytest.approx` for floats; `@pytest.mark.parametrize` for tables of cases.
- When checking derivatives or similar, **central differences** on the original function are a good independent check against closed-form code.

## Commands (repo root)

```bash
python -m pytest tests/book1/test_<module>.py -q
python -m ruff check src/theoretical_minimum/book1 tests/book1
python -m mypy src/theoretical_minimum/book1/<path-to-file>.py
```

## Package layout

- New lecture folder: `src/theoretical_minimum/book1/lecture_MM/__init__.py` with `__all__: list[str] = []` unless exporting symbols.
- Mirror the book’s lecture / interlude structure; do not flatten unrelated exercises into one module unless the repo already does.
