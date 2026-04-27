---
name: physics-optics-telescope-builder
description: >-
  Design and reason about optical telescopes for astronomy or terrestrial use:
  refractors (Keplerian, Galilean, achromatic objectives), reflectors
  (Newtonian layout, parabolic primary, flat/elliptical secondary), catadioptric
  tradeoffs at a high level, eyepiece choice, magnification, f-number, aperture
  and light grasp, resolution vs diffraction and seeing, field of view and exit
  pupil, collimation, mounts (alt-az, fork, wedge tracking), portability and
  budget tradeoffs, and DIY / hobbyist build sequencing. Use whenever the user
  mentions building, specifying, comparing, or upgrading a telescope, Dobsonian,
  spotting scope, astrograph constraints, "what eyepiece for Jupiter," focal
  ratio choices, baffles and stray light, or picking objective diameter—even if
  they do not say "optical design." For ray optics, sign conventions, and
  thin-lens/mirror physics, combine this skill with the prerequisite
  physics-optics-geometrical-optics. Do not use as the primary skill for radio /
  X-ray / gamma telescope engineering, full Zemax/Code V optimization workflows,
  or professional observatory contracts unless the user asks for optical
  principles only; defer detailed interferometry and non-optical detector chains.
---

# Telescope builder (optical design for makers)

## Prerequisite (read first for the physics)

Use **`physics-optics-geometrical-optics`** alongside this skill for **paraxial rays**, **sign conventions**, **Snell/refraction**, **thin-lens relations**, and **when the ray model breaks down** (diffraction, coherence).

Typical locations:

- In this repo: `skills/physics-optics-geometrical-optics/`
- When installed for Cursor: `~/.cursor/skills/physics-optics-geometrical-optics/` (or your team’s skills root)

Open that skill’s `SKILL.md` and, when formulas must be exact, its `references/geometrical-optics-wikipedia.md`.

## What this skill optimizes for

Help the user **choose and size** an optical telescope: clear goals (visual vs imaging), **aperture**, **focal length / f-number**, **eyepiece or camera coupling**, **mechanical length** and fold, **aberration budget** at a qualitative or back-of-envelope level, and **operational** issues (collimation, mount, seeing). Prefer **structured comparisons** and **explicit assumptions** over single-number hype.

## Design workflow (follow in order)

1. **Intent** — Visual deep sky vs planets vs wide field? Photography (focal ratio, back focus)? Budget, transport, light pollution?
2. **Architecture** — Refractor vs reflector vs catadioptric (see Wikipedia overview reference). Name **central obstruction** for reflectors and **collimation** duty.
3. **Light grasp and resolution** — Aperture \(D\) sets collected power \(\propto D^2\). Quote **diffraction-limited** resolution order-of-magnitude (\(\sim \lambda/D\)) and contrast it with **atmospheric seeing** for ground-based use (reference: hobbyist notes).
4. **Magnification and exit pupil** — Relate objective focal length \(f_{\mathrm{obj}}\), eyepiece \(f_{\mathrm{eye}}\), and \(f/\#\) to practical magnifications and **exit pupil**; warn against "empty" magnification when the pupil is smaller than the eye’s useful range. Formulas and usage bands: [references/hobbyist-telescope-edmund-summary.md](references/hobbyist-telescope-edmund-summary.md).
5. **Tube / path length** — Keplerian length \(\approx f_{\mathrm{obj}} + f_{\mathrm{eye}}\) (paraxial); folded Newtonian shortens packaging at cost of alignment complexity.
6. **Vendors and BOM** — Do **not** treat part numbers as authoritative forever. Point to current catalogs and the **live** Edmund application note for example BOMs; suggest astronomy retailers for tubes, focusers, and secondary hardware.
7. **Verification** — Collimation steps for reflectors; star test or Ronchi concepts at a high level; suggest external guides for mechanical alignment.

## Where bundled references fit

| File | Use when |
|------|-----------|
| [references/telescope-overview-wikipedia.md](references/telescope-overview-wikipedia.md) | Taxonomy (refractor/reflector/catadioptric), history context, spectrum beyond visible, space vs ground |
| [references/hobbyist-telescope-edmund-summary.md](references/hobbyist-telescope-edmund-summary.md) | Magnification, exit pupil, seeing vs aperture, FOV, refractor vs reflector tradeoffs, mounts, collimation pointers |

## Output shape (default)

For design questions, default to:

1. **Recommendation** (one or two architectures) with **why**
2. **Key numbers** (aperture, f/\#, focal length, example eyepieces) with **stated formulas**
3. **Tradeoffs** (cost, mass, cooldown, maintenance)
4. **Next steps** (what to buy or build first, what to simulate in software if they go pro)

## Safety and realism

- Large aperture on a poor mount or under poor seeing **underperforms** a modest scope on a stable site—say so.
- Open Newtonians need **dew / dust** and **stray light** awareness; refractors need **chromatic** control for fast achromats unless apo budget exists.
- Do not promise **diffraction-limited** performance from hand-figured mirrors without verification.

## Things this skill does not replace

- **Optical design software** (Zemax, Code V, OSLO) lens-by-lens optimization
- **Structural FEA**, **thermal modeling**, or **electrical** for GOTO mounts
- **Regulatory** laser or aviation topics
