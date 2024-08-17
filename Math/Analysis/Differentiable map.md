Let $\Omega \subset \mathbb{R}^n$ be an open set and $x_0 \in \Omega$.
The map $f : \Omega \rightarrow \mathbb{R}$ is _differentiable_ (fi: derivoituva/differentioituva)
at $x_0$ if there is a vector $a \in \mathbb{R}^n$ such that
$$
f(x) - f(x_0) - a \cdot (x - x_0)
= ||x - x_0|| \epsilon_{x_0} (x - x_0)
\quad \text{for all } x \in \Omega
$$
where $\epsilon_{x_0} : \mathbb{R}^n \rightarrow \mathbb{R}$ is a function for which
$$
\lim_{h \rightarrow 0} \epsilon_{x_0} (h) = 0.
$$

In geometric terms, this means when approaching $x_0$
from any direction, the difference between $f(x)$ and $f(x_0)$
always approaches the same plane.

All linear maps are differentiable.
All differentiable maps are continuous.

For a differentiable map,
all partial derivatives exist and $a = \nabla f(x_0)$.

Proof
	Because $\Omega$ is open, there is a $r > 0$ for which $B^n(x_0, r) \in \Omega$
	(where $B^n$ is the open $n$-ball with radius $r$ centered at $x_0$).
	Therefore $x_0 + t\hat{e} \in \Omega$ whenever $0 < t < r$ for any $\hat{e} \in \mathbb{R}^n, ||\hat{e}|| = 1$.
	Now, because $f$ is differentiable,
	$$
	f(x_0 + t\hat{e}) - f(x_0) - a \cdot t\hat{e}
	= ||t\hat{e}|| \epsilon_{x_0} (t\hat{e})
	$$
	dividing by $t$ (assuming $t \neq 0$),
	$$
	\frac{f(x_0 + t\hat{e}) - f(x_0)}{t} = a \cdot \hat{e} + \epsilon_{x_0} (t\hat{e})
	$$
	which converges to $a \cdot \hat{e}$ when $t \rightarrow 0$.
	This limit is the definition of a directional derivative,
	so this proves all directional derivatives exist.
	By selecting the basis vectors $\hat{e}_j$ we can solve for elements of $a$,
	$\partial_{\hat{e}_j} f(x_0) = a \cdot \hat{e_j} \iff a_j = \partial_j f(x_0)$.
	Therefore, $a = \nabla f(x_0)$.

However, the existence of all partial derivatives
is not a sufficient condition for differentiability,
hence the less intuitive definition involving $\epsilon_{x_0}$.
If all partial derivatives exist everywhere
and are continuous, though,
this is sufficient to guarantee differentiability.
The space of maps with continuous partial derivatives
everywhere in set $\Omega$ is denoted $C^1(\Omega)$.

## Maps to higher-dimensional spaces

The definition of differentiability is similar for maps
$f : \Omega \rightarrow \mathbb{R}^m$, $m \geq 2$.
Here the dot product with $a$ is replaced with a matrix $A$,
$$
f(x) - f(x_0) - A(x - x_0)
= ||x - x_0|| \epsilon_{x_0} (x - x_0)
\quad \text{for all } x \in \Omega
$$
Here $A$ is called the _derivative_ or _Jacobian matrix_
of $f$ at $x_0$, denoted $A =: f'(x_0)$.
Each row of $A$ is the transpose
of the corresponding coordinate function's gradient,
$A_{j,*} = (\nabla f_j)^T$.