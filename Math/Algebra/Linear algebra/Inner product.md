Let $V$ be a real vector space.
An _inner product_ is a map $(\cdot, \cdot) : V \times V \rightarrow \mathbb{R}$ for which
- $(v, v) \geq 0$ for all $v \in V$
- $(w, v) = (v, w)$ for all $v,w \in V$
- for all $v_0$, the map $v \mapsto (v_0, v)$ is linear
	(and by symmetry, so is $v \mapsto (v, v_0)$)

The Euclidean _dot product_ $v \cdot v$ is an inner product.
It's also sometimes denoted with angle brackets $\langle \cdot, \cdot \rangle$.

An inner product induces a [[Norm]]:
If $(V, (\cdot, \cdot))$ is an inner product space,
$||x|| = \sqrt{(x, x)}$ is a norm in $V$.
This norm in turn induces a [[metric]].

For any inner product, the _Cauchy-Schwarz inequality_ applies:
$|(x, y)| \leq ||x|| ||y||$

All finite-dimensional inner product spaces are isomorphic with $\mathbb{R}^n$.