Let $f : U \rightarrow \mathbb{C}$ be a continuous map
where $U \subset \mathbb{C}$.
$F : U \rightarrow \mathbb{C}$ is a _primitive_
(analogous to real antiderivative) of $f$ 
if $F'(z) = f(z) \,\forall\, z \in U$.

For basic functions this can be obtained with the same formulas
as the real antiderivative.
For some functions the primitive doesn't exist in all of $\mathbb{C}$
but does exist in a suitable open subset,
e.g. the primitive of $\frac{1}{z}$ in $\mathbb{C} \setminus (-\infty, 0]$ is [[Complex exponential#Logarithm|Log]].

The primitive enables the complex version
of the fundamental theorem of calculus:
Let $f : U \rightarrow \mathbb{C}$ be continuous
and $\gamma : [a, b] \rightarrow U$ a piecewise $C^1$
(continuous with continuous first derivative) path.
If $F : U \rightarrow \mathbb{C}$ is a primitive of $f$ in $U$, then
$$
\int_{\gamma} f(z)\,dz = F(\gamma(b)) - F(\gamma(a)).
$$

## Cauchy's theorem

Let $f : U \rightarrow \mathbb{C}$ be continuous
with $U$ open and convex.
Then the following are equivalent:
1. $f$ is [[Complex analytic function|analytic]] in $U$
2. $\int f(z)dz = 0$ for all closed paths in $U$
3. $f$ has a primitive in $U$

Proof: Define $F$ as a line segment integral from some $z_0 \in U$:
$F(z) = \int_{[z_0, z]} f(w)\,dw$.
Now by computation we can show that 1. $\implies$ 3. and 2. $\implies$ 3.
