

#STYLE-PATH= ${HOME}/.LaTex/
STYLE-PATH= ${HOME}/Library/texmf/tex/latex/
LANGSCI-PATH=~/Documents/Dienstlich/Projekte/LangSci/Git-HUB/latex/

SOURCE= $(wildcard *.tex) $(wildcard geteilte-Folien/*.tex)

#	organisatorisches-formgram.tex \
#	formgram-gb.tex 4a-gengram-tmodell.tex 4b-gengram-cpip.tex \
#	formgram-gpsg.tex \
#        hpsg-phrasenstrukturgrammatik.tex hpsg-einleitung.tex formgram-lfg.tex\


#${HOME}/.LaTeX/beamer-includes.sty\


#dvi: hu-formgram-vorl-slides.dvi hu-formgram-vorl-slides.bib.dvi hu-formgram-vorl-handout.dvi

slides: hu-formgram-slides-present.pdf
handout: hu-formgram-handout.pdf

einf-gt-aufgaben.pdf: einf-gt-aufgaben.tex
	xelatex $?

%.pdf: %.tex $(SOURCE) 
	xelatex $*
	biber $*
	xelatex $*
	biber $*
	xelatex $* 



install:
	cp -p ${STYLE-PATH}Beamer/hu-beamer-includes-pdflatex.sty                                          styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/theme/beamerthemeHUBerlin.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/font/beamerfontthemehu.sty        styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/color/beamercolorthemebearHU.sty  styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/inner/beamerinnerthemehui.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/outer/beamerouterthemehuo.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/beamer-movement.sty                                                      styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/forest-beamer-setup.sty                                                  styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/hu-literatur-biber.tex                                                   styles/Beamer/
	cp -p ${STYLE-PATH}makros.2e.sty styles/
	cp -p ${STYLE-PATH}abbrev.sty    styles/
	cp -p ${STYLE-PATH}fixcitep.sty  styles/
	cp -p ${STYLE-PATH}de-date.sty   styles/
	cp -p ${STYLE-PATH}oneline.sty   styles/
	cp -p ${STYLE-PATH}unified-biblatex.sty          styles/
	cp -p ${STYLE-PATH}unified-biblatex/stmue-langsci-unified.bbx styles/
	cp -p ${STYLE-PATH}unified-biblatex/stmue-langsci-unified.cbx styles/
	cp -p ${STYLE-PATH}Ling/article-ex.sty           styles/
	cp -p ${STYLE-PATH}Ling/merkmalstruktur.sty      styles/
	cp -p ${STYLE-PATH}Ling/my-xspace.sty            styles/
	cp -p ${STYLE-PATH}Ling/my-ccg-ohne-colortbl.sty styles/
	cp -p ${STYLE-PATH}Ling/forest.sty               styles/
	cp -p ${STYLE-PATH}Ling/my-gb4e-slides.sty       styles/
	cp -p ${STYLE-PATH}Ling/cgloss.sty               styles/
	cp -p ${LANGSCI-PATH}langsci-forest-setup.sty    .
	cp -p ~/Documents/Dienstlich/Buecher/GT/English/styles/dalrymple.sty styles/



test-fromgram.2.pdf: test-formgram.pdf
	beamer2handout $?

public: hu-formgram-slides.pdf hu-formgram-handout.pdf
	scp $? /home/stefan/public_html/PS/



o-public: hu-formgram-slides.pdf hu-formgram-handout.pdf einf-gt-aufgaben.pdf
	scp -p hu-formgram-slides.pdf hu-formgram-slides-present.pdf hu-formgram-handout.pdf einf-gt-aufgaben.pdf hpsg.hu-berlin.de:/home/stefan/public_html/PS/





code-public:
	tar cjvhf /tmp/hu-formgram-slides.tbz *.tex Makefile styles Figures
	scp -p /tmp/hu-formgram-slides.tbz home.hpsg.fu-berlin.de:/home/stefan/public_html/PS/
	cp  -p /tmp/hu-formgram-slides.tbz                      ${HOME}/public_html/PS/

mount:
	/usr/local/bin/bindfs ~/Documents/Dienstlich/Lehre/Folien/HU/geteilte-Folien ~/Documents/Dienstlich/Lehre/Folien/HU/Grammatiktheorie/geteilte-Folien


clean:
	find . -name \*\.bak -exec \rm {} \;
	find . -name \*~ -exec \rm {} \;
	rm -f *.bak *.toc *.bbl *.blg *~ *.log *.aux *.*pk *.cut *.tmp *.out *.nav *.snm *.for *.aux.copy *.run.xml *.bcf


realclean: clean
	rm -f *.dvi *.ps *.pdf


