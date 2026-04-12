---
name: git-gh-commit-push
description: >-
  Stages changes, creates commits, pushes to GitHub, and uses the GitHub CLI (gh)
  for auth, repo context, and follow-ups like pull requests. Use whenever the user
  wants to commit, push, sync with GitHub, open a PR, or says things like "stage and
  commit", "push my changes", "gh pr", or "get this on GitHub" — even if they only
  mention git; prefer this workflow when GitHub or gh is available or implied.
---

# Git + GitHub CLI commit and push

Guide and execute a safe, repeatable path from working tree → remote on GitHub using **git** for version control and **gh** for GitHub-specific actions.

## Before you touch the tree

1. **Repository root** — Run git commands from the repo root unless the user scoped a subdirectory; if unsure, confirm with `git rev-parse --show-toplevel`.
2. **GitHub CLI** — Prefer `gh` for anything that needs GitHub identity or API:
   - `gh auth status` — If not logged in, tell the user to run `gh auth login` (do not invent tokens).
   - `gh repo view` — Quick check that the directory is linked to a GitHub repo when helpful.
3. **Current state** — `git status` (and optionally `git branch --show-current`, `git remote -v`). Do not assume branch names like `main` without checking.

## Staging

- **Default** — Stage only what the user asked to include. If they said "commit everything" or "all changes", `git add -A` or `git add .` from repo root is fine; otherwise stage explicit paths.
- **Interactive / partial** — When the user wants to split hunks or exclude pieces, use `git add -p` (patch) for tracked files; explain briefly that new files must be added normally first (`git add -N` or add file then `git add -p`).
- **Sanity** — Glance at `git diff --staged` before committing. Do not stage obvious secrets (`.env`, keys, large binaries) unless the user explicitly asked; warn if you see them.

## Committing

- **Message** — Short imperative subject (optional body after a blank line). Match project conventions if `.gitmessage`, CONTRIBUTING, or recent history shows a pattern (e.g. Conventional Commits).
- **One logical change** — If the working tree mixes unrelated edits, suggest splitting commits or ask what to bundle.
- **Hooks** — Let pre-commit / commit-msg hooks run. Do not use `--no-verify` unless the user explicitly requests it.

## Pushing

- **Upstream** — If the branch has no upstream: `git push -u origin <branch>` (use the actual remote name, usually `origin`).
- **Failures** — If push rejects (non-fast-forward), do **not** force-push. Fetch/rebase or merge per user preference; explain the situation clearly.
- **Force** — Never `git push --force` or `--force-with-lease` without explicit user instruction.

## Using `gh` after push

Use when the task implies GitHub workflows:

| Goal | Typical command |
|------|-----------------|
| Open a PR from current branch | `gh pr create` (add `--fill` or title/body flags as appropriate) |
| See PR for this branch | `gh pr view` / `gh pr status` |
| Sync default branch | `git fetch origin` and merge/rebase as the user prefers; optional `gh repo sync` only if the user wants that workflow |

Prefer **non-interactive** flags when running for the user in automation (`--title`, `--body`, `--fill`, `-w` to open browser) so commands do not hang waiting for an editor.

## Checklist (copy when helpful)

```text
- [ ] gh auth OK (or user notified to log in)
- [ ] Correct repo and branch
- [ ] Staged only intended paths
- [ ] Commit message matches intent and project style
- [ ] Push succeeded (or user informed of conflict/rejection)
- [ ] PR created or linked if user wanted one
```

## What not to do

- Do not commit on behalf of the user without clear intent to record changes.
- Do not rewrite published history or force-push without explicit approval.
- Do not store or echo credentials; rely on `gh auth` and system credential helpers.

## If `gh` is missing

Fall back to **git + HTTPS/SSH** only: `git push` with configured remotes. Tell the user installing the CLI enables `gh pr create` and richer GitHub integration: https://cli.github.com/
