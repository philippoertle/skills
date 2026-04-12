#!/usr/bin/env bash
# Copy skills from this repository for Cursor IDE.
# Default: ~/.cursor/skills (all workspaces). Use --project for ./.cursor/skills.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILLS_SRC="$REPO_ROOT/skills"
TEMPLATE_SRC="$REPO_ROOT/template"

CLEAN=0
INCLUDE_TEMPLATE=1
PROJECT=0

usage() {
  cat <<'EOF'
Usage: install-cursor-skills.sh [options]

Default: copies each skill (folder with SKILL.md) from ./skills into
  ~/.cursor/skills
so Cursor loads them for every workspace for the current user.

Options:
  --project         Install into <repo>/.cursor/skills instead
  --clean           With --project only: remove all of .cursor/skills first.
                    (Ignored for user install; each skill folder is replaced.)
  --no-template     Skip copying ./template
  -h, --help        Show this help

Re-run after git pull to refresh copies.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --clean) CLEAN=1 ;;
    --no-template) INCLUDE_TEMPLATE=0 ;;
    --project) PROJECT=1 ;;
    -h|--help) usage; exit 0 ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

if [[ ! -d "$SKILLS_SRC" ]]; then
  echo "error: skills directory not found: $SKILLS_SRC" >&2
  exit 1
fi

if [[ "$PROJECT" -eq 1 ]]; then
  DEST="$REPO_ROOT/.cursor/skills"
else
  DEST="${HOME}/.cursor/skills"
fi

mkdir -p "$DEST"

if [[ "$CLEAN" -eq 1 ]]; then
  if [[ "$PROJECT" -eq 1 ]]; then
    echo "Cleaning $DEST"
    find "$DEST" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
  else
    echo "warning: --clean applies only with --project; updating user skills per folder only." >&2
  fi
fi

installed=0
for dir in "$SKILLS_SRC"/*/; do
  [[ -d "$dir" ]] || continue
  name="$(basename "$dir")"
  if [[ -f "${dir}SKILL.md" ]]; then
    echo "Installing skill: $name"
    rm -rf "$DEST/$name"
    cp -R "$dir" "$DEST/$name"
    installed=$((installed + 1))
  fi
done

if [[ "$INCLUDE_TEMPLATE" -eq 1 && -f "$TEMPLATE_SRC/SKILL.md" ]]; then
  echo "Installing skill: template"
  rm -rf "$DEST/template"
  cp -R "$TEMPLATE_SRC" "$DEST/template"
  installed=$((installed + 1))
fi

scope="user"
[[ "$PROJECT" -eq 1 ]] && scope="project"
echo "Done ($scope scope). Installed $installed skill(s) into $DEST"
