PDFLATEX = pdflatex -halt-on-error -file-line-error
PDF2SVG = pdf2svg
PDF2PNG = convert

FILES := \
    basic-usage \
    checkout-after-detached \
    checkout-branch \
    checkout-detached \
    checkout-files \
    commit-amend \
    commit-detached \
    commit-maint \
    commit-master \
    conventions \
    diff \
    merge \
    merge-ff \
    reset-hard-files \
    reset-hard \
    reset-mixed-files \
    reset-mixed

PDF_OUT = $(FILES:=.pdf)
PNG_OUT = $(PDF_OUT:.pdf=.png)
SVG_OUT = $(PDF_OUT:.pdf=.svg)
CRUFT = $(FILES:=.aux) $(FILES:=.log)

all : pdf png svg index.html
pdf : $(PDF_OUT)
png : $(PNG_OUT)
svg : $(SVG_OUT)

index.html : index-nosvg.html format_html.pl
	./format_html.pl $< > $@

%.pdf : %.tex common.tex
	$(PDFLATEX) $<

%.svg : %.pdf
	$(PDF2SVG) $^ $@

%.png : %.pdf
	$(PDF2PNG) $^ $@

clean :
	$(RM) $(PDF_OUT) $(PNG_OUT) $(SVG_OUT) $(CRUFT) index.html

.PHONY : clean all pdf png
