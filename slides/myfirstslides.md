---
lang: en
title: "Some example slides"
subtitle: "A slide deck with various examples"
author: Jeremy Fix
duration: 90
published: false
slideNumber: true
theme: beige
width: 1600
height: 1000
transition: none
keywords:
- example deck
- reveal.js 
- pandoc
---

## Slide header 1

- A first item with some equation
- A second item with some equation $$(a+b)^2 = a^2+b^2+2ab$$
- A first item with some equation
- A second item with some equation $$(a+b)^2 = a^2+b^2+2ab$$
- A first item with some equation
- A second item with some equation $$(a+b)^2 = a^2+b^2+2ab$$
- A first item with some equation
- A second item with some equation $$(a+b)^2 = a^2+b^2+2ab$$
- A first item with some equation
- A second item with some equation $$(a+b)^2 = a^2+b^2+2ab$$
- A first item with some equation
- A second item with some equation $$(a+b)^2 = a^2+b^2+2ab$$
- A first item with some equation
- A second item with some equation $$(a+b)^2 = a^2+b^2+2ab$$
- A first item with some equation
- A second item with some equation $$(a+b)^2 = a^2+b^2+2ab$$

## Math equations  

We shall write a sequence of math expressions : 

\begin{align}
\exists x \in \mathbb{R}, x& = \sum_{i=0}^{\infty} \pi^{e^i}\label{eq:1}\\
y&=2
\end{align}

The equation \ref{eq:1} is interesting

$$ p^i = t $$ 


\begin{equation}
\begin{split} 
\gamma(n)&=\sum_{i=1}^{n}x^{2}\\
&=\sum_{i=1}^{n}x\cdot x
\end{split}
\label{eq:splitSample}
\end{equation}


## Code highlights

For defining a sum in **python** 
```{.python}
def f(a, b):
	return a+b
```

And then in the **terminal**: 
```{.console}
fix_jer@stollen:~$ python3 sample.py
```

Or even **C++** code :
```{.cpp}
template<std::size_t N>
class array {
	
	public:
		array(double val) {};
		array(const array&) = default;

};
```
