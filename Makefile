.PHONY: help book clean serve

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  book        to build the book"
	@echo "  clean       to clean out site build files"
	@echo "  commit      to build the book and commit to gh-pages online"
	@echo "  pdf         to build the sites PDF"

clear:
	find ./content/ -name "*.ipynb" -exec jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace {} +

book:
	jupyter-book build ./

commit: book
	ghp-import -n -p -f _build/html

cleanall:
	jupyter-book clean ./ --all

clean:
	jupyter-book clean ./
