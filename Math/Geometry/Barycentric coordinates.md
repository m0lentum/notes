Barycentric coordinates are a coordinate system
based on a reference simplex. For a $k$-simplex
$[x_0, \dots, x_k]$ and barycentric coordinates $[\lambda_0, \dots, \lambda_k]$,
the corresponding point in Euclidean coordinates is
the weighted sum

$$
\sum_{i=0}^k \lambda_i x_i.
$$

In general, any given point has an infinite number of
barycentric representations because uniformly scaling all weights
produces the same point. We can pick a unique scaling and produce
_normalized_ barycentric coordinates by requiring

$$
\sum_{i=0}^k \lambda_i = 1.
$$

Equivalently, the _barycentric function_ for a point $x_i$ of a simplex
(used in the context of [[Whitney form]]) is its normalized barycentric coordinate
in the simplex with respect to the point $x_i$.

## Geometric interpretation

Let $[x_0, x_1, x_2]$ be the points of a triangle $\sigma$ and $p$ a point inside it.
$p$ divides the triangle into three subtriangles $\sigma_i$ defined by replacing
$x_i$ with $p$. The barycentric coordinate $\lambda_i$ of $p$ can be interpreted
as the ratio of areas $\lambda_i = \frac{|\sigma_i|}{|\sigma|}$
(where $|\cdot|$ denotes the unsigned area of the triangle)
(see [MathWorld](https://mathworld.wolfram.com/BarycentricCoordinates.html) or [this](https://www.iue.tuwien.ac.at/phd/nentchev/node26.html)).

In 2D this gives the formula

$$
\lambda_0(p) = \frac{|\sigma_i|}{|\sigma|}
= \frac{\frac{1}{2}|\det(x_2-x_1, p-x_1)|}
{\frac{1}{2}|\det(x_2-x_1, x_0-x_1)|}
$$

The halves cancel out and we can remove the absolute values if we
assume the triangle is positively oriented, leaving

$$
\lambda_0(p) = \frac{\det(x_2-x_1, p-x_1)}
{\det(x_2-x_1, x_0-x_1)}
$$

Equivalent formulas for the other coordinates are obtained by
changing the numerator to only include indices other than that of $\lambda_i$.

## Gradient

Intuitively one might think (I certainly would) that the gradient
of a barycentric coordinate would be towards the corresponding point
on the triangle. However, this direction is actually $\frac{d\mathbf{x}}{d\lambda_i}$,
and the gradient is sort of the "inverse" of this (notationally,
not algebraically).

From the geometric interpretation in terms of triangle areas
it becomes clear that the gradient has a different direction,
namely the one that most increases the area of the subtriangle
opposite to $x_i$, which is the direction perpendicular to the opposite
edge to $x_i$. The partial derivatives of $\lambda_0$ are

$$
\begin{aligned}
\frac{\partial \lambda_0}{\partial x} &= -\frac{1}{|\sigma|} (x_2 - x_1) \cdot e_2 \\
\frac{\partial \lambda_0}{\partial y} &= \frac{1}{|\sigma|} (x_2 - x_1) \cdot e_1 \\
\end{aligned}
$$

where $\cdot \, e_i$  (dot with $i$th basis vector) denotes
taking the $i$th component of the vector. Thus,

$$
\begin{aligned}
\nabla \lambda_0 &= |\sigma|^{-1}(x_2-x_1)^{\perp} \\
\nabla \lambda_1 &= |\sigma|^{-1}(x_0-x_2)^{\perp} \\
\nabla \lambda_2 &= |\sigma|^{-1}(x_1-x_0)^{\perp} \\
\end{aligned}
$$

where $\perp$ denotes a counterclockwise 90 degree rotation.
