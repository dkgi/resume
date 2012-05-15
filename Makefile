all: resume
	evince Resume.pdf > /dev/null

cv: CV.tex
	pdflatex CV.tex 

motivation: Motivation.tex
	pdflatex Motivation.tex

resume: all
	gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=Resume.pdf -dBATCH Motivation.pdf CV.pdf

COMPANY = $(shell sed -ne 's/.*\\company}{\(.*\)\\xspace.*/\1/p' Configuration.tex)

email:
	sed -e s/COMPANY/$(COMPANY)/g Email_in.txt > Email.txt

clean:
	rm -f *.log Motivation.pdf CV.pdf Resume.pdf
