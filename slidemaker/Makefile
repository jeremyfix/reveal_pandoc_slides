md_slides=$(wildcard *.md)
html_slides=$(patsubst %.md,%.html, $(addprefix build/, $(notdir $(md_slides))))
pdf_slides=$(patsubst %.md,%.pdf, $(addprefix build/, $(notdir $(md_slides))))
BIBLIO=
ifneq (,$(wildcard ./biblio.bib))
	BIBLIO= --filter pandoc-citeproc --bibliography biblio.bib --csl=./template/apsa.csl
endif

.ONESHELL:

define copy_extra_files =
        rsync -r --exclude "build" --exclude "Makefile" --exclude "template" . build/
endef

.PHONY: copyextra
copyextra: ; $(value copy_extra_files)

all: $(html_slides) copyextra
	@echo "Generated files: $(html_slides)"
	@echo "Done"

build/%.html: %.md template/template.html meta.yaml
	@pandoc -s \
		-t revealjs \
		--mathjax \
		--filter ./template/graphviz.py \
		--filter ./template/tikz.py \
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
		--filter ./template/graphviz.py \
		--filter ./template/tikz.py \
		--metadata-file=meta.yaml \
		-V date="`LC_TIME=en_US.UTF-8 date "+%B %e, %Y"`" \
	   	-V controls \
		$< \
		> $@

