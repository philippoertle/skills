# Geometrical optics — reference notes

**Source basis:** Concepts and structure summarized from [Geometrical optics](https://en.wikipedia.org/wiki/Geometrical_optics) on Wikipedia ([CC BY-SA](https://en.wikipedia.org/wiki/Wikipedia:Text_of_the_Creative_Commons_Attribution-ShareAlike_4.0_International_License)); verify against the live article or a textbook for your course's sign rules.

---

## Table of contents

1. [Ray model and assumptions](#ray-model-and-assumptions)
2. [Rays, wavefronts, Fermat](#rays-wavefronts-fermat)
3. [Paraxial approximation](#paraxial-approximation)
4. [Reflection](#reflection)
5. [Refraction and Snell law](#refraction-and-snell-law)
6. [Total internal reflection and Brewster angle](#total-internal-reflection-and-brewster-angle)
7. [Prisms, dispersion, GRIN](#prisms-dispersion-grin)
8. [Thin lenses](#thin-lenses)
9. [Limits vs physical optics; mathematics (brief)](#limits-vs-physical-optics-mathematics-brief)

---

## Ray model and assumptions

**Geometrical (ray) optics** describes propagation using **rays** as an abstraction for paths along which light travels when:

- Rays are **straight** in a **homogeneous** medium.
- Rays **bend** (and may split) at **interfaces** between dissimilar media.
- Rays can follow **curved** paths when the **refractive index** varies continuously (**gradient-index** media).
- Rays may be **reflected** or **absorbed**.

It does **not** inherently treat **diffraction** and **interference**; those belong to **physical optics**. The ray model is an excellent approximation when **wavelength is small** compared to interacting structures (imaging, many lens/mirror systems).

---

## Rays, wavefronts, Fermat

A **light ray** is (idealized as) a line or curve **perpendicular to wavefronts** (aligned with the **wave vector** in isotropic media).

**Fermat's principle:** The path taken by a ray between two points is such that travel time is **stationary** (often stated informally as "least time" in simple cases).

---

## Paraxial approximation

The **paraxial** (small-angle) approximation linearizes behavior so that optical systems can be described with **matrices** (**Gaussian optics**, paraxial **ray tracing**)—useful for approximate object/image positions and magnifications.

---

## Reflection

For **specular** surfaces, the **incident** and **reflected** rays lie in one plane with the **surface normal**; angles with the normal are equal (**law of reflection**).

- **Plane mirror:** image distance behind mirror equals object distance in front; same size; **left–right** parity inversion; magnification magnitude 1.
- **Curved mirrors:** trace rays with the law of reflection at each surface point; **parabolic** mirrors can send parallel rays to a common **focus**; **spherical** mirrors show **spherical aberration**. Images may be real or virtual, upright or inverted, magnified or demagnified.

---

## Refraction and Snell law

At a planar interface between uniform media with indices \(n_1\) and \(n_2\), with angles \(\theta_1\), \(\theta_2\) measured from the **normal**:

\[
n_1 \sin\theta_1 = n_2 \sin\theta_2
\]

(Speed relation: index relates to phase velocity in the medium; Snell encodes bending toward the normal when entering a **higher** \(n\) if you track the geometry carefully.)

---

## Total internal reflection and Brewster angle

- **Total internal reflection (TIR):** When traveling from higher to lower index, beyond a **critical angle** there is **no transmitted** ray; all power is reflected (basis for **fiber optics** guiding).

- **Brewster's angle:** At a particular angle of incidence, reflected and refracted rays can be **perpendicular**, giving **linearly polarized** reflection (polarization is a wave property; the angle itself is a geometrical-optics construction).

---

## Prisms, dispersion, GRIN

- **Prisms:** Snell at two inclined faces deflects rays; **dispersion** arises because \(n\) varies with wavelength.
- **Gradient-index (GRIN):** If \(n\) varies smoothly with position, rays **curve** (e.g. mirage-like bending in hot air).

---

## Thin lenses

A **lens** refracts to produce converging or diverging bundles.

**Thin-lens equation** (one common form; **signs depend on convention**):

\[
\frac{1}{S_1} + \frac{1}{S_2} = \frac{1}{f}
\]

Here \(S_1\) is object distance, \(S_2\) image distance, \(f\) focal length (negative for diverging lenses in many sign systems). **Always state** your convention for which sides of the lens get positive vs negative distances.

**Magnification** (one common form involving \(S_1\), \(S_2\); signs encode inversion):

\[
M = -\frac{S_2}{S_1}
\]

(Equivalent forms appear with different naming; match the user's textbook.)

**Lensmaker's equation** relates \(f\) to radii of curvature and indices for thin lenses (see standard optics texts).

**Aberrations:** Geometrical departures from ideal imaging; **chromatic aberration** comes from **wavelength-dependent** \(n\).

---

## Limits vs physical optics; mathematics (brief)

In the **short-wavelength limit**, wave solutions can be approximated by a rapidly varying phase and slowly varying amplitude; the leading **eikonal** picture yields ray paths. Rigorous connections go through asymptotics (e.g. Sommerfeld–Runge) or **discontinuity** analysis of Maxwell fields (Luneburg); full treatment uses PDE / microlocal tools—only invoke when the user asks for **theory**, not for routine ray homework.

**See also (Wikipedia):** [Physical optics](https://en.wikipedia.org/wiki/Physical_optics), [Hamiltonian optics](https://en.wikipedia.org/wiki/Hamiltonian_optics), [Geometrical acoustics](https://en.wikipedia.org/wiki/Geometrical_acoustics).

---

## Suggested textbooks (from Wikipedia article references)

Greivenkamp — *Field Guide to Geometrical Optics*; Hecht — *Optics*; Born & Wolf — *Principles of Optics*; undergraduate texts such as Young & Freedman for chapter-level problems.
