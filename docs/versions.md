---
title: Versions
hide:
  # Nav tree off, TOC kept — it is the only practical way to jump between releases.
  - navigation
---

0.1.0.4 (Aug. 2, 2026)

!!! Compatibility

    Requires [**Rhino 8**](https://www.rhino3d.com/download/). Mycelium targets
    `net7.0-windows` and relies on the .NET 7 assemblies Rhino 8 supplies at run time —
    it does not load in Rhino 7.

<!-- RELEASE COUPLING: bump the marker line above and add a new `### X.Y.Z.W (Month D, YYYY)`
     section below on every plugin release. Body comes from the matching CHANGELOG.md
     section in MyceliumGH-Dev/Mycelium. Keep older entries. -->

Release notes are mirrored from
[`CHANGELOG.md`](https://github.com/MyceliumGH-Dev/Mycelium/blob/dev/CHANGELOG.md) in the
plugin repository, which follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## Known Issues

[MyceliumGH-Dev Issues — GitHub](https://github.com/MyceliumGH-Dev/Mycelium/issues)

## Changelog

### 0.1.0.4 (Aug. 2, 2026)

**Added**

- Urban morphology indicators from the Massing Generator: plan area density (`lambda_p`),
  open-space and park ratios, direction-dependent gross frontal area density
  (`lambda_f`), and building-height mean, standard deviation, minimum, median, 90th
  percentile, and maximum.
- Optional `AnalysisDirection` input for directional frontal-area calculations. The
  vector is normalized in the XY plane and falls back to world X when it is zero or
  vertical.
- Schema-versioned `CaseManifest` JSON output containing a deterministic SHA-256 case ID,
  random seed, installed plugin version, model units, network family and subtype,
  effective generator inputs, geometry counts, development metrics, and morphology
  metrics.
- Published JSON Schema for the case manifest at `docs/case-manifest.schema.json`.
- `CITATION.cff` metadata for GitHub and Zenodo software citations.
- Dataset-export example in Mycelium-Templates, with morphology metrics and JSON manifest
  outputs wired to panels for inspection and file streaming.

**Changed**

- Mycelium Templates now fetches version-matched examples from
  `MyceliumGH-Dev/Mycelium-Templates` after the repository transfer.

### 0.1.0.3 (Aug. 1, 2026)

**Added**

- Radial–Concentric Grid subtypes in the Massing Generator: full circular `Civic Core`,
  straight-sided `Polygonal Radial`, and a one-sided `Fan Plan` with a less-permeable
  rear sector.
- Diagonal Grid subtypes: `Single Axis`, intersecting `Cross Axes`, and an
  `Orthogonal Overlay` that cuts a wider diagonal boulevard through a regular grid.
- Irregular Grid subtypes: the backwards-compatible `Recursive Orthogonal`, seeded
  `Deformed Grid`, and offset-row `Staggered Grid` with T-junctions.
- Orthogonal Grid subtypes in the nested right-click menu: `Regular Grid`, elongated
  `Rectangular Grid`, chamfered `Cerdà Grid`, and `Hierarchical Superblock` with wider
  primary streets around 3×3 groups of local blocks.
- Right-click street-network selector on the Massing Generator. The selection is saved
  with the Grasshopper definition.
- Every published version now gets a git tag and a GitHub Release, cut by CI *after* Yak
  accepts the push, with the changelog section as its notes and both `.yak` distributions
  attached.
- Re-release guard in the packaging workflow — a publish fails if the version's tag
  already exists on a different commit.

**Changed**

- Radial–Concentric Grid now terminates its spokes at a finite central civic block and
  surrounding ring street, avoiding needle-shaped parcels at the center.
- GitHub Actions pinned to full commit SHAs instead of floating `@v4` tags.

**Fixed**

- Updating Mycelium Templates now clears downloaded template files before synchronizing,
  so changed `.gh`/`.ghx` content is fetched automatically.

### 0.1.0.2 (Jul. 30, 2026)

**Changed**

- Redrawn component icon set: all eleven 24×24 PNGs replaced with an isometric set built
  from a shared engine. File names and `ComponentIcons.Get` keys are unchanged.
- Plugin logo redrawn from the new assembly mark.

**Added**

- `design/icons/` — the vector source the PNGs come from: per-glyph SVGs, a `<symbol>`
  sprite sheet, the `myc-vec.js` generator, and `manifest.csv`.
- `Mycelium Icon Spec.dc.html` — contact sheet for reviewing the set.

### 0.1.0.1 (Jul. 9, 2026)

**Changed**

- Yak package name capitalized `mycelium` → `Mycelium`.
- Template component now syncs from a branch matching the running assembly version (was
  hardcoded to `main`); `quick_start.ghx` moved out of the plugin into
  [Mycelium-Templates](https://github.com/MyceliumGH-Dev/Mycelium-Templates).

**Removed**

- GitHub Release / Pre-Release workflows. Yak remains the only distribution channel.

### 0.1.0.0 (Jul. 8, 2026)

First release under the **Mycelium** name (previously *MetaForm*). Existing Grasshopper
files keep working — all component GUIDs are unchanged.

**Added**

- Yak packaging and GitHub Actions CI.
- New logo and a complete 24×24 icon set; the Terrain Generator finally has an icon.
- Trees can now actually be generated inside courtyards (the Tree Config
  `GenerateInCourtyards` flag was previously parsed but ignored).
- `CHANGELOG.md`, `.editorconfig`, and a comprehensive `.gitignore`.

**Changed**

- Plugin renamed MetaForm → Mycelium; Grasshopper tab is now **Mycelium** with panels
  *Massing*, *Building Types*, *Vegetation*, *Site*, and *Utilities*.
- Retargeted from .NET Framework 4.8 / Rhino 7 to .NET 7 / Rhino 8.
- Repository restructured: plugin source under `src/Mycelium/`.
- Component config wire format now serializes culture-invariantly, fixing broken configs
  on systems with comma decimal separators.

**Fixed**

- Assembly info GUID no longer collides with the Massing Generator component GUID.
- Config component base class no longer returns a fresh random `ComponentGuid` on every
  call.
- Template component folder labels now use platform path separators (was Windows-only).

## Rhino Downloads

| Version | Link |
| --- | --- |
| Rhino 8 (current) | [rhino3d.com/download](https://www.rhino3d.com/download/) |
| Specific Rhino 8 builds | [rhinoversions.github.io](https://rhinoversions.github.io/) |
