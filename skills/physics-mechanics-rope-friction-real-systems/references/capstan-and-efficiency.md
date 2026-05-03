# Capstan, efficiency, and effective MA

## Capstan / Euler–Eytelwein

Assumptions often stated in textbooks: flexible rope, **constant \(\mu\)**, circular contact, **continuous** contact angle \(\theta\) in radians, neglect rope bending stiffness.

\[
\frac{T_\text{tight}}{T_\text{slack}} = e^{\mu\theta}
\]

**Slip direction** picks which side is larger; if unsure, compute both possibilities and reject the physically impossible one for the given load haul direction.

**Limits:** dirty rope, ice, oval carabiners, and small contact patches break the ideal; use **measured** ratios when available.

## Per-bend efficiency \(\eta\)

If tension drops across a device by factor \(\eta\):

\[
T_\text{out} = \eta\, T_\text{in}
\]

(directional: define consistently with motion). For \(n\) independent bends in series (rough approximation):

\[
T_\text{final} \approx T_\text{start} \prod_i \eta_i
\]

or multiply capstan factors \(e^{\mu_i\theta_i}\) where appropriate—**do not double-count** the same contact.

## Theoretical vs effective MA

- **Theoretical** \(\mathrm{MA}_\text{ideal}\): from rope length / supporting strands (ideal statics).
- **Effective** \(\mathrm{MA}_\text{eff}\): output force ÷ input force (or inverse velocity ratio) **including** losses.

Report \(\mathrm{MA}_\text{eff} / \mathrm{MA}_\text{ideal}\) as **system efficiency** when helpful.

## Piecewise phases

Progress capture, slipping prusiks, or resetting a haul can be modeled as **different static graphs** per phase; state **which phase** the equations describe.
