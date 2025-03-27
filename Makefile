.PHONY: cleanbiber

cleanbiber:
	biber --cache | xargs rm -rf

# git-latexdiff