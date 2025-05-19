FROM python:3.11-slim

LABEL org.opencontainers.image.source=https://github.com/jeremyfix/reveal_pandoc_slides
LABEL org.opencontainers.image.authors="J. Fix"

ENV DEBIAN_FRONTEND=noninteractive

# Set up the timezone, otherwise tzdata install will ask some 
# questions during the docker image building
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Generic tools 
RUN apt update && \
	apt install -y make git python3-pip wget curl

# Latex 
RUN apt update && apt install -y latexmk \
        texlive-latex-base \
		texlive-fonts-recommended \
		texlive-fonts-extra \
		texlive-science \
		texlive-fonts-extra \
		texlive-extra-utils 

RUN apt update && apt install -y pdf2svg

RUN apt update && apt install -y pandoc libgraphviz-dev graphviz

RUN python3 -m pip install pygraphviz pandocfilters

RUN git clone --recursive https://github.com/jeremyfix/reveal_pandoc_slides.git $HOME/reveal_pandoc_slides
RUN cd $HOME/reveal_pandoc_slides; git submodule update --init --recursive
RUN mkdir -p $HOME/.local/bin && ln -s $HOME/reveal_pandoc_slides/slidemaker/slidemake $HOME/.local/bin/slidemake
