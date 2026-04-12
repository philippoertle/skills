# Plan → release checklist (PEP-oriented)

Copy into your repo (e.g. `docs/dev-checklist.md`) and trim for your project. Each item points to **https://peps.python.org/** — open the PEP before locking a decision.

## Plan

- [ ] Problem and public API sketched; invariants documented
- [ ] Compatibility / deprecation approach aligned with [PEP 387](https://peps.python.org/pep-0387/) where relevant
- [ ] Domain-specific PEPs from the index identified (typing, packaging, web, etc.)

## Develop

- [ ] Style and naming follow [PEP 8](https://peps.python.org/pep-0008/)
- [ ] Module, class, and function docstrings follow [PEP 257](https://peps.python.org/pep-0257/)
- [ ] Type hints follow [PEP 484](https://peps.python.org/pep-0484/) and current **Typing** topic PEPs you rely on
- [ ] Exceptions use clear chaining / notes per [PEP 678](https://peps.python.org/pep-0678/) when it helps callers

## Verify

- [ ] `python scripts/validate_python_project.py --root .` (from skill) or equivalent passes
- [ ] Tests cover public API and regressions
- [ ] Type checker clean if the project distributes types ([PEP 561](https://peps.python.org/pep-0561/))

## Integrate

- [ ] `pyproject.toml` present with [PEP 621](https://peps.python.org/pep-0621/) metadata as appropriate
- [ ] Build system declared per [PEP 517](https://peps.python.org/pep-0517/) / [518](https://peps.python.org/pep-0518/)
- [ ] Editable install story documented ([PEP 660](https://peps.python.org/pep-0660/))

## Release

- [ ] Versions follow [PEP 440](https://peps.python.org/pep-0440/)
- [ ] Artifacts built with declared backend; changelog / tags match policy
- [ ] `py.typed` and stub layout correct if publishing typed package
