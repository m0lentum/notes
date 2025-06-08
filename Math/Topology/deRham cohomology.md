DeRham cohomology can be thought of as an algebraic study of holes
in a topological space.
It uses [[Closed and exact forms]] as a tool for this:
a core question is "when are closed forms not exact?".

A "$p$-hole" (nonstandard terminology used by Baez & Muniain 1994)
is a hole that prevents $p$-dimensional objects form being [[Homotopy|homotopic]]:
For instance, removing a point from $\mathbb{R}^2$ creates a "1-hole"
because 1D paths can't be smoothly deformed across it,
but removing a point from $\mathbb{R}^3$ keeps it [[Simply connected set|simply connected]]
because paths can still be deformed around it.
On the other hand, 2D surfaces now can't be deformed across this hole,
so it's a "2-hole".

The _$p$th deRham cohomology group_ $H^p(M)$ of manifold $M$
is a vector space with dimension equal to the number of "$p$-holes" in $M$.
To define it we need the following:
- $Z^p(M)$: the set of _closed_ $p$-forms on $M$.
- $B^p(M)$: the set of _exact_ $p$-forms on $M$.
  Because exact forms are always closed, $B^p(M) \subseteq Z^p(M)$.
$H^p(M)$ is the [[Quotient set|quotient space]] $Z^p(M) / B^p(M)$
whose elements $[\omega]$ are [[Equivalence relation|equivalence classes]] of closed forms
which differ by an exact form:
$[\omega] = \{\omega' : \exists \mu : \omega - \omega' = d\mu\}$.
$[\omega]$ is called the _cohomology class_ of $\omega$.

Example: a $0$-form is closed ($df = \partial_i f dx^i = 0$) iff it is locally constant
(value only changes across discontinuities).
Because $-1$-forms don't exist, we say by convention
that 0-form $f$ is exact only when $f \equiv 0$.
We get $H^0(M) = Z^0(M) / B^0(M) = Z^p(M) / \{0\} \cong Z^p(M)$,
so $H^p(M)$ is isomorphic to the space of locally constant functions on $M$,
with dimension equal to the number of connected components in $M$
since each of these creates one degree of freedom for a locally constant function.
Thus we can say a "0-hole" is a space between connected components.

$H^1(M) = \{0\}$ iff $M$ is simply connected.
Otherwise, one way to find inexact forms is via Stokes theorem:
Let $\omega = d\mu$ be an exact $p$-form on $M$,
$S$ a $p$-dimensional compact manifold without boundary,
and $\phi : S \rightarrow M$ a map (with [[pullback]] $\phi^*$). Then
$$
\int_S \phi^* \omega = \int_S \phi^*(d\mu) = \int_S d(\phi^*\mu) = \int_{\partial S}\phi^*\mu = 0
$$
where the equality with 0 is because $S$ has no boundary.
This applies to every compact orientable submanifold of $M$.
Thus if you can find $S, \phi$ such that $\int_S \phi^*\omega \neq 0$, then $\omega$ is not exact.
Conversely, if $\int_S \phi^*\omega = 0$ for all $\phi : S \rightarrow M$, $\omega$ is exact.

## Sources

Baez & Muniain (1994). Gauge fields, knots and gravity.