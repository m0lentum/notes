Let $(X, \tau)$, $(Y, \tau')$ be [[Topology|topological spaces]].
The map $f : X \rightarrow Y$ is continuous at a point $x \in X$
if for all neighborhoods $V$ of $f(x)$
there is a neighborhood $U$ of $x$ such that $f(U) \subset V$.
$f$ is _continuous_ if it is continuous at all $x \in X$.

(cf. [[Continuity (metric)]], a special case of this in metric context)

## Alternative characterizations

The following are all equivalent:
- $f$ is continuous
- $f^{-1}(U)$ is open for all open $U \subset Y$
- $f^{-1}(F)$ is closed for all closed $f \subset Y$
- $(Y, \tau')$ has a [[Basis (topology)|basis]] (or subbasis) $\mathcal{B} \subset \tau'$
  s.t. $f^{-1}(B)$ is open for all $B \in \mathcal{B}$

## Lemma: Continuity of composition

Let $X,Y,Z$ be topological spaces and $f : X \rightarrow Y, g : Y \rightarrow Z$ continuous.
Then $g \circ f : X \rightarrow Z$ is continuous.

## Sequential continuity

$f : X \rightarrow Y$ is _sequentially continuous_
if for any [[sequence]] $(x_n)$ s.t. $x_n \longrightarrow x$, $f(x_n) \longrightarrow f(x)$.

If $f$ is continuous, then it is sequentially continuous.
This is not an equivalence; the inverse is not always true!

See example of $\mathbb{R}$ with co-countable topology in [[Convergence (topology)]]
