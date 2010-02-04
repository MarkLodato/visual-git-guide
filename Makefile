all : basic-usage.pdf checkout-files.pdf checkout-branch.pdf \
	checkout-commit.pdf

%.pdf : %.tex common.tex
	pdflatex $<
