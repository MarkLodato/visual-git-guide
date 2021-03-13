A Visual Git Reference
======================

The goal of this website is to be a concise, visual reference for how git
commands work.  I often draw pictures like this on a whiteboard for my
colleagues, so I figured I would make a nice electronic version once and for
all.

Implementation
--------------

I chose to draw the images using TeX and
[PGF/Ti*k*Z](http://www.texample.net/tikz/).  I originally tried using
[Graphviz](http://www.graphviz.org/), but unfortunately there is no way to
tell it how to lay out the graph exactly.  Using Ti*k*Z, I was able to create
a domain-specific language to represent commit graphs, and I think the result
turned out quite well.

All of the common macros are stored in
[common.tex](http://github.com/MarkLodato/visual-git-guide/blob/main/common.tex).
Each image source includes this file.  To see an example of how to use these
macros, look at
[commit-main.tex](http://github.com/MarkLodato/visual-git-guide/blob/main/commit-main.tex).

To generate the image files, I first create PDFs using
[pdflatex](http://www.tug.org/applications/pdftex/), and from there I create
SVGs and PNGs using
[pdf2svg](http://www.cityinthesky.co.uk/pdf2svg.html) and
[convert](http://www.imagemagick.org/script/convert.php), respectively.

### Building from Source

First, the following must be installed:

    sudo apt-get install make texlive-base texlive-fonts-extra pdf2svg imagemagick ghostscript

Then, build the images:

    make

Finally, create the gh-pages branch:

    make gh-pages

License
-------

Copyright &copy; 2010, [Mark Lodato](mailto:lodatom@gmail.com).  Japanese
translation &copy; 2010, [Kazu Yamamoto](http://github.com/kazu-yamamoto).
Korean translation &copy; 2011, [Sean](mailto:sean@weaveus.com).
Russian translation &copy; 2012, [Alex Sychev](mailto:alex@sychev.com).
French translation &copy; 2012, [Michel Lefranc](mailto:michel.lefranc@gmail.com).
Chinese translation &copy; 2012, [wych](mailto:ellrywych@gmail.com).
Spanish translation &copy; 2012, [Lucas Videla](http://www.delucas.com.ar).
Italian translation &copy; 2012, [Daniel Londero](mailto:daniel.londero@gmail.com).
German translation &copy; 2013, [Martin Funk](mailto:mafulafunk@gmail.com), &copy; 2017, [Mirko Westermeier](mailto:mirko@westermeier.de).
Vietnamese translation &copy; 2013, [Hoat Le](https://github.com/hoatle).
Slovak translation &copy; 2013, [Ľudovít Lučenič](https://github.com/llucenic).
Portuguese translation &copy; 2014, [Gustavo de Oliveira](mailto:goliveira5d@gmail.com).
Traditional Chinese translation &copy; 2015, [Peter Dave Hello](https://github.com/PeterDaveHello).
Polish translation &copy; 2017, [Emil Wypych](mailto:wypychemil@gmail.com).

This work is licensed under a
[Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States
License](https://creativecommons.org/licenses/by-nc-sa/3.0/us/).
