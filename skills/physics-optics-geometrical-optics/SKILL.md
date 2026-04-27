---
name: physics-optics-geometrical-optics
description: >-
  Apply geometrical (ray) optics: light as rays in homogeneous media, reflection
  and refraction at interfaces, thin lenses and curved mirrors, paraxial /
  Gaussian optics, Snell's law, total internal reflection, Fermat's principle,
  and imaging (real vs virtual, magnification, sign conventions). Use whenever
  the user asks about ray tracing, lens or mirror systems, prisms, fiber optics
  from a TIR angle, optical path, eikonal picture at a high level, homework or
  engineering optics where wavelength is small compared to features, or
  "geometrical" vs physical optics. Also use when the problem mentions mirrors,
  lenses, focal length, object/image distances, Brewster's angle, gradient-index
  (GRIN) ray bending, or aberrations as geometrical effects—even if they do not
  say "geometrical optics." Do not use as the primary skill for diffraction
  gratings, interference, coherence, or polarization-heavy problems (point to
  physical optics instead); geometrical optics may still give qualitative
  intuition. Read references/geometrical-optics-wikipedia.md when formulas,
  conventions, or limits of validity need to be exact.
---

# Geometrical (ray) optics

## Role of this skill

Help the user reason and calculate using the **ray model**: paths of light that obey reflection and refraction at surfaces, and straight rays in uniform media. The bundled reference aligns with the structure and core results summarized from Wikipedia's *Geometrical optics* article (with attribution); use it when you need precise wording of limits, laws, or sign conventions.

## Limits of validity (say these when relevant)

- Geometrical optics is a **short-wavelength** approximation: features and apertures should be **large compared to λ** so diffraction and interference are secondary.
- It does **not** replace **physical optics** for interference, diffraction patterns, or full vector polarization treatment—name that gap and offer to combine qualitative ray pictures with wave concepts if the user needs both.

## How to work a problem

1. **Sketch the geometry** — interfaces, normals, object and observer, which medium is which (refractive indices \(n_1\), \(n_2\)).
2. **List assumptions** — e.g. paraxial (small angles), thin lens, specular reflection, monochromatic if dispersion is ignored.
3. **Apply the right law** — reflection (equal angles with the normal); Snell at a sharp interface; lens/mirror relations with an explicit **sign convention** (state the convention you use; many textbook errors come from mixing conventions).
4. **Classify images** — real (rays actually converge) vs virtual (extrapolated rays); upright vs inverted; magnification sign and magnitude.
5. **Sanity-check** — energy must allow the path (e.g. TIR when going from higher to lower \(n\) above critical angle); object inside focal length of a converging lens implies virtual image on the object side, etc.

## Where the details live

For **Snell's law**, **thin-lens and mirror formulas**, **TIR**, **Brewster's angle**, **paraxial / Gaussian optics**, **Fermat's principle**, and a short note on **eikonal / mathematical limit**, read:

- [references/geometrical-optics-wikipedia.md](references/geometrical-optics-wikipedia.md)

That file is the **starting reference** derived from [Geometrical optics (Wikipedia)](https://en.wikipedia.org/wiki/Geometrical_optics); prefer verifying edge cases against a textbook or course notes if the user's course uses a specific convention.

## Pedagogy and notation

- Use **clear diagrams** in markdown (ASCII or description) when it reduces ambiguity.
- Prefer **SI** and explicit **units** in numeric examples.
- When multiple conventions exist for **Cartesian sign** for lenses, pick one (e.g. "real is positive" object distance) and **stick to it** for the whole solution.

## External pointers (optional depth)

- [Feynman Lectures — Geometrical Optics](https://feynmanlectures.caltech.edu/I_27.html) for intuition.
- Wikipedia sibling topics: [Physical optics](https://en.wikipedia.org/wiki/Physical_optics), [Gaussian optics](https://en.wikipedia.org/wiki/Gaussian_optics), [Hamiltonian optics](https://en.wikipedia.org/wiki/Hamiltonian_optics).

## Downstream skills (this skill is their prerequisite)

- **`physics-optics-aberrations`** — lists this package as a **required** prerequisite for detecting and mitigating optical aberrations. After you establish paraxial rays, conventions, and where the ray model stops, load `physics-optics-aberrations` for Seidel-style symptoms, chromatic effects, Zernike framing, and mitigation tradeoffs.

## Things this skill does not do

- Replace a course's mandated sign convention—**ask or infer from context** and document your choice.
- Provide optical design software workflows (Zemax, Code V, etc.) unless the user asks; this skill is about **physics and hand / symbolic ray reasoning**.
