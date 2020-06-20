md_slides=$(wildcard slides/*.md)
html_slides=$(patsubst %.md,%.html, $(addprefix build/, $(notdir $(md_slides))))
pdf_slides=$(patsubst %.md,%.pdf, $(addprefix build/, $(notdir $(md_slides))))

all:buildir $(html_slides) $(pdf_slides)
	@echo "Generated files: $(pdf_slides)"
	@echo "Copying extra"; cp -rf reveal.js plugins build/
	@echo "Done"

buildir: build
	@mkdir -p build | true

clean:
	rm -rf $(html_slides) $(pdf_slides)

build/%.html: slides/%.md template.html
	pandoc -s \
		-i \
		-t revealjs \
		--mathjax \
	   	-V controls \
		-V date="`LC_TIME=en_US.UTF-8 date "+%B %e, %Y"`" \
		$< \
		--template=template.html \
		> $@ 

build/%.pdf: slides/%.md
	pandoc -s \
		-i \
		-t beamer \
		--mathjax \
		-V date="`LC_TIME=en_US.UTF-8 date "+%B %e, %Y"`" \
	   	-V controls \
		$< \
		> $@ 
