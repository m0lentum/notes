[wikipedia](https://en.wikipedia.org/wiki/Cauchy%27s_integral_formula)

The Cauchy integral formula relates path integrals around a point
to the value of a [[Complex analytic function]] at a point.
Given an open convex set $U \subset \mathbb{C}$, a map $f \in C^1(U)$,
a piecewise $C^1$ path $\gamma : [a, b] \rightarrow U$,
and a point $z \in U \setminus \gamma^*$ (not in the image of $\gamma$),
$$
\int_{\gamma} \frac{f(w)}{z - w}dw = 2\pi i n_{\gamma}(z) f(z)
$$
where $n_{\gamma}(z)$ is the _winding number_ of the path $\gamma$ around $z$,
which is 1 for a circle path $z_0 + re^{it}$ containing $z$,
and in general computed as
$$
n_{\gamma}(z) = \frac{1}{2\pi i} \int_{\gamma} \frac{dw}{w - z}.
$$

This formula gives us an easy way
to compute integrals of the form $\int \frac{f(z)}{w - z} dz$,
which many rational expressions can be transformed into
by the partial fraction decomposition.

This can be used to prove that analytic functions
are infinitely differentiable by expressing $f(z)$ as
$$
f(z) = \frac{1}{2\pi i} \int_{\partial D(z, r)} \frac{f(w)}{z - w}dw
$$
(where $D(z, r)$ is an $r$-radius disk centered at $z$)
and differentiating this.

This also gives us _Liouville's theorem_:
If $f : \mathbb{C} \rightarrow \mathbb{C}$ is analytic and bounded,
then $f$ is constant.
Proof: The derivative formula obtained here has the property
$|f'(z)| \leq \frac{||f||_{\infty}}{r}$ in any disk with radius $r$,
implying $|f'(z)| \overset{r \rightarrow 0}{\longrightarrow} 0$
when $||f||_{\infty}$ is finite ($f$ bounded).
Functions with zero derivative are constant.
