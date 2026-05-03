---
name: latex-prl-revtex-paper
description: >-
  Drafts or revises LaTeX manuscripts for Physical Review Letters (PRL) using
  APS REVTeX conventions: document class options, two-column layout, abstract and
  length limits, reference and author-list patterns, figures and math
  presentation expectations, and pdflatex/bibtex build habits. Use whenever the
  user mentions Physical Review Letters, PRL, APS letter format, REVTeX prl
  option, compuscript-style PRL submission, or wants a PDF aligned with current
  APS author guidance—not for non-APS journals unless adapting similar REVTeX
  APS options. Always defer numeric length accounting to the official Length
  Guide methodology; read references/official-links.md for canonical URLs and
  references/revtex-letter-skeleton.tex for a minimal Letter shell.
disable-model-invocation: false
---

# PRL-compliant LaTeX (REVTeX + APS norms)

## Role

Help produce **source and structure** consistent with **Physical Review Letters** author guidance: REVTeX-first markup, PRL-specific limits and abstract rules, and editorial expectations for clarity and display. **Policies change**—treat [references/official-links.md](references/official-links.md) as the checklist to open when limits or submission steps are in doubt.

## Article type (default: Letter)

PRL publishes **Letters**, **Essays**, **Comments**, and **Replies** with **different** length rules. Unless the user specifies otherwise, assume a **Letter** (mainline short article). For **Comments/Replies**, read the current limits on the official authors page and Length Guide.

## Length and abstract (verify on APS)

- **Letters:** **3,750 words** limit (official table on the PRL authors page); staff may enforce composition into journal pages—see the **[Length Guide](https://journals.aps.org/authors/length-guide)** for how APS estimates length (including what to include or exclude in counts). **Do not invent** shortcut word counts; point the user to APS procedures when precision matters.
- **PRL abstract:** **≤ 600 characters** (including spaces). Abstract must be **self-contained**—**no** footnotes or citations in the abstract (APS abstracting policy).

## Mandatory submission text (not always in `.tex`)

PRL requires a **100-word compelling justification** at submission (submission system / cover context). Offer to draft it in the cover letter or a separate note if the user is packaging files; it need not live in the manuscript `.tex` unless they want it there.

## REVTeX document setup (common Letter path)

- Use **REVTeX 4.2** with the **`prl`** option and APS bundle, e.g. `revtex4-2` with `[aps,prl,twocolumn,...]` as appropriate to the manuscript stage. **Preprint** (`preprint` or `onecolumn`) is useful while drafting; switch toward **journal-like two-column** before final length checks when the user cares about page count.
- **Affiliations:** follow REVTeX patterns such as **`superscriptaddress`** when linking authors to institutions (see APS REVTeX FAQ / sample).
- **References:** use APS-compatible bibliography support (e.g. **`apsrev4-2`** BibTeX style with REVTeX) unless the user’s template specifies otherwise—stay consistent with APS numbered reference appearance.
- **Author list:** use standard **`\author`…`\affiliation`** (or collaboration patterns per REVTeX docs); avoid non-REVTeX hacks in the author block.

## Style and presentation (editor-facing)

- **Audience:** broad physics readership—minimize unexplained jargon and acronyms; define symbols.
- **Equations:** APS guidance favors **displaying** all but the simplest equations (not tiny inline clutter).
- **Figures/tables:** legible at **journal** size; smallest capitals/numerals should remain readable after reduction (APS cites **~2 mm** smallest cap height in final form—see contributor/style memos on APS).
- **Prior work:** clearly relate results to published papers, proceedings, and meeting abstracts per APS disclosure norms (preprints are **not** treated as prior publication in the same way—still disclose overlap honestly).

## Figures in LaTeX

Use REVTeX figure environments (`figure`, `figure*`, `widetext` where appropriate). For TikZ or PGF line art, follow **`latex-tikz`** and keep graphics **vector** or **high-resolution** raster per APS figure guidance.

## Build workflow

Use **`latex-pdflatex-build`** for engine flags; typical loop: `pdflatex` → `bibtex` → `pdflatex` ×2 until citations settle. Check the `.log` for REVTeX/APS warnings about column floats, broken references, or abstract length.

## Things this skill does not do

- Replace **editors’ decisions**, **journal policy updates**, or **legal review** of third-party text.
- Guarantee acceptance or exact page count from source without the user running APS/REVTeX length tools.
- Subvert **copyright** or **figure rights**—user must supply permissions.

## Bundled references

- [references/official-links.md](references/official-links.md) — canonical APS URLs.
- [references/revtex-letter-skeleton.tex](references/revtex-letter-skeleton.tex) — minimal starter (adapt options to draft vs submission).

## Related skills in this repo

- **`latex-pdflatex-build`** — compile command discipline.
- **`latex-tikz`** — in-manuscript vector diagrams.
- **`latex-framed-blocks-footnotes`** — only if the user mixes non-REVTeX colored boxes (unusual for PRL); prefer native REVTeX structures.
