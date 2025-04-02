## Local form

Let $f : U \rightarrow \mathbb{C}$ be continuous
with $U$ open and convex.
Then the following are equivalent:
1. $f$ is [[Complex analytic function|analytic]] in $U$
2. $\int f(z)dz = 0$ for all closed paths in $U$
3. $f$ has a [[primitive]] in $U$

Proof: Define $F$ as a line segment integral from some $z_0 \in U$:
$F(z) = \int_{[z_0, z]} f(w)\,dw$.
Now by computation we can show that 1. $\implies$ 3. and 2. $\implies$ 3.

## Global form

Essentially, the global Cauchy's theorem says
that the previous statements hold not just in convex sets,
but in [[simply connected set]]s.

Formal statement:
Let $f : U \rightarrow \mathbb{C}$ be an analytic function with $U$ open,
and $\sigma$ a [[cycle]] with [[homology]] zero.
Then,
$$
\int_{\sigma} f(z)dz = 0.
$$