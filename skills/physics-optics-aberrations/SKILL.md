---
name: physics-optics-aberrations
description: >-
  Detect, classify, and mitigate optical aberrations in lenses and mirror
  systems: monochromatic types (spherical aberration, coma, astigmatism, field
  curvature, distortion), chromatic aberration (longitudinal and lateral),
  defocus, and wavefront / Zernike framing for metrology. Use whenever the user
  mentions blur, color fringing, halos, coma tails, astigmatic line foci,
  curved focal "petzval" field, barrel or pincushion distortion, MTF or Strehl,
  star tests, collimation errors, stopping down vs diffraction, achromat vs
  apo, machine vision lens choice, wide-angle vs fast lens tradeoffs, or
  separating design aberrations from manufacturing defects—even if they do not
  say "aberration" by name. For paraxial baseline, ray diagrams, and thin-lens
  laws, always load the required prerequisite skill
  physics-optics-geometrical-optics first (see body). For telescope system
  tradeoffs (obstruction, collimation culture), physics-optics-telescope-builder
  may also apply. Do not use as the sole skill for full optical design software
  tutorials (Zemax/Code V clicks) or atmospheric tomography unless the user
  wants conceptual guidance; do not confuse aberrations with sensor read noise
  or JPEG compression unless they ask to disambiguate.
---

# Optical aberrations — detection and mitigation

## Prerequisite (required)

**`physics-optics-geometrical-optics` is a required prerequisite for this skill.** Read and apply it before you lean on paraxial reasoning, sign conventions, thin-lens or mirror imaging, or “what the ray model assumes.” Aberration work sits on top of that baseline; skipping it invites mixed conventions and wrong Seidel intuition.

Typical locations (same skill folder name on disk):

- This repository (authoritative clone on your machine):  
  `C:\Users\phili\git-repos-personal\skills\skills\physics-optics-geometrical-optics`
- Relative to the `skills/` collection in this repo:  
  `skills/physics-optics-geometrical-optics/`
- When installed for Cursor: e.g.  
  `~/.cursor/skills/physics-optics-geometrical-optics/`

Open that skill’s `SKILL.md` and, for exact formulas and validity limits, `references/geometrical-optics-wikipedia.md`.

**Related:** `physics-optics-telescope-builder` when the system is a **visual/astro telescope** and the question mixes aberrations with aperture, eyepieces, or Dobsonian practice.

## Core idea (why detection matters)

Aberration is a **departure from the ideal imaging model** (paraxial / collinear optics): light from one object point does not converge to a single image point the way first-order theory suggests. Many effects arise from **geometry and dispersion**, not necessarily from “bad polishing”—yet **misalignment**, **defocus**, and **figure error** can look similar in a snapshot. Your job is to **separate symptoms**, name the likely **mode**, and propose **mitigations** at the right layer (stop, spectrum, element count, symmetry, software correction, or alignment).

## Symptom → hypothesis (start here)

Use this as a **hypothesis ladder**, not a blind diagnosis without context (wavelength band, f-number, field angle, sensor size).

| What the user describes | Often implicates | First checks |
|-------------------------|------------------|--------------|
| On-axis blur worsens at full aperture; improves when stopped down | **Spherical aberration**, zones | Stop down slightly; note diffraction limit tradeoff |
| Off-axis “comet” flare pointed toward/away from axis | **Coma** | Symmetry about stop; field angle; lens ordering |
| Tangential vs sagittal focus split; directional blur on stars | **Astigmatism** | Field angle; double-Gauss symmetry ideas |
| Sharp center, curved “shell” of best focus | **Field curvature** | Flat sensor vs curved image surface |
| Straight lines bow inward/outward | **Distortion** | Software lens profiles; symmetrical stop designs |
| Purple/green fringes on high-contrast edges | **Chromatic** (often lateral CA visible on axis edges) | Narrowband LED or filter; achromat/doublet vs APO |
| White-light focus never “clean” on fine pixels | **Chromatic focal shift** | Achro (two-color balance) vs apo (three-color); monochrome source |

Read the bundled references when you need **definitions aligned with Wikipedia** or **imaging / machine-vision mitigation patterns** from Edmund.

## Mitigation playbook (conceptual)

1. **Reduce the offending lever** — e.g. lower field angle (crop), slower beam (**higher f/#**), smaller sensor diagonal for a given lens.
2. **Optical correction** — extra elements, **achromatic / apochromatic** glass combinations, **aspheres**, **symmetric** forms around the stop (trade: size, cost, back focal length).
3. **Spectral** — **monochrome** illumination removes chromatic classes entirely for many machine-vision checks.
4. **Software** — **distortion / lateral color** maps for calibrated setups; not a substitute for missing resolution from defocus + diffraction.
5. **Alignment** — tilt/decenter mimics coma/astigmatism; distinguish from intrinsic design residuals.

Always mention **diffraction**: stopping the iris helps geometric aberrations until the **Airy** limit dominates (Edmund article ties this explicitly).

## Where details live

| File | Use when |
|------|-----------|
| [references/optical-aberration-wikipedia.md](references/optical-aberration-wikipedia.md) | Seidel / third-order taxonomy, chromatic classes, Zernike overview, “practical elimination” limits |
| [references/machine-vision-aberrations-edmund-summary.md](references/machine-vision-aberrations-edmund-summary.md) | Fast lens / small pixel interactions, spherical vs field effects, chromatic focal shift curves (achro vs apo), MTF / spot size hooks |

## Default answer shape

1. **Likely aberration modes** (ranked) with **why**
2. **One optical lever** and **one operational lever** to try
3. **What would falsify** the hypothesis (e.g. if stopping down does not help, suspect defocus or alignment)
4. Point to **measurement** when stakes are high (interferometry, MTF bench, structured target)

## Things this skill does not do

- Replace **vendor datasheets** or **calibrated** lens metrology.
- Guarantee numbers without **glass model**, **prescription**, and **wavelengths**.
