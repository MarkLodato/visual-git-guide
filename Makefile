all : basic-usage.pdf \
    checkout-files.pdf \
    checkout-branch.pdf \
    checkout-detached.pdf \
    commit-master.pdf \
    commit-maint.pdf \
    commit-detached.pdf

%.pdf : %.tex common.tex
	pdflatex $<
