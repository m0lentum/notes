A metric space is _complete_ if all [[Cauchy sequence]]s within it
converge to a limit within that space.
Complete spaces are nice because Cauchy sequences allow
proofs of convergence using only sequence elements,
without needing to know the actual limit being converged to
([wikipedia](https://en.wikipedia.org/wiki/Cauchy_sequence)).

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