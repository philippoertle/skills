---
name: mountaineering-crevasse-rescue-mechanics
description: >-
  Relate glacier crevasse rescue haul systems (direct haul, drop-loop / quick 3:1
  patterns, Z-pulley, compound hauls, progress capture) to force reasoning:
  anchor vectors, rope lip friction, haul direction, and what is safe to estimate
  vs what requires field training. Use whenever the user mentions crevasse
  rescue, glacier hauling, Z-pulley, piggyback haul, prusik minding, progress
  capture, two-pulley systems, edge protection, or combining rescue vocabulary
  with forces—even if they do not ask for numbers. Always pair physics with
  explicit non-prescriptive safety framing; do not replace courses, local
  protocol, or terrain judgment. For ideal pulley homework without rescue
  context, use physics-mechanics-rope-pulley-statics; for capstan and
  efficiency, use physics-mechanics-rope-friction-real-systems; for quick anchor
  load formulas and estimation habits, use
  mountaineering-rope-forces-field-estimation. Read references/glossary-and-systems.md
  for terminology and system sketches.
---

# Crevasse rescue: mechanics in context

## Safety and scope (mandatory)

Crevasse rescue is **life-critical**. This skill supports **physics intuition**, **vocabulary**, and **force-direction reasoning**—not a substitute for **instruction under qualified supervision**, **team practice**, or **organization-specific SOPs**.

When the user asks what to rig in the field:

- Prefer **tradeoffs, unknowns, and questions** (team size, available kit, edge quality, direction of pull, redundancy) over a single definitive rigging order unless the user supplied exhaustive constraints—and even then frame outcomes as **educational**, not operational orders.
- Never imply certification or site-specific compliance from a model alone.

## Prerequisite skills (load as needed)

- **`physics-mechanics-rope-pulley-statics`** — ideal MA, constraints, \(F=ma\).
- **`physics-mechanics-rope-friction-real-systems`** — lip and biner friction, effective MA.
- **`mountaineering-rope-forces-field-estimation`** — anchor load components and quick estimates.
- **`physics-mechanics-rope-systems-simulation`** — implementing dynamics or staged solvers in code.

## Role of this skill

Map **common improvised and lightweight haul architectures** to **mechanical questions**: which strands carry tension, where friction dominates, how **haul direction** changes **anchor resultants**, and how **progress capture** splits the problem into static phases.

## Systems vocabulary (non-exhaustive)

See [references/glossary-and-systems.md](references/glossary-and-systems.md) for expanded notes.

- **Direct haul** — ~1:1 ideal; losses at lip and devices dominate perceived ease.
- **Drop-loop / “quick” 3:1 family** — aim for higher ideal MA with minimal kit; effective MA depends heavily on **pulleys vs non-pulley carabiners** and the **lip**.
- **Z-pulley** — classic teaching pattern for ~3:1 ideal; friction reduces effective gain.
- **Compound / piggyback** — theoretical MA multiplies; friction and reset complexity multiply too.
- **Progress capture** — prevents load running back; model as **held** vs **moving** phases rather than a single conservative energy loop unless capture is explicitly modeled.

## Workflow

1. **Clarify scenario**: number of rescuers, anchor type (only as user describes), lip presence, dynamic vs static rope if relevant to warnings.
2. **Sketch topology** — nodes (anchors, pulleys, prusiks as one-way elements only if modeling phases), edges (rope segments), **input hand** vs **load**.
3. **Ideal MA** from rope kinematics (statics skill); **then** apply friction layer (friction skill) for **effective MA** and tension ratios.
4. **Anchors**: resolve **vectors** (estimation skill); flag **bad angles** (high lateral component, multiplicative load on a piece).
5. **State uncertainties** — snow bollard vs screws vs deadman changes **confidence**, not the vector math.

## Things this skill does not do

- Replace **AIARE/WMS/organization courses** or **guide decision-making** on go/no-go.
- Provide **legal** or **insurance** advice.
- Enumerate **every regional variant name** for the same graph—prefer **topology** over brand names.

## Additional resources

- [references/glossary-and-systems.md](references/glossary-and-systems.md)
