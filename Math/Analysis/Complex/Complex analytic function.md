A function $f : U \subset \mathbb{C} \rightarrow \mathbb{C}$ is _differentiable_ at a point $z \in U$
if it has a limit
$$
f'(z) = \lim_{w \rightarrow z} \frac{f(w) - f(z)}{w - z}.
$$
This can also be characterized with an "error term":
$f$ is differentiable at $z$ with derivative $f'(z)$
if $\exists$ $\epsilon : U \rightarrow \mathbb{C}$ such that $\epsilon(w) \overset{w \rightarrow z}{\longrightarrow} 0$ and
$$
f(w) - f(z) = f'(z)(w - z) + \epsilon(w)(w - z),
$$
which is often useful in proofs
(see also: [[Differentiable map]]).

This is a highly restrictive requirement for complex numbers
because the limit must be the same when approaching $z$ from any direction.
This turns out to be true
precisely when the function is continuous
and the [[Cauchy-Riemann equations]] are satisfied.

Formally, the function $f$ is called _(complex) analytic_
if it can be expressed as a Taylor series
$$
f(z) = \sum_{n=0}^{\infty} a_n (z - z_0)^n
$$
generated at any point $z_0$.
In practice, being complex differentiable everywhere
is equivalent to being complex analytic.
Complex analytic functions are also called _holomorphic_.

All analytic functions are infinitely differentiable.

The same formulas with real numbers instead of complex ones
give _real analytic_ functions,
which is a weaker property.

Some examples of complex analytic functions:
- all polynomials
- [[Complex exponential]]
- sin, cos, Log, and $z^n$ (including with non-integer or negative $n$)
  are analytic on any open set where they are continuous
  (but not necessarily on the entire $\mathbb{C}$)
