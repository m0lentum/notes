Not the same thing as the [[metric]] in "metric space"!
That one measures distance between points,
this one is an inner product.

Example: Minkowski inner product
$v \cdot w = -v^0w^0 + v^1w^1 + v^2w^2 + v^3w^3$
where $v = (v^0, v^1, v^2, v^3) = (t, x, y, z)$ (0th dimension is time).

Generalization: _semi-Riemannian metric_ $g : V \times V \rightarrow \mathbb{R}$
is a bilinear, symmetric, nondegenerate map
(bilinear: $g(\lambda v, w) = \lambda g(v, w)$, $g(v + u, w) = g(v, w) + g(u, w)$,
same for other argument;
symmetric: $g(v,w) = g(w,v)$,
nondegenerate: $g(v,w) = 0 \iff v = 0 \text{ or } w = 0$).

A _Riemannian metric_ is additionally positive definite
($g(v, w) \geq 0$ for all $v,w$)
(which the Minkowski inner product / metric is not).

On a [[manifold]], the metric is defined pointwise
and operates on vectors in the [[Tangent space]].
A manifold equipped with a (semi)-Riemannian metric
is called a _(semi)-Riemannian manifold_.

The Minkowski metric is said to have _signature_ (3, 1)
because it gives +1 for 3 unit basis vectors
and -1 for 1 of them.
A metric with one "timelike" dimension like this
is also called _Lorentzian_.

The metric is a [[tensor]] which can be expressed in coordinates
as $g_{ij} = g(e_i, e_j)$ where $e_k$ are basis vectors (in a [[chart]]).

## Sources

Baez & Muniain (1994). Gauge fields, knots and gravity