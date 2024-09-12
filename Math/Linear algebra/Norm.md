Let $V$ be a vector space over $\mathbb{R}$
(i.e. the scalars that vectors can be multiplied by are real).
A _norm_ is a function $||\cdot|| : V \rightarrow [0, \infty[$ for which
- $||x|| = 0 \iff x = 0$
- $||\lambda x|| = |\lambda| |x|$  for all $\lambda \in \mathbb{R}, x \in V$
- $||x+y|| \leq ||x|| + ||y||$ for all $x,y \in V$

The pair $(V, ||\cdot||)$ is called a _normed space_
or _normed vector space_.

The usual norm in $\mathbb{R}^n$ is the _Euclidean norm_
$$
||x|| = \sqrt{\sum_{i=1}^{n} x_i^2}
$$
which is a special case of the $l^p$-norms
$$
||x||_p = \sqrt[p]{\sum_{i=1}^n x_i^p}.
$$

A norm induces a [[metric]]:
If $(V, ||\cdot||)$ is a normed space, then
$d : V \times V \rightarrow [0, \infty[, \quad d(x, y) = ||x - y||$
is a metric in $V$.
This metric is _shift invariant_:
$d(x,y) = d(x+v, y+v)$ for all $x,y,v \in V$.