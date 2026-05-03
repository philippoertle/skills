---
name: physics-mechanics-rope-systems-simulation
description: >-
  Plan and implement simulation of rope–pulley systems: state variables,
  algebraic constraints vs ODEs, friction parameterization (per-bend or
  capstan), explicit integration stability, time-step guidance, and when to use
  constraint solvers or physics-engine-style joints. Use whenever the user asks
  to simulate, time-step, code, or numerically integrate pulleys, hauls, blocks
  and tackle, or graph-of-nodes rope systems—even for game or education demos.
  Load physics-mechanics-rope-pulley-statics for ideal constraints and
  physics-mechanics-rope-friction-real-systems when friction or rope-on-edge
  matters. Do not use as the primary skill for mountaineering rescue checklists;
  pair with mountaineering-crevasse-rescue-mechanics when labeling real rescue
  elements. Read references/simulation-notes.md for patterns and pitfalls.
---

# Simulating rope–pulley systems

## Role of this skill

Turn a **topology** (masses, anchors, sheaves, rope segments) into a **computable model**: choose **coordinates**, **constraints**, **force laws**, and an **integrator** appropriate to stiffness and friction.

## Prerequisite skills

- **`physics-mechanics-rope-pulley-statics`** — constraints, ideal MA, \(F=ma\) setup.
- **`physics-mechanics-rope-friction-real-systems`** — capstan and \(\eta\) models to implement as nonlinear force laws or inequality constraints (stick-slip is advanced).

## Modeling choices

| Goal | Typical approach |
|------|------------------|
| Slow haul, no slack snap | **Quasi-static** sequence: solve linear algebra each step while inputs move |
| Moving masses, stiff rope | **ODE** with springs/dampers along segments OR **constraint** formulation |
| Many contacts, stick-slip | Specialized solvers or engine joints; warn on complexity |

## State vector habit

- Positions and velocities of **each independent mass** and **rotating pulley** (if inertial).
- Rope: either **minimal coordinates** + **Lagrange** (compact but fiddly) or **Maxwell-style** segments with **constraints** (more common in code).

## Integration (practical defaults)

- **Stiff ropes** + explicit Euler → instability; prefer **semi-implicit Euler**, **RK4**, or **constraint projection** each substep.
- **Time step**: shrink until energy drift (if conservative subsystem) or tension spikes stabilize; state that **orders of magnitude** depend on rope stiffness choice.

## Friction in simulation

- **Smooth \(\eta\)** per bend: cheap, stable, not physical for large wrap angles by itself.
- **Capstan**: use \(e^{\mu\theta}\) with **directional branch** for which side is tight; document slip state if evolving.

## Validation

- Recover **ideal static MA** when friction → 0 and pulleys → ideal.
- **Energy** check on conservative subsets; for dampers/friction, check **work rates** \(\sum F\cdot v\).

## Downstream pairing

- **`mountaineering-crevasse-rescue-mechanics`** — label elements and interpret outputs without implying field certification.

## Additional resources

- [references/simulation-notes.md](references/simulation-notes.md)
