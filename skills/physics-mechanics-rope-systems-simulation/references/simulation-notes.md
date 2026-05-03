# Simulation notes: patterns and pitfalls

## Constraint types

- **Holonomic** (rope length fixed): \(f(q)=0\); differentiate for \(\dot f = 0\), \(\ddot f = 0\) for acceleration-level solvers.
- **Ideal pulley** couples tangential accelerations of contacting rope branches.

## Soft constraint alternative

Replace exact length with **high-stiffness spring** \(T = k \Delta L\) + damping \(b \dot{\Delta L}\):

- Easier with explicit integrators; risk of **stiffness-limited** \(\Delta t\).
- Tune \(k,b\) for **near-inextensible** behavior without blowing up the Jacobian.

## Progress capture

One-way friction is **non-smooth**; common approaches:

- **State machine**: captured vs sliding with different equations.
- **Regularization**: smooth approximation to sign(\(v\))—faster but can hide chatter.

## Anchors in code

Treat anchor as **kinematic** (fixed point) or **very large mass**; report forces as **constraint reactions** on the anchor node.

## Debugging order

1. Ideal topology, zero friction → match statics skill.
2. Add one friction source at a time.
3. Compare **effective MA** from simulation to hand calculation.
