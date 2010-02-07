PDFLATEX = pdflatex
PDFLATEX_FLAGS = -halt-on-error -file-line-error
PDF2SVG = pdf2svg
PDF2PNG = convert

all : \
    basic-usage.pdf \
    checkout-after-detached.pdf \
    checkout-branch.pdf \
    checkout-detached.pdf \
    checkout-files.pdf \
    commit-amend.pdf \
    commit-detached.pdf \
    commit-maint.pdf \
    commit-master.pdf \
    diff.pdf \
    reset-hard-files.pdf \
    reset-hard.pdf \
    reset-mixed-files.pdf \
    reset-mixed.pdf

%.pdf : %.tex common.tex
	$(PDFLATEX) $(PDFLATEX_FLAGS) $<

%.svg : %.pdf
	$(PDF2SVG) $^ $@

%.png : %.pdf
	$(PDF2PNG) $^ $@
