Let $V$ be a vector space over $\mathbb{R}$
(i.e. the scalars that vectors can be multiplied by are real).
A _norm_ is a function $||\cdot|| : V \rightarrow [0, \infty[$ for which
- $||x|| = 0 \iff x = 0$
- $||\lambda x|| = |\lambda| |x|$  for all $\lambda \in \mathbb{R}, x \in V$
- $||x+y|| \leq ||x|| + ||y||$ for all $x,y \in V$

The pair $(V, ||\cdot||)$ is called a _normed space_
or _normed vector space_.

The usual norm in $\mathbb{R}^n$ is the _Euclidean norm_
$$
||x|| = \sqrt{\sum_{i=1}^{n} x_i^2}
$$
which is a special case of the $l^p$-norms
$$
||x||_p = \sqrt[p]{\sum_{i=1}^n x_i^p}.
$$

A norm induces a [[metric]]:
If $(V, ||\cdot||)$ is a normed space, then
$d : V \times V \rightarrow [0, \infty[, \quad d(x, y) = ||x - y||$
is a metric in $V$.
This metric is _shift invariant_:
$d(x,y) = d(x+v, y+v)$ for all $x,y,v \in V$.

## Equivalence

Two norms $||\cdot||_1$ and $||\cdot||_2$ in a vector space $V$
are _equivalent_ if there exists a constant $C > 0$ such that
$$
\frac{1}{C}||v||_1 \leq ||v||_2 \leq C||v||_1
$$
for any $v \in V$.
In this case, the metrics induced by these norms
are [[Lipschitz continuity|bi-Lipschitz]] equivalent.

### Theorem: equivalence of all finite-dimensional norms

All norms in $\mathbb{R}^n$ are equivalent.

Because every finite-dimensional vector space
with real coefficients is isomorphic to $\mathbb{R}^n$,
norms in them have a 1:1 mapping to norms in $\mathbb{R}^n$,
and therefore this result also applies to them.

##### Proof

We'll prove that all norms are equivalent to the Euclidean norm $||\cdot||_E$.
Let $\{e_1, \dots, e_n\}$ be a basis of $\mathbb{R}^n$. Then
$$
\begin{aligned}
||x|| &= ||x_1e_1 + \dots + x_ne_n|| \\
&\leq ||x_1e_1|| + \dots + ||x_ne_n|| \\
&\quad= |x_1|\,||e_1|| + \dots + |x_n|\,||e_n|| \\
&\quad=(|x_1|, \dots, |x_n|) \cdot (||e_1||, \dots, ||e_n||) \\
&\text{(Cauchy-Schwarz)} \\
&\leq ||(|x_1|, \dots, |x_n|)||_E \cdot ||(||e_1||, \dots, ||e_n||)||_E \\
&\quad=\sqrt{\sum_{i=1}^{n}|x_i|^2} \cdot \sqrt{\sum_{j=1}^{n}||e_j||^2} \\
&\leq ||x||_E \sqrt{n} \max ||e_j|| \\
\end{aligned}
$$
where $C_n = \sqrt{n} \max ||e_j||$ is constant and $||x|| \leq C_n||x||_E$.
This shows that $||\cdot||$ is $C_n$-Lipschitz and therefore continuous.
Also, $\Big| ||x|| - ||y|| \Big| \leq ||x-y|| \leq C_n||x-y||_E$.
We'll use this to prove a lower bound.
|
The Euclidean $(n-1)$-sphere $\mathbb{S}^{n-1} = \{ x \in \mathbb{R}^n : ||x||_E = 1 \}$
is a compact set and therefore the function $||x-y||_E$
reaches its minimum in it.
Let $\delta = \min \{||x|| : ||x||_E = 1\}$.
Because $0$ is not in $\mathbb{S}^{n-1}$, $\delta > 0$.
Now for all $x \neq 0$, $\tilde{x} = \frac{x}{||x||_E} \in \mathbb{S}^{n-1}$,
it's true that
$$
||\tilde{x}|| \geq \delta
\implies \delta \leq \frac{1}{||x||_E} \cdot ||x||
\implies \delta ||x||_E \leq ||x||
$$
The final inequality is also true when $x = 0$.
We can now pick $L = \max \{ \frac{1}{\delta}, C_n \}$ for which
$$
\frac{1}{L}||x||_E \leq ||x|| \leq L||x||_E
\implies ||\cdot|| \sim ||\cdot||_E
$$
It follows that any two norms in $\mathbb{R}^n$
are also equivalent with each other.
