md_slides=$(wildcard slides/*.md)
html_slides=$(patsubst %.md,%.html, $(addprefix build/, $(notdir $(md_slides))))
pdf_slides=$(patsubst %.md,%.pdf, $(addprefix build/, $(notdir $(md_slides))))

all:buildir $(html_slides) $(pdf_slides)
	echo $(pdf_slides)
	@cp -rf reveal.js reveal.js-plugins build/
	@echo "Done"

buildir:
	mkdir -p build | true

clean:
	rm -rf $(html_slides) $(pdf_slides)

build/%.html: slides/%.md template.html
	pandoc -s \
		-i \
		-t revealjs \
		--mathjax -V controls \
		$< \
		--template=template.html \
		--filter ./pandoc-eqref/pandoc-eqref \
		> $@ 

build/%.pdf: slides/%.md
	pandoc -s \
		-i \
		-t beamer \
		--mathjax -V controls \
		$< \
		--filter ./pandoc-eqref/pandoc-eqref \
		> $@ 
