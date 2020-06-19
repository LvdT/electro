LATEXMK = latexmk
RM = rm -f
MKFLAGS = -xelatex -quiet -use-make

MAIN = main.pdf

.PHONY: $(MAIN) all clean

all: main

main: $(subst .pdf,.tex,$(MAIN))
	$(LATEXMK) $(MKFLAGS) $(subst .pdf,.tex,$(MAIN))

clean:
	$(LATEXMK) -c
	$(RM) *.run.xml *.bbl *.xdv *.synctex.gz

dist-clean:
	$(LATEXMK) -C
	$(RM) *.run.xml *.bbl *.synctex.gz

# $@ name of the target
# $< first dependency of a rule

#%.tex: %.raw
#	./whatever $< > $@
