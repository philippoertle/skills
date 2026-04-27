# Optical aberration — reference notes

**Basis:** Summarized from [Optical aberration](https://en.wikipedia.org/wiki/Optical_aberration) on Wikipedia ([CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)); open the live article for equations, history, and citations.

---

## Table of contents

1. [Definition and classes](#definition-and-classes)
2. [Monochromatic aberrations at third order](#monochromatic-aberrations-at-third-order)
3. [Chromatic aberration](#chromatic-aberration)
4. [Zernike picture (wavefront)](#zernike-picture-wavefront)
5. [Practical elimination and compromises](#practical-elimination-and-compromises)

---

## Definition and classes

An optical system exhibits **aberration** when the image is not a faithful reproduction of the object: blur, shape error, or **color fringing**. In the classical picture, aberration is a departure from **paraxial optics** predictions—even for **perfectly fabricated** surfaces, because paraxial theory is incomplete for finite aperture and field.

Two broad classes:

- **Monochromatic** — from **geometry** of surfaces and paths; present even with single-wavelength light.
- **Chromatic** — from **dispersion** (\(n(\lambda)\)); different wavelengths focus or magnify differently.

**Defocus** is often treated separately from “intrinsic” aberration because axial refocus can cancel it—but in real systems defocus is a dominant practical error.

**Piston** and **tilt** shift the image or wavefront reference; tilt especially is often grouped with alignment rather than “high-order aberration” in conversation, though Zernike lists include them.

---

## Monochromatic aberrations at third order

Common third-order families (names vary by textbook):

1. **Spherical aberration** — axial point; zones at different heights focus at different axial positions; **disk of least confusion** between extreme foci.
2. **Coma** — off-axis, **wide** pencil; comet-like flare asymmetry in the meridional section.
3. **Astigmatism** — off-axis, **narrow** pencil; **tangential** vs **sagittal** focal lines and a **circle of least confusion** between them; grows with field angle.
4. **Field curvature (Petzval)** — even if astigmatism is controlled, the **best-focus surface** may be curved vs a flat detector.
5. **Distortion** — magnification varies with field; **barrel** vs **pincushion** vs more general deformation.

Design landmarks (names only; see Wikipedia for conditions):

- **Aplanatic** — control of spherical aberration and **sine condition** (related to coma for finite conjugates).
- **Anastigmatic / stigmatic** — astigmatic surfaces brought together in useful regimes.
- **Orthoscopic / rectilinear** — low **geometric distortion** for straight-line subjects.

**Petzval sum** appears in flat-field discussions for third-order field curvature control.

---

## Chromatic aberration

Types commonly listed:

- **Axial (longitudinal) chromatic** — focal position moves with wavelength.
- **Lateral (transverse) chromatic** — magnification changes with wavelength (visible as colored edges on high-contrast boundaries).

**Achromatism** aims to bring two wavelengths to a common focus (or otherwise balance chromatic errors); **apo** designs push further (three or more wavelengths in many microscope objectives).

---

## Zernike picture (wavefront)

Real pupils carry a **wavefront error** vs a reference sphere. **Zernike polynomials** on the unit disk give an **orthogonal basis** for low-order modes (piston, tilt, defocus, astigmatism, coma, spherical, …). Coefficients help **decompose** measured aberrations for adaptive optics, interferometry, and ophthalmology.

**Limit:** very steep or high–spatial-frequency structure (e.g. strong turbulence) may need bases beyond low-order Zernikes.

---

## Practical elimination and compromises

Classical theory notes: **perfect** imaging of **two** arbitrary planes through a **finite** aperture is generally **impossible**; real systems **compromise** by prioritizing:

- **Large aperture / on-axis** systems (microscope objectives) — emphasize axis and sine condition; field is secondary.
- **Wide angle** — emphasize astigmatism, field curvature, distortion; aperture errors secondary.
- **Normal** lenses — balanced trade.

Mitigations include **stops**, **additional elements**, **glass choice**, **aspheres**, and **inverse ray-tracing optimization** in modern design software. Atmospheric paths add **seeing**; **adaptive optics** and **guide stars** address turbulence, not glass Seidel terms.

---

## See also (Wikipedia)

- [Spherical aberration](https://en.wikipedia.org/wiki/Spherical_aberration), [Coma (optics)](https://en.wikipedia.org/wiki/Coma_(optics)), [Astigmatism (optics)](https://en.wikipedia.org/wiki/Astigmatism_(optics))
- [Chromatic aberration](https://en.wikipedia.org/wiki/Chromatic_aberration), [Zernike polynomials](https://en.wikipedia.org/wiki/Zernike_polynomials)
