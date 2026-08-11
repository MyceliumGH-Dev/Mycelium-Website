---
hide:
  - navigation
  - toc
---

<figure class="hero-logo" markdown="span">
  ![Mycelium](assets/cd/logo.svg){ width="180" .skip-lightbox .hero-logo__image }
</figure>

# Mycelium {.hero-title}

<p class="hero-tagline">
  Generative urban massing for Rhino&nbsp;8 and Grasshopper
</p>

![Sample massing outputs](assets/images/samples.gif){ .skip-lightbox .center }

<div align="center" markdown="1">
  [Get Started :material-arrow-right:](https://mycelium-gh-docs.netlify.app){ .md-button .md-button--primary aria-label="Get started with the Mycelium documentation" }
  [Download :material-download:](download.md){ .md-button aria-label="Download Mycelium" }
</div>

<p class="center-text" style="margin-top: 0.75rem;">
  Free and open source under
  <a href="https://github.com/MyceliumGH-Dev/Mycelium/blob/dev/LICENSE" aria-label="Read the Apache 2.0 license">Apache&nbsp;2.0</a>.
  Installs through the Rhino Package Manager.
</p>

---

## :seedling:{ aria-hidden="true" } What It Does

Mycelium takes a **closed parcel boundary curve** and generates complete urban massing
alternatives. Every output is driven by a random seed, so alternatives are fully
reproducible — the same seed and the same parameters always give you the same city.

<div class="grid cards cards--four" markdown>

-   __:material-grid: Subdivision__

    ---

    Recursive binary space partitioning splits the parcel into building blocks separated
    by streets. Choose between irregular, orthogonal, diagonal, and radial–concentric
    street-network families — each with several sub-options.

-   __:material-office-building: Typologies__

    ---

    Each block receives a randomly selected building type from the configurations you
    allow: courtyard (perimeter block), linear bar, point block, L-shape, U-shape, or
    tall tower.

-   __:material-tree: Open Space__

    ---

    A chosen number of blocks become parks, populated with procedural trees. Courtyards
    can receive trees too, and terrain is generated from OpenSimplex noise.

-   __:material-chart-box: Metrics &amp; Provenance__

    ---

    Development metrics, environmental morphology indicators (`lambda_p`, `lambda_f`,
    height statistics), and a versioned JSON case manifest with a deterministic SHA-256
    case ID for every alternative.

</div>

---

## :rocket:{ aria-hidden="true" } Get Started

Install from the Rhino&nbsp;8 Package Manager, then open a template — the **Mycelium
Templates** component pulls working example definitions matching your installed version,
so the first thing you see is a graph that already runs.

<div align="center" markdown="1">
  [Download :material-download:](download.md){ .md-button .md-button--primary aria-label="Download Mycelium" }
  [First Steps :material-arrow-right:](https://mycelium-gh-docs.netlify.app/first_steps/){ .md-button aria-label="Read the first steps guide" }
</div>

---

## :busts_in_silhouette:{ aria-hidden="true" } Authors

<div class="mdx-users" markdown>

<div class="mdx-users__testimonial" markdown>
**Dr. İlker Karadağ**<br>
<span class="faint">Associate Professor of Architecture<br>Sakarya University</span><br>
[@karadagi](https://github.com/karadagi)
</div>

<div class="mdx-users__testimonial" markdown>
**Dr. Patrick Kastner**<br>
<span class="faint">Assistant Professor, School of Architecture<br>Georgia Institute of Technology</span><br>
[@kastnerp](https://github.com/kastnerp)
</div>

</div>

<p class="center-text" style="margin-top: 1.5rem;">
  Developed at the
  <a href="https://github.com/SustainableUrbanSystemsLab">Sustainable Urban Systems Lab</a>,
  Georgia Tech School of Architecture.
</p>

---

## :books:{ aria-hidden="true" } Citation

If you use Mycelium in research, please cite the software release:

```bibtex
@software{karadag_mycelium,
  author  = {Karadag, Ilker and Kastner, Patrick},
  title   = {{Mycelium: Procedural Urban Morphology Generation for Rhino and Grasshopper}},
  year    = {2026},
  version = {0.1.0.4},
  license = {Apache-2.0},
  url     = {https://github.com/MyceliumGH-Dev/Mycelium}
}
```

Releases from `0.1.0.4` onward are archived on Zenodo with a versioned DOI. GitHub also
generates an up-to-date APA or BibTeX string from the repository's
[`CITATION.cff`](https://github.com/MyceliumGH-Dev/Mycelium/blob/dev/CITATION.cff) — open
the repo and use **Cite this repository** in the right-hand sidebar.
