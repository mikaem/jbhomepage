.PHONY: help install html serve start clean cleanall ghpages commit tomd toipynb

# The book is built with Jupyter Book 2 (https://jupyterbook.org), which is
# powered by mystmd. All configuration lives in myst.yml.
# Python dependencies are managed with uv (https://docs.astral.sh/uv).

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  install     to create the .venv and install dependencies with uv"
	@echo "  html        to build the static site into _build/html"
	@echo "  serve       to serve the site locally with live reload"
	@echo "  clean       to clean out site build files"
	@echo "  cleanall    to also clean caches and downloaded templates"
	@echo "  ghpages     to build and push the site to the gh-pages branch"
	@echo "  commit      to build and PUBLISH the site via ../mikaem.github.io"

install:
	uv sync

html:
	uv run jupyter book build --html

serve start:
	uv run jupyter book start

clean:
	uv run jupyter book clean --html --site --yes

cleanall:
	uv run jupyter book clean --all --yes

# Published under https://mikaem.github.io/jbhomepage, so the site needs to
# know it is served from a sub-path.
ghpages:
	BASE_URL=/jbhomepage uv run jupyter book build --html
	uv run ghp-import -n -p -f _build/html

# Published at the root of https://mikaem.github.io, so no BASE_URL is needed.
#
# This target goes live: the Makefile in ../mikaem.github.io commits and
# pushes, so review the site with `make serve` BEFORE running this.
#
# rsync mirrors (rather than copies over) the build, so pages that are no
# longer generated are removed from the published site. Without --delete the
# old Jupyter Book 1 output would stay live alongside the new site, and stale
# URLs such as /content/research/spectraldns.html would keep serving frozen
# v1 content instead of 404-ing. The excluded files belong to the deploy
# repository itself and are never generated here; rsync protects excluded
# paths from --delete.
commit: html
	rsync -a --delete \
	    --exclude '.git' --exclude '.nojekyll' --exclude 'Makefile' \
	    _build/html/ ../mikaem.github.io/
	make -C ../mikaem.github.io

# Conversion helpers, in case computational content is added back to the book
toipynb:
	find ./content -name "*.md" -exec uv run jupytext --to notebook {} \; -exec rm {} \;
	find ./content -name "*.ipynb" -exec git add {} \;
	git commit -a -m 'Move all sources to notebooks'

tomd:
	find ./content -name "*.ipynb" -exec uv run jupytext --to myst {} \; -exec rm {} \;
	find ./content -name "*.md" -exec git add {} \;
	git commit -a -m 'Move all sources to myst markdown'
