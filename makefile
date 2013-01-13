LATEX = pdflatex
INDEX = makeindex
COMMON = Tamriel.cls $(wildcard Systeme/*.tex)
IMAGES = $(wildcard MEP/*.eps)

all: force Tamriel_Univers.pdf Tamriel_Regles.pdf Tamriel.pdf

force:
	touch *.tex

%.pdf: %.tex %.aux
	${LATEX} $<
	${LATEX} $<

%.aux %.idx: %.tex
	${LATEX} $<
	${LATEX} $<

%.ind: %.idx %.tex
	$(INDEX) $<
	${LATEX} $<

Tamriel_Univers.pdf: Tamriel_Univers.tex $(COMMON)
Tamriel_Regles.pdf: Tamriel_Regles.tex $(COMMON)
Tamriel.pdf: Tamriel.tex $(COMMON)

clean:
	rm -rf *.aux *.log *.toc *.out
	rm -rf *.idx *.ilg *.ind
    
cleanwin:
	del *.aux *.log *.toc *.out
	del *.idx *.ilg *.ind
    
mrproper: clean
	rm *.pdf

