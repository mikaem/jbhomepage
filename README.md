# Homepage Mikael Mortensen

Source for the homepage of Professor Mikael Mortensen, built with
[Jupyter Book 2](https://jupyterbook.org) (powered by [mystmd](https://mystmd.org)).

The book is configured entirely in [`myst.yml`](myst.yml) — the Jupyter Book 1
files `_config.yml` and `_toc.yml` are no longer used.

## Setup

Python dependencies are managed with [uv](https://docs.astral.sh/uv):

```sh
uv sync
```

Jupyter Book 2 also needs Node.js. If `node` is not on your `PATH`, the first
`jupyter book` command offers to install a private copy for you; set
`JB_ALLOW_NODEENV=1` to accept without being prompted.

## Building

```sh
make serve    # live-reloading preview on http://localhost:3000
make html     # static site in _build/html
make clean    # remove build artifacts
```

Or without `make`:

```sh
uv run jupyter book start
uv run jupyter book build --html
```

## Publishing

```sh
make ghpages  # build with BASE_URL=/jbhomepage and push to the gh-pages branch
make commit   # build and copy into ../mikaem.github.io
```

## Content

All pages live under [`content/`](content) as MyST Markdown and are listed in
the `project.toc` section of `myst.yml`. Citations use `{cite}` roles resolved
against [`references.bib`](references.bib).
