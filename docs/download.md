---
hide:
  - navigation
title: Download Mycelium
---

# Download

Mycelium runs inside **Grasshopper on Rhino 8** (Windows and macOS). It is free and open
source under [Apache 2.0](https://github.com/MyceliumGH-Dev/Mycelium/blob/dev/LICENSE).

<div align="center" markdown="1">
  [Open in Package Manager :material-package-variant:](rhino://package/search?name=Mycelium){ .md-button .md-button--primary aria-label="Open Mycelium in the Rhino Package Manager" }
  [All releases :material-github:](https://github.com/MyceliumGH-Dev/Mycelium/releases){ .md-button aria-label="Browse all Mycelium releases on GitHub" }
</div>

<p class="center-text" style="margin-top: 0.75rem;">
  <span class="faint">The Package Manager link opens Rhino directly. If nothing happens, Rhino is not
  running — start it and use the manual route below.</span>
</p>

---

## Current Version

<!-- RELEASE COUPLING: bump this line and the table row on every plugin release. -->

| | |
| --- | --- |
| **Latest stable** | [![Version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fyak.rhino3d.com%2Fpackages%2FMycelium&query=%24.version&label=&color=29473a)](https://rhinopackages.github.io/?search=Mycelium) |
| **Requires** | Rhino 8 |
| **License** | Apache-2.0 |
| **Package** | [`Mycelium` on the Rhino package server](https://rhinopackages.github.io/?search=Mycelium) |

The badge reads the live version straight from `yak.rhino3d.com`, so it is current even
if this page is not.

---

## Install via the Package Manager (recommended)

1. In Rhino 8, run the `_PackageManager` command.
2. Search for **mycelium**.
3. Click **Install**, then restart Rhino.
4. Open Grasshopper — the components appear under the **Mycelium** tab.

!!! note "Pre-release builds"

    Beta versions are published as `X.Y.Z-beta.W`. To see them, tick
    **Include pre-releases** in the Package Manager before searching.

---

## Manual Install

1. Download `Mycelium.gha` from the
   [latest release](https://github.com/MyceliumGH-Dev/Mycelium/releases).
2. **Unblock the file** — right-click → *Properties* → tick *Unblock* (Windows only).
   Grasshopper silently refuses to load blocked assemblies.
3. In Grasshopper, run `_GrasshopperFolders` → **Components** to open the libraries
   folder, and drop the `.gha` in there.
4. Restart Rhino.

---

## Templates

Example definitions are **not** bundled with the plugin. The **Mycelium Templates**
component downloads them on demand from the
[Mycelium-Templates](https://github.com/MyceliumGH-Dev/Mycelium-Templates) repository,
from the branch matching your installed plugin version, and caches them under:

```
%AppData%/Mycelium/Templates/GitHub
```

That means templates always match the plugin you have installed — no version drift
between a definition and the components it references.

---

## Build from Source

Requires the [.NET SDK](https://dotnet.microsoft.com/download) 8.0 or newer.

```bash
git clone https://github.com/MyceliumGH-Dev/Mycelium.git
cd Mycelium
dotnet build Mycelium.sln -c Release
# → src/Mycelium/bin/Release/net7.0-windows/Mycelium.gha
```

The project targets `net7.0-windows` and builds on Windows, macOS, and Linux
(`EnableWindowsTargeting`). Rhino 8 supplies the real .NET 7 assemblies at run time.
