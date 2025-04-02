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

Existence of the primitive is determined by [[Cauchy's theorem]].