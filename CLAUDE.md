# CLAUDE.md

Marketing/landing site for Mycelium (MkDocs Material). Primary deployment is Netlify at
https://mycelium-gh.netlify.app; `deploy.yml` also publishes a `gh-pages` mirror from
`main`. Component documentation is a **separate** repo: `MyceliumGH-Dev/Mycelium-Docs`.

## Branch model — read before pushing

- **`dev` is the working branch**: land all changes here directly.
- **`main` is the published branch**: nothing on `dev` reaches the live site until a
  `dev → main` PR is merged.
- Publishing flow: push `dev` → `gh pr create --base main --head dev` →
  `gh pr merge --merge`.
- `prevent-main-into-dev.yml` guards the reverse direction — never merge `main` into
  `dev`.

## Release coupling

On every Mycelium plugin release (`MyceliumGH-Dev/Mycelium`, `manifest.yml` version):

- `docs/download.md`: the current-version table row. The version badge itself is live
  from `yak.rhino3d.com` and needs no edit.
- `docs/versions.md`: bump the top marker line and **add** a
  `### X.Y.Z.W (Month D, YYYY)` changelog entry above the previous one (body from the
  matching section of the plugin repo's `CHANGELOG.md`); keep old entries.
- Then the `dev → main` PR — the release is not done until it merges and the deploy runs.

## Conventions

- Palette lives in `docs/stylesheets/extra.css`; `mkdocs.yml` declares
  `primary: custom` / `accent: custom` so Material reads those variables. Colors come
  from the plugin logo (`#29473A` deep green, `#F1EDE1` cream).
- Images are copied from the plugin repo's `docs/images/`. Re-copy rather than editing
  in place so the two stay in sync.
- `git-revision-date-localized` and `git-authors` need full history — CI checks out with
  `fetch-depth: 0`.
