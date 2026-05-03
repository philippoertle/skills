---
name: literature-web-search-report
description: >-
  Plans and runs open-web literature discovery, evaluates sources, and produces a
  structured search report (question, strategy, queries, summarized findings,
  annotated bibliography, gaps, follow-ups). Use whenever the user asks for a
  literature review, paper search, evidence scan, state of the art from the web,
  annotated bibliography, or a documented search log—even for gray literature,
  standards, preprints, or cross-disciplinary topics. Prefer web search and
  targeted page retrieval over guessing citations; flag paywalled or inaccessible
  full text. Do not use as the primary skill for paywalled database SQL/API
  workflows unless the user supplies access; pair with domain-specific skills for
  deep methods critique. For the report skeleton and bibliography table format,
  read references/report-template.md.
disable-model-invocation: false
---

# Web literature search and search report

## Role

Turn an underspecified topic into a **traceable** mini literature pass: explicit question, reproducible queries, ranked notes on what each source contributes, and honest limits (language, time, access).

## Before the first search

1. **Restate the research question** in one or two sentences; list **must-have** vs **nice-to-have** concepts.
2. Agree **scope**: disciplines, years (e.g. last 5–10), geography, language, document types (peer-reviewed, preprints, theses, reports, standards).
3. Plan **5–12 query variants** (synonyms, acronyms, author + keyword, opposing terms) instead of one vague string.

## Search execution

- Run **several** focused searches; refine using terminology spotted in good hits (snowball within the open web, not paywalled corpora unless the user has access).
- When a result matters, **open the page** (fetch or equivalent) to confirm claims, year, venue, and exact wording—**do not** trust titles/snippets alone for numeric or legal claims.
- **Deduplicate** URLs and versions (arXiv vs journal page); prefer canonical pages (publisher, society, preprint server) when stable.

## Source triage (lightweight)

For each candidate, note quickly: **type** (article, preprint, blog, doc, video), **recency**, **venue or host**, **independence** (primary data vs commentary), and **how it answers the question**. Down-rank: unknown aggregators, SEO listicles, uncited strong claims.

## Paywalls and ethics

- Treat **paywalled full text** as unavailable unless the user provides files or access; use abstracts, open-access editions, or author copies when findable legitimately.
- Do not instruct bypassing access controls or scraping behind logins.

## Output

Produce the report using the structure in [references/report-template.md](references/report-template.md). Always include **query log**, **date of search**, and **URLs** (full strings) for every cited source.

## Quality bar

- Separate **established consensus** from **single-study** or **opinion** claims.
- Mark **uncertainty** where the web does not support a definite answer.
- If evidence is thin, say so and propose **next queries** or **offline** next steps (library databases, specialist indexes).
