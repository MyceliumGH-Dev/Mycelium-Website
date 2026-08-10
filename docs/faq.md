---
title: FAQ
---

# FAQ

## Installation

??? question "Which Rhino versions are supported?"

    **Rhino 8 only.** Mycelium targets `net7.0-windows` and depends on the .NET 7
    assemblies Rhino 8 supplies at run time. Rhino 7 ships .NET Framework 4.8 and cannot
    load the plugin.

??? question "Does it work on macOS?"

    Yes. The plugin builds and runs on Rhino 8 for Mac as well as Windows. The
    `net7.0-windows` target framework moniker is a build-time artifact
    (`EnableWindowsTargeting`), not a runtime restriction.

??? question "I installed the `.gha` manually and Grasshopper does not show the tab."

    On Windows, right-click the downloaded `Mycelium.gha` → *Properties* → tick
    **Unblock**, then restart Rhino. Grasshopper silently refuses to load assemblies that
    Windows has marked as coming from the internet — no error appears, the components
    simply never register.

    Also confirm the file is in the folder that `_GrasshopperFolders` → **Components**
    opens, not a subfolder of it.

??? question "How do I get pre-release builds?"

    Tick **Include pre-releases** in the Rhino Package Manager before searching for
    *mycelium*. Betas are published as `X.Y.Z-beta.W`; stable releases as `X.Y.Z.W`.

## Templates

??? question "Where are the example definitions?"

    They are not bundled with the plugin. Drop a **Mycelium Templates** component on the
    canvas and click **Select Template** — it lists everything in the
    [Mycelium-Templates](https://github.com/MyceliumGH-Dev/Mycelium-Templates) repository
    and downloads what you pick on demand.

??? question "The template list is empty."

    The Templates component reads the branch of `Mycelium-Templates` named after your
    installed plugin version (e.g. `0.1.0.4`). If that branch has not been created yet,
    the list comes back empty. Report the version you are on in an
    [issue](https://github.com/MyceliumGH-Dev/Mycelium/issues) — the branch is created by
    CI on release and a gap means the sync did not run.

??? question "Where are downloaded templates cached?"

    ```
    %AppData%/Mycelium/Templates/GitHub
    ```

    Templates from external GitHub URLs you add through the **Directory** input are
    cached under `%AppData%/Mycelium/Templates/External/…`. Updating the template list
    clears the downloaded files first, so changed `.gh`/`.ghx` content is re-fetched.

??? question "Can I point it at my own template repository?"

    Yes. Feed a folder path or a GitHub tree URL into the component's **Directory**
    input. Your entries appear in the menu alongside the official ones.

## Generation

??? question "Are results reproducible?"

    Yes — that is the point. Every generated alternative is a pure function of its inputs
    and the **Seed**. The `CaseManifest` output records a deterministic SHA-256 case ID
    computed from the canonicalized boundary, the effective parameters, the seed, the
    plugin version, and the model units, so two runs that share an ID produced the same
    city.

??? question "What is the difference between the street-network families?"

    Right-click the Massing Generator → **Street Network**:

    | Family | Sub-options |
    | --- | --- |
    | Irregular Grid | `Recursive Orthogonal` (default), `Deformed Grid`, `Staggered Grid` |
    | Orthogonal Grid | `Regular Grid`, `Rectangular Grid`, `Cerdà Grid`, `Hierarchical Superblock` |
    | Diagonal Grid | `Single Axis`, `Cross Axes`, `Orthogonal Overlay` |
    | Radial–Concentric Grid | `Civic Core`, `Polygonal Radial`, `Fan Plan` |

    The selection is stored in the Grasshopper definition and shown beneath the
    component. You can also drive it from the `StreetNetwork` input by name (e.g.
    `"Orthogonal/Cerda"`, `"Fan Plan"`) — useful for batch sweeps. Names are case-,
    accent- and separator-insensitive.

??? question "What do `lambda_p` and `lambda_f` mean?"

    They are standard urban-morphology roughness parameters.
    `lambda_p` (plan area density) is the built plan area over the site area.
    `lambda_f` (frontal area density) is the building frontal area facing a given
    direction over the site area — which is why the component takes an optional
    `AnalysisDirection` vector. Both feed roughness parameterizations used in urban
    climate and wind studies.

??? question "Why does the height standard deviation come in two flavours?"

    `MorphologyMetrics` reports both unweighted and plan-area-weighted height moments.
    Roughness parameterizations expect the **weighted** ones — the unweighted mean gives a
    single small structure the same influence as a tower, which is rarely what you want.

??? question "Does the boundary curve have to be planar?"

    Yes — a closed, planar curve. The boundary is canonicalized before the case ID is
    computed; if canonicalization fails, the component raises a runtime warning and the
    resulting case ID no longer distinguishes between sites.

## Data & Research

??? question "How do I export a dataset of alternatives?"

    Wire the `MorphologyMetrics` and `CaseManifest` outputs to panels, then use a panel's
    **Stream Contents** command to write the JSON sidecar next to your geometry. The
    `dataset_export` template in
    [Mycelium-Templates](https://github.com/MyceliumGH-Dev/Mycelium-Templates) has this
    already wired up.

??? question "Is the case manifest format documented?"

    Yes — the JSON Schema is published at
    [`docs/case-manifest.schema.json`](https://github.com/MyceliumGH-Dev/Mycelium/blob/dev/docs/case-manifest.schema.json)
    and the manifest carries its own schema version field.

??? question "How should I cite Mycelium?"

    Use the repository's **Cite this repository** menu on
    [GitHub](https://github.com/MyceliumGH-Dev/Mycelium), which is populated from
    [`CITATION.cff`](https://github.com/MyceliumGH-Dev/Mycelium/blob/dev/CITATION.cff).
    Versioned archival DOIs are issued through the Zenodo–GitHub integration beginning
    with release `0.1.0.4`.

## Project

??? question "What license is Mycelium under?"

    [Apache-2.0](https://github.com/MyceliumGH-Dev/Mycelium/blob/dev/LICENSE). Free for
    commercial and academic use.

??? question "Where do I report a bug or request a feature?"

    [MyceliumGH-Dev/Mycelium/issues](https://github.com/MyceliumGH-Dev/Mycelium/issues).
    Include your Rhino build, the Mycelium version, and — if the problem is in generated
    geometry — the `CaseManifest` JSON, which pins down the exact inputs and seed.

??? question "Was this plugin called something else before?"

    Yes, *MetaForm*. It was renamed to Mycelium in `0.1.0.0`. All component GUIDs were
    kept, so definitions built against MetaForm still open.
