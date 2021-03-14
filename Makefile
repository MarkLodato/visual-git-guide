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
    commit-stable \
    commit-main \
    conventions \
    diff \
    merge \
    merge-ff \
    rebase \
    rebase-onto \
    reset \
    reset-commit \
    reset-files

STATIC := \
    index.html \
    index-de.html \
    index-en.html \
    index-es.html \
    index-fr.html \
    index-it.html \
    index-ja.html \
    index-ko.html \
    index-pl.html \
    index-pt.html \
    index-ru.html \
    index-sk.html \
    index-vi.html \
    index-zh-cn.html \
    index-zh-tw.html \
    translate-en.html \
    visual-git-guide.css \
    visual-git-guide.js

STATIC_OUT = $(addprefix build/,$(STATIC))
PDF_OUT = $(addprefix build/,$(FILES:=.pdf))
PNG_OUT = $(PDF_OUT:.pdf=.svg.png)
SVG_OUT = $(PDF_OUT:.pdf=.svg)

all : pdf png svg static
pdf : $(PDF_OUT)
png : $(PNG_OUT)
svg : $(SVG_OUT)
static : $(STATIC_OUT)

build/% : % | build
	cp $^ $@

build/%.pdf : %.tex common.tex | build
	$(PDFLATEX) -output-directory=build $<

build/%.svg : build/%.pdf | build
	$(PDF2SVG) $^ $@

build/%.svg.png : build/%.pdf | build
	$(PDF2PNG) $^ $@

build :
	mkdir -p $@

clean :
	$(RM) -r build

.PHONY : clean all pdf png svg static
