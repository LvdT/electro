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
	$(RM) *.run.xml *.bbl *.xdv

dist-clean:
	$(LATEXMK) -C
	$(RM) *.run.xml *.bbl

# $@ name of the target
# $< first dependency of a rule

#%.tex: %.raw
#	./whatever $< > $@
