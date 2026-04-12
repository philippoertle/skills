---
name: python-pep-lifecycle
description: >-
  Grounds Python work in the official PEP index at https://peps.python.org/ (start
  from PEP 0): style and docstrings (PEP 8, PEP 257), typing (PEP 484 and related
  typing PEPs, PEP 561 for distributed types), builds and metadata (PEP 517, 518,
  621, 660), versions (PEP 440), clearer failures (PEP 678), plus planning through
  release. Use whenever someone designs or implements Python libraries or
  applications, edits pyproject.toml, sets up Ruff/mypy/pytest in CI, prepares
  sdists/wheels or a PyPI release, adds or fixes py.typed, migrates off setup.py,
  settles “what does the PEP say?” debates, or wants PEP-compliant, PyPA-aligned,
  or standards-based Python. Do not use for non-Python stacks, front-end-only or
  infra-only work, or questions that never need peps.python.org.
---

# Python lifecycle aligned with PEPs

## Non-negotiable authority

Treat **published PEPs** as the source of truth for standards they define. The canonical index is **[PEP 0 — Index of Python Enhancement Proposals](https://peps.python.org/#)**. Read the specific PEP (or topic index: Packaging, Typing, Release, Governance) before overriding team habit, blog posts, or old examples.

If guidance conflicts, **prefer the active PEP text** on [peps.python.org](https://peps.python.org/) and note deprecations or superseded PEPs in the index.

Machine-readable metadata for all PEPs: see **API** on PEP 0 (`https://peps.python.org/` → API / JSON).

## Lifecycle map (what to open when)

Use this flow; details and links live in [references/pep-lifecycle-map.md](references/pep-lifecycle-map.md).

| Phase | Goal | Start here (examples) |
|-------|------|-------------------------|
| **Plan** | Problem shape, public API, compatibility story | [PEP 20](https://peps.python.org/pep-0020/) (design ethos); domain PEPs from index (e.g. typing, packaging topics) |
| **Develop** | Readable, consistent code and APIs | [PEP 8](https://peps.python.org/pep-0008/), [PEP 257](https://peps.python.org/pep-0257/); typing: [PEP 484](https://peps.python.org/pep-0484/) and follow-ups in Typing topic |
| **Verify** | Correctness and regressions | Tests + type-checking where PEP 484/561 apply; [PEP 678](https://peps.python.org/pep-0678/) (exception notes) when enriching failures |
| **Integrate** | Reproducible builds and dependencies | [PEP 517](https://peps.python.org/pep-0517/) / [518](https://peps.python.org/pep-0518/) / [621](https://peps.python.org/pep-0621/); [PEP 660](https://peps.python.org/pep-0660/) (editable installs) |
| **Release** | Identifiers and artifacts users can trust | [PEP 440](https://peps.python.org/pep-0440/) (versioning); packaging PEPs from index; [PEP 561](https://peps.python.org/pep-0561/) for type information distribution |

When the task touches **only one** area (e.g. “fix docstrings”), still verify against the listed PEP rather than memory.

## How to work under this skill

1. **Identify phase** — planning, coding, testing, packaging, or release — and open the relevant PEP(s) from the map or index.
2. **Apply PEP text literally** for normative sections (MUST/SHOULD in PEPs). For purely informational PEPs, treat as guidance unless the project adopts them explicitly.
3. **Project files** — Prefer `pyproject.toml` per PEP 621 where applicable; build backends per PEP 517/518.
4. **Run validation** — Use [scripts/validate_python_project.py](scripts/validate_python_project.py) from the repository root (or pass `--root`). It runs safe checks (`compileall`, optional `ruff`, `mypy`, `pytest` when available). Fix failures; do not silence checks to “match PEP” without reading the relevant PEP.
5. **Checklists** — Copy or adapt [assets/plan-to-release-checklist.md](assets/plan-to-release-checklist.md) for structured milestones.

## Things this skill does not do

- Replace reading PEPs with guesses. Fetch or open the PEP when unsure.
- Endorse a single formatter or linter as *the* PEP — tools implement *parts* of standards (e.g. style toward PEP 8). Align configuration with the PEP wording the project chose to follow.
- Cover non-PEP company policies; merge those explicitly on top of PEPs.

## Quick commands

Run the bundled validator from **your project root** (adjust path if the skill lives elsewhere, e.g. under `skills/python-pep-lifecycle/` in this repository or `~/.cursor/skills/python-pep-lifecycle/` after install):

```bash
python path/to/python-pep-lifecycle/scripts/validate_python_project.py --root .

# Strict: fail if ruff, mypy, or pytest is missing or reports errors
python path/to/python-pep-lifecycle/scripts/validate_python_project.py --root . --require ruff,mypy,pytest
```

---

For an expanded PEP-by-phase table and topic links, read [references/pep-lifecycle-map.md](references/pep-lifecycle-map.md).
