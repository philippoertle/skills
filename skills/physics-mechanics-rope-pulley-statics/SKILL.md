---
name: physics-mechanics-rope-pulley-statics
description: >-
  Reason about static and slow-acceleration rope–pulley systems using Newtonian
  mechanics: free-body diagrams, tension, ideal pulleys and massless
  inextensible rope, kinematic constraints from fixed rope length, inclined
  planes, and mechanical advantage from topology. Use whenever the user asks
  about pulleys, blocks and tackle, Atwood machines, rope constraint equations,
  tension in segments, homework-style MA, or force balance on hanging masses
  connected by cord—even if they do not say "statics." Do not use as the primary
  skill for capstan friction, rope-on-edge losses, crevasse rescue field
  procedure, or numerical simulation time steps; point to the rope-friction,
  mountaineering, or rope-simulation skills instead. Read
  references/worked-patterns.md for ideal MA templates and constraint examples.
---

# Rope and pulley statics (ideal baseline)

## Role of this skill

Provide a **clean mechanical baseline**: \( \sum \mathbf{F} = m\mathbf{a} \) (often \( \mathbf{a}=\mathbf{0} \) for statics), **tension** along rope segments, **ideal pulleys** (change direction only; massless pulley + massless rope ⇒ same tension magnitude on a single continuous strand), and **constraints** that relate accelerations from geometry.

## Standard idealizations (state them explicitly)

- **Massless, inextensible rope**; no slip on sheaves unless the user says otherwise.
- **Massless frictionless pulley** on a frictionless axle → tension unchanged across the pulley for that strand.
- If the **pulley has mass** or the axle **exerts torque**, leave the ideal pulley model and include \( \tau = I\alpha \) and \( a = R\alpha \) at the rim—or say you need more data.

## Workflow

1. **Label segments** of rope (separate \(T\) only where the rope is broken by knots, grabs, or different branches).
2. **Free-body diagram** per body (each block; pulley only if massive or if you sum forces on the pulley as a node).
3. **Constraint**: differentiate constant total rope length once (velocities) or twice (accelerations) to relate motion along the rope direction—see [references/worked-patterns.md](references/worked-patterns.md).
4. **Solve** the linear system; **sanity-check** dimensions, limiting cases (e.g. equal masses → zero acceleration for a simple Atwood).

## Mechanical advantage (ideal)

Define **theoretical MA** from **kinematics**: if the load moves distance \( \Delta x_L \) while the haul line is pulled \( \Delta x_H \), then ideal \( \mathrm{MA} = \Delta x_H / \Delta x_L \) for a machine that trades displacement for force in equilibrium. For ideal lossless statics, this matches the ratio of **supporting strands** on the moving block in classic block-and-tackle patterns—verify with a **rope-length** argument, not memory alone.

## Downstream skills

- **`physics-mechanics-rope-friction-real-systems`** — capstan friction, per-bend efficiency, effective MA.
- **`mountaineering-crevasse-rescue-mechanics`** and **`mountaineering-rope-forces-field-estimation`** — field context, anchors, rescue vocabulary (with safety framing).
- **`physics-mechanics-rope-systems-simulation`** — ODEs, constraints, integration.

## Things this skill does not do

- Replace **course-specific sign conventions**—pick one, declare it, stay consistent.
- Teach **mountaineering SOPs** or **gear rigging orders**; keep physics only.

## Additional resources

- [references/worked-patterns.md](references/worked-patterns.md) — constraints, ideal MA patterns, incline reminder.
- [references/sign-conventions.md](references/sign-conventions.md) — one consistent 1D choice.
