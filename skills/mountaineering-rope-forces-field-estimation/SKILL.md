---
name: mountaineering-rope-forces-field-estimation
description: >-
  Estimate rope tensions and anchor resultants for mountaineering haul
  contexts: vector resolution at master points, haul-angle effects, combining
  ideal or effective MA with load weight, and order-of-magnitude checks. Use
  whenever the user asks how hard an anchor is loaded, what haul force is needed,
  how direction of pull changes components on a piece, or for back-of-the
  envelope tension after stating MA—even if they only give partial geometry.
  Pair with physics-mechanics-rope-pulley-statics for ideal strand counts and
  physics-mechanics-rope-friction-real-systems for effective MA; use
  mountaineering-crevasse-rescue-mechanics for rescue topology vocabulary and
  mandatory safety framing. Read references/vector-estimation.md for templates.
---

# Field-oriented rope force estimation

## Safety and scope (mandatory)

These estimates support **planning intuition** and **checking orders of magnitude**. They **do not** certify anchors, replace **pull tests**, manufacturer limits, or **qualified field judgment**. When the scenario is **crevasse rescue**, also apply the safety framing in **`mountaineering-crevasse-rescue-mechanics`**.

## Prerequisite skills

- **`physics-mechanics-rope-pulley-statics`** — ideal MA and constraints.
- **`physics-mechanics-rope-friction-real-systems`** — \( \mathrm{MA}_\text{eff} \), tension multipliers on bends.
- **`mountaineering-crevasse-rescue-mechanics`** — system identification and non-physics limits.

## Role of this skill

Provide **fast, explicit** methods to:

- Convert **load** \(W \approx mg\) and stated **MA** to **haul-line tension** \(T_H \approx W / \mathrm{MA}_\text{eff}\) (define whether \(W\) includes friction on the load path).
- Resolve **resultant** force on an anchor from **two or more** strands with angles.
- Flag **high sensitivity** to \(\mathrm{MA}_\text{eff}\) when friction is unknown (give a **range**).

## Workflow

1. **List knowns**: load mass or weight, ideal MA if given, optional \(\eta\) or \(\mu\theta\) per critical bend.
2. **Compute tension** along the primary load path toward the haul input (use friction skill rules).
3. **Vector-add** forces on the master point or piece of interest (see reference).
4. **Bracket** answers if \(\mathrm{MA}_\text{eff}\) uncertain—e.g. ideal upper bound vs pessimistic friction lower bound.

## Output habit

- Show **formula**, **numbers**, and **units**.
- End with **uncertainty drivers** (lip, non-pulley biners, unknown capture state).

## Things this skill does not do

- Replace **gear strength ratings** selection—only compare orders of magnitude if the user supplies ratings.
- Specify **how many pieces** or **which knot** to use in the field.

## Additional resources

- [references/vector-estimation.md](references/vector-estimation.md)
