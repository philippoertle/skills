---
name: physics-mechanics-rope-friction-real-systems
description: >-
  Model rope and pulley systems with losses: dry friction on cylinders (capstan
  equation), per-bend or per-device efficiency, effective vs theoretical
  mechanical advantage, soft-rope elasticity at a high level, and piecewise
  static phases (hold, pull, reset). Use whenever the user mentions rope over an
  edge, friction on a biner or bar, capstan, belay device friction, haul
  efficiency, "effective MA," tension ratio around a bend, or why a 3:1 feels
  like much less—even without mountaineering context. Load
  physics-mechanics-rope-pulley-statics first for ideal topology and tension
  accounting. Do not use as the primary skill for full crevasse rescue SOPs or
  anchor rigging checklists; pair with mountaineering skills when the scenario is
  glacier rescue. Read references/capstan-and-efficiency.md for formulas and
  limits.
---

# Real rope systems: friction and efficiency

## Role of this skill

Extend **ideal statics** with **directional friction** and **empirical loss** so tension ratios and **effective MA** match field and lab intuition better than massless ideal sheaves.

## Prerequisite

Use **`physics-mechanics-rope-pulley-statics`** for \(F=ma\), constraints, and ideal MA from geometry. This skill adds **loss models** on top.

## Capstan (rope on a curved, rough surface)

For a **flexible rope** wrapping angle \(\theta\) (radians) on a cylinder with **constant friction coefficient** \(\mu\), the textbook **belt friction** relation is:

\[
T_\text{high} = T_\text{low}\, e^{\mu\theta}
\]

where \(T_\text{high}\) is on the side that would slip **last** if load increased—identify which side is “holding” vs “being pulled.” For small \(\theta\), deviations from this model grow; for **multiple materials** (ice, aluminum, textile), treat \(\mu\) as **empirical**.

Details and caveats: [references/capstan-and-efficiency.md](references/capstan-and-efficiency.md).

## Per-bend efficiency (engineering shortcut)

Assign each major bend/device an efficiency \(\eta_i \in (0,1]\) so power-ish products approximate compound loss, or use a **fixed tension ratio** per device class when the user supplies it. Always label this as **phenomenological**, not a first-principles derivation.

## Effective mechanical advantage

\[
\mathrm{MA}_\text{eff} = \frac{F_\text{out}}{F_\text{in}} = \frac{v_\text{in}}{v_\text{out}}
\]

(in steady quasistatic motion, ideal power in ≈ power out). Compare to **theoretical MA** from **`physics-mechanics-rope-pulley-statics`**; quote **both** when the user cares about haul “feel.”

## Soft rope (optional layer)

For **slow** pulls, a **linear spring** along the rope segment can approximate stretch for anchor peak loads; for **slack snapping tight**, warn that **dynamic** effects amplify peak force beyond static friction models.

## Workflow

1. Solve **ideal** topology and tensions (prerequisite skill).
2. **Annotate bends** (lip, carabiner, pulley, plate) and pick **capstan vs \(\eta\)** per segment from user data or stated assumptions.
3. Propagate tension **from load toward haul** (or reverse), one segment at a time.
4. Report **range** if \(\mu\) or \(\eta\) is uncertain.

## Downstream / pairing

- **`mountaineering-crevasse-rescue-mechanics`** — where bends and anchors sit in rescue systems.
- **`physics-mechanics-rope-systems-simulation`** — implementing friction in time stepping.

## Things this skill does not do

- Guarantee **numeric \(\mu\)** for the user's rope and surface—cite uncertainty.
- Replace **instrumented testing** or manufacturer data for specific devices.

## Additional resources

- [references/capstan-and-efficiency.md](references/capstan-and-efficiency.md)
