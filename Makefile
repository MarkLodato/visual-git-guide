all : \
    basic-usage.pdf \
    checkout-after-detached.pdf \
    checkout-branch.pdf \
    checkout-detached.pdf \
    checkout-files.pdf \
    commit-detached.pdf \
    commit-maint.pdf \
    commit-master.pdf \
    diff.pdf \
    reset-hard-files.pdf \
    reset-hard.pdf \
    reset-mixed-files.pdf \
    reset-mixed.pdf

%.pdf : %.tex common.tex
	pdflatex $<

%.svg : %.pdf
	pdf2svg $^ $@

%.png : %.pdf
	convert $^ $@
