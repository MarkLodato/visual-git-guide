PDFLATEX = pdflatex -halt-on-error -file-line-error
PDF2SVG = pdf2svg
PDF2PNG = convert -density 88

FILES := \
    basic-usage \
    basic-usage-2 \
    checkout-after-detached \
    checkout-b-detached \
    checkout-branch \
    checkout-detached \
    checkout-files \
    cherry-pick \
    commit-amend \
    commit-detached \
    commit-maint \
    commit-master \
    conventions \
    diff \
    merge \
    merge-ff \
    rebase \
    rebase-onto \
    reset \
    reset-commit \
    reset-files

HTML := \
    index-en.html \
    index-fr.html \
    index-ja.html \
    index-ko.html \
    index-ru.html \
    index-zh-cn.html \
    translate-en.html

PDF_OUT = $(FILES:=.pdf)
PNG_OUT = $(PDF_OUT:.pdf=.svg.png)
SVG_OUT = $(PDF_OUT:.pdf=.svg)
CRUFT = $(FILES:=.aux) $(FILES:=.log)
EXTRA := index.html visual-git-guide.css visual-git-guide.js

all : pdf png svg
pdf : $(PDF_OUT)
png : $(PNG_OUT)
svg : $(SVG_OUT)

gh-pages : all
	./publish $(PDF_OUT) $(PNG_OUT) $(SVG_OUT) $(HTML) $(EXTRA)

%.pdf : %.tex common.tex
	$(PDFLATEX) $<

%.svg : %.pdf
	$(PDF2SVG) $^ $@

%.svg.png : %.pdf
	$(PDF2PNG) $^ $@

clean :
	$(RM) $(PDF_OUT) $(PNG_OUT) $(SVG_OUT) $(CRUFT)

.PHONY : clean all pdf png svg gh-pages
