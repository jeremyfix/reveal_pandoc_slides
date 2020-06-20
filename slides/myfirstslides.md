## Ununmbered list

**Unnumbered lists** like this:

    -   Galileo Galilei
    -   Robert G. Ingersoll
    -   Jill Tarter

-   Galileo Galilei
-   Robert G. Ingersoll
-   Jill Tarter

## Numbered list

**Numbered lists** like this:

    1.  Na&iuml;ve realists
    1.  Scientific realists
    1.  Constructive empiricists
    1.  Positivists
    1.  Relativists

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
\exists x \in \mathbb{R}, x& = \sum_{i=0}^{\infty} \pi^{e^i}\label{eq:1}\\
y&=2
\end{align}

The equation $\eqref{eq:1}$ is interesting. The equation $\eqref{eq:splitSample}$ is not that bad.

$$ p^i = t $$ 


\begin{equation}
\begin{split} 
\gamma(n)&=\sum_{i=1}^{n}x^{2}\\
&=\sum_{i=1}^{n}x\cdot x
\end{split}
\label{eq:splitSample}
\end{equation}

## Figures

![The scale of the universe mapped to the branches of science and the hierarchy
    of science. CC BY-SA 3.0 (2013) [Wikimedia Commons](https://en.wikipedia.org/wiki/Science#/media/File:The_Scientific_Universe.png).](img/1024px-the_scientific_universe.png){#fig:scientific_universe width=50%}


