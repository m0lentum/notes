A sequence is an ordered set of points.

More formally:
Let $X \neq \emptyset$ be a set.
The map $a : \mathbb{N} \setminus \{0\} \rightarrow X$ is a sequence in $X$.

This is often denoted with
$(a_j)_{j=1}^{\infty}$ or $(a_j)_j$ or $(a_j)$ where $a_j = a(j)$.

## Convergence

Let $(X, d)$ be a metric space.
The sequence $(x_j)$ in $X$ _converges_ to a point $x \in X$
if for all $\varepsilon > 0$ there exists an index $j_0$
such that $x_j \in B(x, \varepsilon)$ for all $j \geq j_0$.

This is often denoted $x = \lim_{j \rightarrow \infty} x_j$
or $x_j \overset{j \rightarrow \infty}{\longrightarrow} x$ or $x_j \longrightarrow x$.

A space where all [[Cauchy sequence]]s converge to a point
is called a [[complete space]].

A sequence $(x_j) \subset (X, d)$ converges to $x \in X$
if and only if the distance from that point converges to zero,
$\lim_{j \rightarrow \infty} d(x, x_j) = 0$.
