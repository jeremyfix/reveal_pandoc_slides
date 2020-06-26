md_slides=$(wildcard slides/*.md)
html_slides=$(patsubst %.md,%.html, $(addprefix build/, $(notdir $(md_slides))))
pdf_slides=$(patsubst %.md,%.pdf, $(addprefix build/, $(notdir $(md_slides))))

all:buildir $(html_slides)
	@echo "Generated files: $(html_slides)"
	@echo "Copying extra"; cp -rf reveal.js plugins img *.css build/
	@echo "Done"

buildir: build
	@mkdir -p build | true

clean:
	@rm -rf $(html_slides) $(pdf_slides)

build/%.html: slides/%.md template.html slides/meta.yaml
	@pandoc -s \
		-i \
		-t revealjs \
		--mathjax \
		--metadata-file=slides/meta.yaml \
	   	-V controls \
		-V date="`LC_TIME=en_US.UTF-8 date "+%B %e, %Y"`" \
		--template=template.html \
		$< \
		> $@ 

build/%.pdf: build/%.tex
	@cd build; latexmk -pdf $*.tex

build/%.tex: slides/%.md slides/meta.yaml
	@pandoc -s \
		-i \
		-t beamer \
		--mathjax \
		--metadata-file=slides/meta.yaml \
		-V date="`LC_TIME=en_US.UTF-8 date "+%B %e, %Y"`" \
	   	-V controls \
		$< \
		> $@

