A metric space is _complete_ if all [[Cauchy sequence]]s within it
converge to a limit within that space.
Complete spaces are nice because Cauchy sequences allow
proofs of convergence using only sequence elements,
without needing to know the actual limit being converged to
([wikipedia](https://en.wikipedia.org/wiki/Cauchy_sequence)).

Completeness is strongly related to the closedness of sets ([[Open and closed sets]]).
In particular, if $(X, d)$ is a complete space and $K \subset X$ is a closed set,
then $(K, d)$ is a complete space.

$R^n$ is complete.
###### Proof
Let $\mathbf{x}_m$ be a Cauchy sequence in $\mathbb{R}^n$.
Then all coordinate sequences $x_m^{(k)}$ are Cauchy sequences in $\mathbb{R}$
because
$$
|x_j^{(k)} - x_m^{(k)}| \leq
\sqrt{\sum_{l=1}^n(x_j^{(l)} - x_m^{(l)})^2}
= d(\mathbf{x}_j, \mathbf{x}_m)
$$
Because the real numbers are a complete space
(TODO: what's the proof of this),
then there exists a set of limit coordinates $x^{(k)} \in \mathbb{R}$ 
such that $x_m^{(k)} \rightarrow x^{(k)}$ for all $k = 1,2,\dots,n$,
and $\mathbf{x}_m \rightarrow (x^{(1)}, x^{(2)}, \dots, x^{(n)})$.

(the last statement relies on the fact that a point sequence
converges to the combined limit of its coordinate sequences,
which is true because for all $k$
$$
|x_m^{(k)} - x^{(k)}|
\leq d(\mathbf{x}_m, \mathbf{x})
\leq \sqrt{n} \max_{1 \leq l \leq n} |x_m^{(l)} - x^{(l)}|
$$
where $\mathbf{x}$ is the limit)

###### 
The rational numbers $\mathbb{Q}$ are an example of an incomplete space.
Intuitively speaking, it has gaps where irrational numbers go,
and Cauchy sequences in $\mathbb{Q}$ that would converge on these gaps in $\mathbb{R}$
can be constructed. See [wikipedia](https://en.wikipedia.org/wiki/Complete_metric_space).

## Completion

Let $(X, d)$ be a metric space.
A complete space $(\hat{X}, \hat{d})$ is a _completion_ of $X$
if an isometric embedding ([[Isometry]])
$j : X \rightarrow \hat{X}$ exists such that $\overline{j(X)} = \hat{X}$ ([[Closure]]).
In other words, $j(X)$ is _dense_ in $\hat{X}$
and $\hat{X}$ is the smallest possible complete space
that $X$ can be embedded in.

### Theorem: Uniqueness of completion

A completion is unique up to isometry:
If $i : X \rightarrow Y$ and $j : X \rightarrow Z$
are completions of $X$ ($\overline{i(X)} = Y$ and $\overline{j(X)} = Z$),
then an isometry $h : Y \rightarrow Z$ exists such that $h \circ i = j$.

### Theorem: Existence of completion

A completion always exists.
###### Proof

Kuratowski embedding:
Select a point $x_0 \in X$.
For any $x \in X$, define $K_x : X \rightarrow \mathbb{R}$,
$K_x(y) = d(x, y) - d(x_0, y)$.
$K_x$ is bounded and continuous, $K_x \in C_b(X, \mathbb{R})$.

Now $K : X \rightarrow C_b(X, \mathbb{R})$
is an isometric embedding: $d(K_x, K_y) = ||K_x - K_y||_{\infty} = d(x, y)$.
The normed space $(C_b(X, \mathbb{R}, ||\cdot||_{\infty})$ is complete
(TODO: prove this).
Let $\hat{X} = \overline{K(x)} \subset C_b(X, \mathbb{R})$
$\hat{X}$ is a closed subset of a complete space $\implies$ complete.

Now $K : X \rightarrow \hat{X}$ is an isometric embedding,
$\hat{X}$ is complete and $\overline{K(X)} = \hat{X}$
$\implies$ $\hat{X}$ is a completion of $X$.
