# Lecture slides with pandoc + reveal.js + markdown

## Installation

You need to clone the repository 

	git clone --recursive git@github.com:jeremyfix/reveal_pandoc_slides.git

Then you are advised to symlink to `slidemaker`, e.g.

	cd ~/.local/bin
	ln -s /path/where/the/git/is/slidemaker/slidemake

## Compilation

Now, suppose you have a worktree somewhere with your markdown files, image directories, d3js scripts, and so (see the `example` directory for an example). The first time, we need to setup some stuff

	slidemake config

and then you just compile the slides with

	slidemake make

If you need to cleanup, 

	slidemake clean

All the things that are compiled are place in the `build` directory. You can serve this somewhere and open locally with firefox the generated page.

## References

This project was intially motivated by [this post](http://bloch.ece.gatech.edu/2020/02/15/workflow.html) of M. Bloch.


