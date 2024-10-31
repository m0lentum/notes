Let $X$ be a nonempty set.
A _topology_ $\mathcal{T}$ on $X$ is a collection of subsets of $X$ such that
- $\emptyset, X \in \mathcal{T}$
- arbitrary unions stay in $\mathcal{T}$:
  if $U_i \in \mathcal{T}$ for all $i \in I$ then $\cup_{i \in I} U_i \in \mathcal{T}$
- finite intersections stay in $\mathcal{T}$:
  if $U_1, \dots, U_n \in \mathcal{T}$ then $\cap_{j=1}^{n} \in \mathcal{T}$

The pair $(X, \mathcal{T})$ is a _topological space_.

Sets in $\mathcal{T}$ are called _open_ (w.r.t. topology $\mathcal{T}$).
Sets whose complement is in $\mathcal{T}$ are called _closed_
(cf. [[Open and closed sets]] from analysis).

## Examples

Minitopology $\mathcal{T} = \{ \emptyset, X \}$

Discrete topology $\mathcal{T} = \mathcal{P}(x)$ ([[power set]] of X)

[[Metric]] topology $\mathcal{T}_d = \{ U \subset X : \forall x \in U \exists r > 0 \text{ s.t. } B(x, r) \subset U$
(in metric space $(X, d)$)
- relatedly, a topological space $(X, \mathcal{T})$
  is called _metrizable_ (fi: metristyvä)
  if there exists a metric $d : X \times X \rightarrow [0, \infty)$ such that $\mathcal{T} = \mathcal{T}_d$.

Sierpinski space $X = \{0,1\}$, $\mathcal{T} = \{\emptyset, \{0\}, X\}$

Particular point topology for point $x \in X$
$\mathcal{T} = \{U \in \mathcal{P}(X) : x \in U\}$
(set of all subsets of $X$ containing $x$)

Cofinite topology $\mathcal{T} = \{U \subset X : U^C \text{ finite}\}$

Co-countable topology $\mathcal{T} = \{U \subset X : U^C \text{ countable}\}$

## Terminology

Let $(X, \mathcal{T})$ t.s., $U \in \mathcal{T}$, $A \subset X$, $x \in X$.
$U$ is a _neighborhood_ of $x$ if $x \in U$.
$U$ is a neighborhood of $A$ if $A \subset U$.

If $\mathcal{T}_1, \mathcal{T}_2$ are topologies on $X$ and $\mathcal{T}_1 \subset \mathcal{T}_2$,
then $\mathcal{T}_1$ is said to be _coarser_ than $\mathcal{T}_2$
and $\mathcal{T}_2$ _finer_ than $\mathcal{T}_1$.

Let $(X, \mathcal{T})$ t.s., $A \subset X$, $x \in X$.
- $x$ is an _interior point_ of $A$, $x \in \text{int }A$
  if there exists a neighborhood of $x$ such that $A \subset U$.
- $x$ is an _exterior point_ of $A$, $x \in \text{ext }A$
  if it is an interior point of $A^C$.
- $x$ is a _boundary point_ of $A$, $x \in \partial A$ if it is neither of the above.
See also the less abstract definitions in [[Open and closed sets]].
Alternative definitions:
- $\text{int }A = \cup \{U \subset X : U \text{ open (i.e. } U \in \mathcal{T}), U \subset A\}$
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
