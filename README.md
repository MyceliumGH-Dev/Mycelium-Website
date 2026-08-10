# Mycelium-Website

Marketing/landing site for [Mycelium](https://github.com/MyceliumGH-Dev/Mycelium), built
with [MkDocs](https://www.mkdocs.org/) and
[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

## Deployments

| Target | URL | Trigger |
| --- | --- | --- |
| Netlify (primary) | https://mycelium-gh.netlify.app | push to `main` |
| GitHub Pages (mirror) | https://myceliumgh-dev.github.io/Mycelium-Website/ | `deploy.yml` on push to `main` |

Component documentation lives in a separate repository:
[Mycelium-Docs](https://github.com/MyceliumGH-Dev/Mycelium-Docs).

## Branch model

- **`dev` is the working branch** — land changes here.
- **`main` is the published branch** — nothing reaches the live site until a `dev → main`
  PR is merged.
- `prevent-main-into-dev.yml` guards the reverse direction; never merge `main` into `dev`.

```bash
git push origin dev
gh pr create --base main --head dev
gh pr merge --merge
```

## Local development

```bash
pip install -r requirements.txt
mkdocs serve
```

Or with Docker (no local Python needed), serving on <http://localhost:8080>:

```bash
./serve-docker.sh
```

## Release coupling

On every Mycelium plugin release:

- `docs/download.md` — current-version row in the table.
- `docs/versions.md` — bump the top marker line and **add** a
  `### X.Y.Z.W (Month D, YYYY)` section above the previous one, body taken from the
  matching `CHANGELOG.md` section in the plugin repo. Keep older entries.
- Then open the `dev → main` PR — the release is not done until it merges.
