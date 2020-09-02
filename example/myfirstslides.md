## Ununmbered list

**Unnumbered lists** like this:

    -   Galileo Galilei
    -   Robert G. Ingersoll
    -   Jill Tarter

-   Galileo Galilei
-   Robert G. Ingersoll
-   Jill Tarter

## Unnumbered list (incremental/nonincremental)

Within the makefile, the lists appear incrementally due to the `-i`. However, you can depart from this default as stated in the [pandoc documentation](https://pandoc.org/MANUAL.html#incremental-lists)

```{.markdown}
> - Item 1
> - Item 2
> - Item 3
```

> - Item 1
> - Item 2
> - Item 3

## Numbered list

**Numbered lists** like this:

```{.markdown}
1.  Na&iuml;ve realists
1.  Scientific realists
1.  Constructive empiricists
1.  Positivists
1.  Relativists
```

1.  Na&iuml;ve realists
1.  Scientific realists
1.  Constructive empiricists
1.  Positivists
1.  Relativists


## Fonts

- *This is emphasis.*
- **This is bold.**
- _This is also emphasis._
- __This is also bold.__
- _This is emphasis **and** bold._
- __This is bold *and* emphasis.__
- ~~This is struck-out.~~

## Labels

This markdown memo has been inspired by [this memo](https://github.com/rreece/markdown-memo/blob/master) which is hosted by <https://github.com>

## Footnotes

Here's how you do a footnote[^SomeSpecialNote].

[^SomeSpecialNote]: Lorem ipsum dolor sit amet, duo ut putant verear, nam ut brute utroque.
    Officiis qualisque conceptam te duo, eu vim soluta numquam, has ut aliquip
    accusamus. Probo aliquam pri id. Mutat singulis ad vis, eam euismod pertinax
    an, ea tale volumus vel. At porro soleat est. Debet facilis admodum an sed,
    at falli feugiat est.

## Quote blocks

The following is a **quote block**. 

    >   It ain't what you don't know that gets you into trouble.
    >   It's what you know for sure that just ain't so.  

    -- Mark Twain

>   It ain't what you don't know that gets you into trouble.
>   It's what you know for sure that just ain't so.  

-- Mark Twain

## Highlighting python codes

For defining a sum in **python** 
```{.python}
def f(a, b):
	return a+b
```

And then in the **terminal**: 
```{.console}
fix_jer@stollen:~$ python3 sample.py
```

## Highlighting C++ codes

Or even **C++** code :
```{.cpp}
template<std::size_t N>
class array {
	
	public:
		array(double val) {};
		array(const array&) = default;

};
```

## Math equations

We shall write a sequence of math expressions : 

\begin{align}
!n &\sim \frac{n^n}{e^n} \sqrt{2\pi n}\label{eq:1}\\
e^{i \theta}&= \cos(\theta) + i \sin(\theta)\label{eq:2}
\end{align}

Equation $\eqref{eq:1}$ is the [Stirling's formula]() while equation $\eqref{eq:2}$ is due to [Euler](https://en.wikipedia.org/wiki/Euler%27s_formula). These are typed in as raw latex

```{.latex}
\begin{align}
!n &\sim \frac{n^n}{e^n} \sqrt{2\pi n}\label{eq:1}\\
e^{i \theta}&= \cos(\theta) + i \sin(\theta)\label{eq:2}
\end{align}
```

You can also use familiar environments (see the source):

\begin{equation}
\begin{split} 
\gamma(n)&=\sum_{i=1}^{n}x^{2}\\
&=\sum_{i=1}^{n}x\cdot x
\end{split}
\label{eq:splitSample}
\end{equation}

## Transitions between slides 

Transitions between the slides can be set globally in the yaml file

```{.markdown}
## Section name
```

According to the [pandoc documentation](https://pandoc.org/MANUAL.html#background-in-reveal.js-and-beamer) you should be able to set it individually on every slide but that did not work in my tests)

## Figures

You can put images in your slides with : 

```{.markdown}
![The caption](the/path/to/the/image){#aref width=50%}
```

And you could cite the image with ...

![The scale of the universe mapped to the branches of science and the hierarchy
    of science. CC BY-SA 3.0 (2013) [Wikimedia Commons](https://en.wikipedia.org/wiki/Science#/media/File:The_Scientific_Universe.png).](img/1024px-the_scientific_universe.png){#fig:scientific_universe width=30%}


## Videos

You can put videos in your slides with raw html :

```{.html}
<video width="800" controls>
<source src="http://download.blender.org/peach/trailer/trailer_1080p.ogg" type="video/ogg">
</video>
```

<video width="800" controls>
<source src="http://download.blender.org/peach/trailer/trailer_1080p.ogg" type="video/ogg">
</video>


## Multiple columns


<div class='multiCol'>
<div class='col'>
Gallia est omnis divisa in partes tres, quarum unam incolunt Belgae, aliam Aquitani,... 
</div>
<div class='col'>
Qua de causa Helvetii quoque reliquos Gallos virtute praecedunt, quod fere cotidianis proeliis cum Germanis contendunt, ...
</div>
</div>
And simply more regular full-width text in the following. But hey, there is also:
<div class='multiCol'>
<div class='col'>Also works for 3 columns...</div>
<div class='col'>...as we can show in...</div>
<div class='col'>...this example here.</div>
</div>

<div class='multiCol'>
<div class='col'>
![The scale of the universe mapped to the branches of science and the hierarchy
    of science. CC BY-SA 3.0 (2013) [Wikimedia Commons](https://en.wikipedia.org/wiki/Science#/media/File:The_Scientific_Universe.png).](img/1024px-the_scientific_universe.png){#fig:scientific_universe width=30%}
</div>
<div class='col'>
![The scale of the universe mapped to the branches of science and the hierarchy
    of science. CC BY-SA 3.0 (2013) [Wikimedia Commons](https://en.wikipedia.org/wiki/Science#/media/File:The_Scientific_Universe.png).](img/1024px-the_scientific_universe.png){#fig:scientific_universe width=30%}
</div>
</div>

##  Embedding d3.js

Using the plugin [reveal.js-d3](https://github.com/gcalmettes/reveal.js-d3), we can embed d3.js animations , this one is taken from [d3-graph-gallery](https://www.d3-graph-gallery.com)

<div class='multiCol'>
<div class='col'>
<div class="fig-container" data-preload data-file="slides/d3js/line_filter.html"></div>
</div>
<div class='col'>
<div class="fig-container" data-preload data-file="slides/d3js/line_cursor.html"></div>
</div>
<div class='col'>
<div class="fig-container" data-preload data-file="slides/d3js/line_cursor.html"></div>
</div>
</div>

## [reveal.js-d3] Including websites 

Using the plugin [reveal.js-d3](https://github.com/gcalmettes/reveal.js-d3), we can embed websites

<div class="fig-container" data-file="https://teaching.pages.centralesupelec.fr/deeplearning-lectures-build/">
</div>

## Notes

You can add notes to a slide that are shown only in the speaker view (triggered by pressing the "S" key) or by showing them on every slide by setting the meta.yaml property

```{.yaml}
showNotes: true
```

