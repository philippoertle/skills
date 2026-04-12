#!/usr/bin/env python3
"""
Run standard, non-destructive checks on a Python project.

This does not replace reading PEPs; it automates common gates (syntax,
optional lint, type-check, tests) that teams often align with PEP-oriented
tooling.

Usage:
  python validate_python_project.py [--root PATH] [--require ruff,mypy,pytest]

Exit code 0 if all executed checks succeed; non-zero otherwise.
"""

from __future__ import annotations

import argparse
import compileall
import subprocess
import sys
from pathlib import Path

SKIP_DIR_NAMES = frozenset({
    ".git",
    ".hg",
    ".venv",
    "venv",
    "__pycache__",
    "build",
    "dist",
    ".tox",
    ".mypy_cache",
    ".ruff_cache",
    "node_modules",
})


def compile_tree(root: Path) -> bool:
    ok = True
    for path in root.rglob("*.py"):
        if any(part in SKIP_DIR_NAMES for part in path.parts):
            continue
        if not compileall.compile_file(str(path), quiet=1, force=True):
            ok = False
    return ok


def run_module(module: str, args: list[str], cwd: Path) -> tuple[int, str]:
    proc = subprocess.run(
        [sys.executable, "-m", module, *args],
        cwd=cwd,
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
    )
    out = (proc.stdout or "") + (proc.stderr or "")
    return proc.returncode, out


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate a Python project tree.")
    parser.add_argument(
        "--root",
        type=Path,
        default=Path("."),
        help="Project root (default: current directory)",
    )
    parser.add_argument(
        "--require",
        type=str,
        default="",
        help="Comma-separated: ruff,mypy,pytest — fail if tool missing or errors",
    )
    parser.add_argument(
        "--skip",
        type=str,
        default="",
        help="Comma-separated checks to skip: ruff,mypy,pytest",
    )
    args = parser.parse_args()
    root: Path = args.root.resolve()
    required = {x.strip().lower() for x in args.require.split(",") if x.strip()}
    skipped = {x.strip().lower() for x in args.skip.split(",") if x.strip()}

    if not root.is_dir():
        print(f"error: root is not a directory: {root}", file=sys.stderr)
        return 2

    print(f"==> compileall under {root} (skipping common vendor/venv dirs)")
    if not compile_tree(root):
        print("error: compileall failed for one or more files", file=sys.stderr)
        return 1
    print("==> compileall: ok")

    checks: list[tuple[str, str, list[str]]] = [
        ("ruff", "ruff", ["check", str(root)]),
        ("mypy", "mypy", [str(root)]),
        ("pytest", "pytest", ["-q", str(root)]),
    ]

    for name, module, cmd in checks:
        if name in skipped:
            print(f"==> skip {name}")
            continue
        rc, out = run_module(module, cmd, cwd=root)
        if rc == 0:
            print(f"==> {name}: ok")
            continue
        combined = out.lower()
        missing = (
            "no module named" in combined
            or "not recognized" in combined
            or "error: no such option" in combined
        )
        if missing and name not in required:
            print(f"==> optional {name} not available (install package or use --require)")
            continue
        if missing and name in required:
            print(f"error: required tool {name} missing:\n{out}", file=sys.stderr)
            return 1
        print(f"error: {name} failed:\n{out}", file=sys.stderr)
        return 1

    print("All executed checks passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
