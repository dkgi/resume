all:
	pdflatex CV.tex && pdflatex Motivation.tex

cv: all
	evince CV.pdf & > /dev/null

motivation: all
	evince Motivation.pdf & > /dev/null

combined: all
	gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=Resume.pdf -dBATCH Motivation.pdf CV.pdf

clean:
	rm -f *.log Motivation.pdf CV.pdf Resume.pdf
