TEX = pdflatex
PDF = evince
GS = gs

all: resume email

show: resume
	nohup $(PDF) Resume.pdf 2>/dev/null >/dev/null &

cv: CV.tex
	$(TEX) CV.tex 

motivation: Motivation.tex
	$(TEX) Motivation.tex

resume: cv motivation
	$(GS) -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=Resume.pdf -dBATCH Motivation.pdf CV.pdf

COMPANY = $(shell sed -ne 's/.*\\company}{\(.*\)\\xspace.*/\1/p' Configuration.tex)

email:
	sed -e 's/COMPANY/$(COMPANY)/g' Email_in.txt > Email.txt

clean:
	rm -f *.log Motivation.pdf CV.pdf Resume.pdf && rm -f Email.txt
