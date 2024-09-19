A _metric_ is a generalization for the idea of _distance_.

Let $X$ be a set.
A map $d : X \times X \rightarrow [0, \infty[$ is a metric if
- $d(x, y) = 0 \iff x = y$
- $d(x, y) = d(y, x)$ for all $x,y \in X$
- $d(x,y) + d(y, z) \leq d(x,z)$ for all $x,y,z \in X$

The pair $(X, d)$ is called a _metric space_.

Examples:
- any [[Norm|normed space]] is also a metric space
	under the metric induced by the norm,
	e.g. ($\mathbb{R}^n$, $x,y \mapsto ||x - y||_2$) 
- discrete metric:
	$\delta(x,y) = \begin{cases}1,\text{ if }x \neq y \\ 0,\text{ if }x = y \end{cases}$
- angle metric on $S^{n-1} = \{x \in \mathbb{R}^n : ||x|| = 1\}$:
	$d_{S^{n-1}}(x, y) = \arccos(x \cdot y)$

A metric space is called _bounded_ if there is $x_0 \in X$
and $r > 0$ such that $X = B(x_0, r)$
(note: this is an equality because $x \subset B(x_0, r)$
and by definition $B(x_0, r) \subset X$)
Example: any space with the discrete metric
is bounded because $\bar{B}(x, 1) = X$.

## Induced metric

If $(X, d)$ is a metric space and $A \subset X$,
then $d|_{A \times A}$ (the _restriction_ of $d$ to domain $A \times A$)
is the metric induced by $d$ in $A$
and $(A, d|_{A \times A})$ is a metric space.
## Product metric

Let $(X, d_X)$ and $(Y, d_Y)$ be metric spaces.
In the product space $X \times Y$ we can define
a $p$-product metric for $p \geq 1$,
$$
d_p((x_1, y_1), (x_2, y_2)) = \sqrt[p]{d_X(x_1, x_2)^p + d_Y(y_1, y_2)^p}.
$$
This is analogous to the $l^p$ norm.
Example: the $d_2$ metric for $\mathbb{R} \times \dots \times \mathbb{R}$ ($n$ times), 
is the Euclidean metric for $\mathbb{R}^n$.

## Equivalent metrics

Two metrics $d$ and $\tilde{d}$ are said to be _equivalent_
if they induce the same [[topology]],
$\tau(X, d) = \tau(X, \tilde{d})$.
They are _[[Lipschitz continuity|bi-Lipschitz]] equivalent_ if
$$
\exists\, K \geq 0 :  \frac{1}{K} d(x,y) \leq \tilde{d}(f(x), f(y)) \leq Kd(x,y).
$$