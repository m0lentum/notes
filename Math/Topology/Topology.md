Let $X$ be a nonempty set.
A _topology_ $\tau$ on $X$ is a collection of subsets of $X$ such that
- $\emptyset, X \in \tau$
- arbitrary unions stay in $\tau$:
  if $U_i \in \tau$ for all $i \in I$ then $\cup_{i \in I} U_i \in \tau$
- finite intersections stay in $\tau$:
  if $U_1, \dots, U_n \in \tau$ then $\cap_{j=1}^{n} \in \tau$

The pair $(X, \tau)$ is a _topological space_.

Sets in $\tau$ are called _open_ (w.r.t. topology $\tau$).
Sets whose complement is in $\tau$ are called _closed_
(cf. [[Open and closed sets]] from analysis).

## Examples

Minitopology $\tau = \{ \emptyset, X \}$

Discrete topology $\tau = \mathcal{P}(x)$ ([[power set]] of X)

[[Metric]] topology $\tau_d = \{ U \subset X : \forall x \in U \exists r > 0 \text{ s.t. } B(x, r) \subset U$
(in metric space $(X, d)$)
- relatedly, a topological space $(X, \tau)$
  is called _metrizable_ (fi: metristyvä)
  if there exists a metric $d : X \times X \rightarrow [0, \infty)$ such that $\tau = \tau_d$.

Sierpinski space $X = \{0,1\}$, $\tau = \{\emptyset, \{0\}, X\}$

Particular point topology for point $x \in X$
$\tau = \{U \in \mathcal{P}(X) : x \in U\}$
(set of all subsets of $X$ containing $x$)

Cofinite topology $\tau = \{U \subset X : U^C \text{ finite}\}$

Co-countable topology $\tau = \{U \subset X : U^C \text{ countable}\}$

## Terminology

Let $(X, \tau)$ t.s., $U \in \tau$, $A \subset X$, $x \in X$.
$U$ is a _neighborhood_ of $x$ if $x \in U$.
$U$ is a neighborhood of $A$ if $A \subset U$.

If $\tau_1, \tau_2$ are topologies on $X$ and $\tau_1 \subset \tau_2$,
then $\tau_1$ is said to be _coarser_ than $\tau_2$
and $\tau_2$ _finer_ than $\tau_1$.

Let $(X, \tau)$ t.s., $A \subset X$, $x \in X$.
- $x$ is an _interior point_ of $A$, $x \in \text{int }A$
  if there exists a neighborhood $U$ of $x$ such that $A \subset U$.
- $x$ is an _exterior point_ of $A$, $x \in \text{ext }A$
  if it is an interior point of $A^C$.
- $x$ is a _boundary point_ of $A$, $x \in \partial A$ if it is neither of the above.
See also the less abstract definitions in [[Open and closed sets]].
Alternative definitions:
- $\text{int }A = \bigcup \{U \subset X : U \text{ open (i.e. } U \in \tau), U \subset A\}$
- $\partial A = \{x \in X :$ every neighborhood of $x$ meets both $A$ and $A^C\}$
- $\overline{A} = \{ x \in X :$ every neighborhood of $x$ meets $A\}$
  $= \text{int }A \cup \partial A = A \cup \partial A$
  (definition of [[Closure]] same as in metric spaces)
Also,
- $x$ is an _accumulation point_ of $A$ if every neighborhood
  of $x$ contains a point in $X$ other than $x$ itself:
  $U \cap (A \setminus \{x\}) \neq \emptyset$ for all neighborhoods $U$ of $x$
- $x$ is an _isolated point_ if it is not an accumulation point,
  i.e. $\exists$ a neighborhood $U$ of $x$ s.t. $U \cap A = \{x\}$.
See also [[Closure]].
$A$ is called _discrete_ if all its points are isolated points.
