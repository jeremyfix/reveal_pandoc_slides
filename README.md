# Lecture slides with pandoc + reveal.js + markdown

You can check example slides generated with this toolchain at [https://jeremyfix.github.io/reveal_pandoc_slides/myfirstslides.html](https://jeremyfix.github.io/reveal_pandoc_slides/myfirstslides.html).

## Installation

You need a recent version of pandoc. For sure, this will work with pandoc 2.10.1. If necessary, [install a more recent version](https://pandoc.org/installing.html).

You need to clone the repository 

	git clone --recursive https://github.com/jeremyfix/reveal_pandoc_slides.git
	cd reveal_pandoc_slides; git submodule update --init --recursive

Then you are advised to symlink to `slidemaker`, e.g.

	cd ~/.local/bin
	ln -s /path/where/the/git/is/slidemaker/slidemake

## Dependencies

You need to install some dependencies before being able to compile slides. On an ubuntu box :

	sudo apt install libgraphviz-dev pandoc-citeproc
 	python3 -m pip install pygraphviz pandocfilters

## Compilation

Now, suppose you have a worktree somewhere with your markdown files, image directories, d3js scripts, and so (see the `example` directory for an example). The first time, we need to setup some stuff

	slidemake config

and then you just compile the slides with

	slidemake make

If you need to cleanup, 

	slidemake clean

All the things that are compiled are place in the `build` directory. You can serve this somewhere and open locally with firefox the generated page.

## Locally serving

To test locally what your slides will look like, you can start a simple http server on your host. 

	cd build
	python3 -m http.server

and then open a browser on localhost:8000 

## Exporting in PDF

Using the built-in pdf export does not work very well (actually, that may not be completely true, I must give a try viewing the pdf from google chrome, it seems to be working). Instead we serve the slides locally and use [decktape](https://github.com/astefanutti/decktape) to convert the HTML slides into PDF.

You need to be in the directory where the HTML slides are generated. And suppose the generated slides are `slides.html`

We serve locally the files with :

	 python3 -m http.server 8000

You can ensure you can access the slides by opening a browser and loading http://localhost:8000 . You should see your slides.

Then we use the decktape docker image to perform the export into pdf:

	docker run --net=host -v `pwd`:/slides astefanutti/decktape http://localhost:8000/slides.html /tmp/slides.pdf
	docker cp `docker ps -lq`:/tmp/slides.pdf .
	docker rm `docker ps -lq`

This will give you the `slides.pdf` file.

I had to use this longer sequence, suggested on the decktape github repo since otherwise I got a EACCESS error when trying to save the slides with :

	docker run --rm --net=host -v `pwd`:/slides astefanutti/decktape http://localhost:8000/slides.html slides.pdf


## References

This project was intially motivated by [this post](http://bloch.ece.gatech.edu/2020/02/15/workflow.html) of M. Bloch.


