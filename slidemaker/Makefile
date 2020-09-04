md_slides=$(wildcard *.md)
html_slides=$(patsubst %.md,%.html, $(addprefix build/, $(notdir $(md_slides))))
pdf_slides=$(patsubst %.md,%.pdf, $(addprefix build/, $(notdir $(md_slides))))
BIBLIO=
ifneq (,$(wildcard ./biblio.bib))
	BIBLIO= --filter pandoc-citeproc --bibliography biblio.bib --csl=./template/apsa.csl
endif

.ONESHELL:

define copy_extra_files =
        @MYFILES=$(ls -d * | grep -v "build" | grep -v "Makefile" | grep -v "template" | grep -v "\.md$" | tr '\n' ' ')
        if [ ! -z "$MYFILES" ]; then
                @echo "I'm going to copy $MYFILES"
                @cp -rf $MYFILES ./build/
        else
                echo "Nothing extra to copy"
        fi
endef

.PHONY: copyextra
copyextra: ; $(value copy_extra_files)

all: $(html_slides) copyextra
	@echo "Generated files: $(html_slides)"
	@echo "Done"

build/%.html: %.md template/template.html meta.yaml
	@pandoc -s \
		-i \
		-t revealjs \
		--mathjax \
		--metadata-file=meta.yaml \
		$(BIBLIO) \
	   	-V controls \
		-V date="`LC_TIME=en_US.UTF-8 date "+%B %e, %Y"`" \
		--template=template/template.html \
		$< \
		> $@ 

build/%.pdf: build/%.tex
	@cd build; latexmk -pdf $*.tex

build/%.tex: %.md meta.yaml
	@pandoc -s \
		-i \
		-t beamer \
		$(BIBLIO) \
		--mathjax \
		--metadata-file=meta.yaml \
		-V date="`LC_TIME=en_US.UTF-8 date "+%B %e, %Y"`" \
	   	-V controls \
		$< \
		> $@

