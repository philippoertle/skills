# PEP lifecycle map

All URLs use the canonical site **https://peps.python.org/**. Start from **[PEP 0](https://peps.python.org/pep-0000/)** if a number is unknown — use the numerical index, category index, or topic lists (**Packaging**, **Typing**, **Release**, **Governance**).

## Planning and design

| Topic | PEP | Note |
|-------|-----|------|
| Design principles | [PEP 20](https://peps.python.org/pep-0020/) | Zen of Python — informal |
| Public APIs / deprecation | [PEP 387](https://peps.python.org/pep-0387/) | Backwards compatibility policy |
| Python command on Unix | [PEP 394](https://peps.python.org/pep-0394/) | `python` vs `python3` |

Add **domain** PEPs from the index (e.g. WSGI/ASGI, DB-API) when the product touches those stacks.

## Development (code and docs)

| Topic | PEP | Note |
|-------|-----|------|
| Style | [PEP 8](https://peps.python.org/pep-0008/) | Style guide for Python code |
| Docstrings | [PEP 257](https://peps.python.org/pep-0257/) | Conventions |
| reST in docstrings | [PEP 287](https://peps.python.org/pep-0287/) | Optional format |
| Type hints (baseline) | [PEP 484](https://peps.python.org/pep-0484/) | Syntax and semantics |
| Type theory (context) | [PEP 483](https://peps.python.org/pep-0483/) | Informational |
| Generics in stdlib | [PEP 585](https://peps.python.org/pep-0585/) | Built-in collections |
| Exception notes | [PEP 678](https://peps.python.org/pep-0678/) | `raise ... from` / `__notes__` |

**Typing** evolves quickly — use the **Typing PEPs** topic on the main index for current proposals (e.g. `TypedDict`, `Protocol`, `TypeVarTuple`, etc.).

## Verification (testing and quality)

| Topic | PEP | Note |
|-------|-----|------|
| Exception chaining clarity | [PEP 678](https://peps.python.org/pep-0678/) | Richer tracebacks |

Testing layout is not a single PEP; use project convention plus PEP 8/257. Type-checking distribution: [PEP 561](https://peps.python.org/pep-0561/).

## Integration (packaging and environments)

| Topic | PEP | Note |
|-------|-----|------|
| Build backend interface | [PEP 517](https://peps.python.org/pep-0517/) | |
| `pyproject.toml` build | [PEP 518](https://peps.python.org/pep-0518/) | |
| Core metadata in `pyproject` | [PEP 621](https://peps.python.org/pep-0621/) | |
| Editable installs | [PEP 660](https://peps.python.org/pep-0660/) | |
| `py.lock` (if adopted by tooling) | See current **Packaging** topic PEPs | |

## Release and distribution

| Topic | PEP | Note |
|-------|-----|------|
| Version specifiers | [PEP 440](https://peps.python.org/pep-0440/) | |
| Distributing type info | [PEP 561](https://peps.python.org/pep-0561/) | `py.typed` |

For **CPython release mechanics** (not most apps), see informational [PEP 101](https://peps.python.org/pep-0101/) and version-specific release schedule PEPs linked from the index.

## When a PEP is provisional or superseded

PEP 0’s **status** and **category** fields are authoritative. If a PEP is **Superseded** or **Rejected**, follow the replacement called out in that PEP or the index.
