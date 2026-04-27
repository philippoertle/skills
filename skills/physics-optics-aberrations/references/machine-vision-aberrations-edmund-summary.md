# How aberrations affect imaging lenses — concept summary

**Source basis:** Summarized from Edmund Optics application note *Aberrations* (Section 3.5, Imaging Resource Guide) by Gregory Hollows and Nicholas James:  
https://www.edmundoptics.com/knowledge-center/application-notes/imaging/how-aberrations-affect-machine-vision-lenses/  
Copyright Edmund Optics; verify claims and product links on the **live** page.

---

## Table of contents

1. [Aberration vs manufacturing defect](#aberration-vs-manufacturing-defect)
2. [Spherical aberration](#spherical-aberration)
3. [Astigmatism and coma (off-axis)](#astigmatism-and-coma-off-axis)
4. [Field curvature](#field-curvature)
5. [Chromatic aberration and focal shift](#chromatic-aberration-and-focal-shift)
6. [Competing corrections and costs](#competing-corrections-and-costs)

---

## Aberration vs manufacturing defect

The article stresses: classical **aberrations** are **inherent** to refractive/reflection physics at finite aperture and field—**not** explained solely by polishing or assembly flaws. They still alter **MTF**, **spot size**, **telecentricity**, **depth of field**, etc. In practice, **defocus**, **tilt**, and **decenter** are often dominant “errors” that **mimic** or **add to** design residuals—keep both buckets in mind.

---

## Spherical aberration

**Parallel** rays at increasing **height** on a spherical lens meet the surface at **steeper incidence** and refract more; marginal rays can focus **short** of paraxial focus (typical under-correction case for a simple positive lens).

- Worse at **small f/#** (large aperture angles).
- **Mitigation:** stop down the iris (trade: **diffraction** grows—see Edmund’s *Airy disk* note); add **elements**, **high-index** glasses, or **aspheric** correction for fast designs (trade: size, weight, cost).

---

## Astigmatism and coma (off-axis)

Off-axis bundles lose **rotational symmetry** vs the axis: **tangential** and **sagittal** foci separate (**astigmatism**). With a **wide** pencil, asymmetric flare appears (**coma**); the article’s simplified exposition groups intuition for field-driven effects.

**Mitigation themes:** designs **symmetric** about the aperture (e.g. double-Gauss family) to balance aberrations; keep incidence angles lower (often more glass / higher index). Symmetry can **forbid** some telephoto / reverse-telephoto shortcuts—mechanical length and **back focal length** tradeoffs follow.

---

## Field curvature

The **Petzval**-related picture: the **locus of best focus** can be **curved** while the sensor is **flat**, so off-field points look soft even if on-axis is good. Designers add **negative power** correction, often near the image, lengthening the assembly and affecting **back focal length**.

---

## Chromatic aberration and focal shift

Dispersion makes **\(n(\lambda)\)** vary → **focal length** varies with color.

- **Achromatic doublet** balances two wavelengths on one plane; a **chromatic focal shift** plot vs wavelength shows only **two** crossings at a chosen sensor plane—other colors remain slightly defocused.
- **Apochromatic** designs target **three** wavelengths co-focused for better broadband balance on small pixels; typically **more elements**, **exotic glasses**, **narrower** working ranges and **higher cost**.

**Practical lever:** **monochrome** LEDs (e.g. narrowband inspection) remove chromatic classes for many machine-vision tasks at large savings.

---

## Competing corrections and costs

The article highlights tension: **high index** and extra surfaces help **spherical / astigmatic** angles but fight **chromatic** goals if glass choice is wrong; strong color correction may push **cost** and **manufacturing** difficulty. Fast, wide-field, broadband, small-pixel, and cheap—pick a subset.

**Related Edmund links** (from the article footer):

- [The Airy Disk and Diffraction Limit](https://www.edmundoptics.com/knowledge-center/application-notes/imaging/limitations-on-resolution-and-contrast-the-airy-disk/)
- [Depth of Field and Depth of Focus](https://www.edmundoptics.com/knowledge-center/application-notes/imaging/depth-of-field-and-depth-of-focus/)
