The Cauchy-Riemann equations are a necessary condition
for the existence of a complex derivative ([[Complex analytic function]]).
They state that the coordinate gradients (in the real sense)
of a function $f(z) = u(z) + v(z)i$ must be orthogonal
and of equal magnitude, related by
$$
\begin{cases}
\partial_x u = \partial_y v \\
\partial_y u = -\partial_x v \\
\end{cases}
$$
As a mnemonic, $\nabla v$ is the left normal of $\nabla u$,
just like the imaginary basis vector
is the left normal of the real basis vector.

If $f$ is real differentiable and satisfies the CR equations,
it is complex differentiable.
A complex differentiable function is always real differentiable.

## Derivation

Recall that $f : U \subset \mathbb{R}^2 \rightarrow \mathbb{R}^2$, $f(z) = (u(z), v(z))$ is _real differentiable_ at $z \in U$
if $f(w) - f(z) - Df(z)(w-z) = \epsilon(w)(w-z)$
where
$$
Df(z) = \begin{bmatrix}
\partial_x u & \partial_y u \\
\partial_x v & \partial_y v \\
\end{bmatrix}
$$
and $\epsilon(w) \overset{w \rightarrow z}{\longrightarrow} 0$ ([[Differentiable map]]).
For the complex differential to exist,
we need all directional derivatives to be equal.
The real partial derivatives of $f$ are
$\partial_x f = (\partial_x u, \partial_x v)$ and $\partial_y f = (\partial_y u, \partial_y v)$.
For the complex partial derivatives,
notice that the denominator in the difference quotient contains $i$,
and therefore we get
$f'(z) = \partial_x u + i\partial_x v$ from the x side
and $f'(z) = -i(\partial_y u + i\partial_y v) = \partial_y v - i\partial_x u$ from the y side.
Setting these as equal produces the CR equations.