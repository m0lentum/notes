A subset $A$ of a [[Topology|topological space]] $X$ is called _dense_ (in $X$)
if $\overline{A} = X$ ([[Closure]]).
Another equivalent characterization is $\text{ext }A = \emptyset$.

### Examples

$\mathbb{Q}$ is dense in $\mathbb{R}$ with standard topology.
Also, $\mathbb{Q}^n$ is dense in $\mathbb{R}^n$.

In $\mathbb{R}$ with co-finite topology, $]0, 1[$ is dense.

$X := (C([0,1]), ||\cdot||_{\infty})$ (normed space of continuous real functions on $[0,1]$).
Stone-Weierstrass theorem says polynomials $p : [0,1] \rightarrow \mathbb{R}$
are a dense subset of $X$.

## Separable spaces

A topological space is called _separable_
if it has a **countable** dense subset.

All [[Countability axioms|second countable]] spaces are separable.
The converse is not always true.

### Examples

$\mathbb{R}^n$ (with standard topology) is separable because $\mathbb{Q}^n$ is countable

$(X, \{\emptyset, X\})$ is always separable
because the closure of any subset is $X$

$\mathbb{R}$ with co-countable topology is not separable
because all countable sets are closed

$X$ any uncountable set, $p \in X$, $\tau$ the particular point topology on $X$
(all subsets of $X$ containing $a$).
$X$ is separable because $\overline{\{p\}} = X$.
$(X \setminus \{p\}, \tau_{X \setminus \{p\}})$ is not separable
because $\tau_{X \setminus \{p\}} = \mathcal{P}(X \setminus \{p\})$ ([[Power set]], discrete topology)
where all sets are open and closed
$\implies$ the closure of a countable set can't be the uncountable $X$

### Lemma: Separability of coarser topology

Let $X$ be a nonempty set, $\tau_1, \tau_2$ topologies on $X$, $\tau_1 \subset \tau_2$.
Now $(X, \tau_2)$ separable $\implies$ $(X, \tau_1)$ separable.

### Proposition: separability of product space

Let $(X_n, \tau_n), n \in \mathbb{N}$ be separable topological spaces.
Then the [[Induced topology#Product topology|product space]] $\prod_{n=1}^{\infty} X_n$ is separable.
###### Proof
For each $n \in \mathbb{N}$, take $Q_n \subset X_n$ countable and dense.
Problem: $\prod_{n=1}^{\infty} Q_n$ is not countable.
Fix some $c = (c_1, c_2, \dots)$ such that $c_n \in Q_n \forall n$
and define $\tilde{Q}_n = \prod_{k=1}^{n} Q_k \times \prod_{k=n+1}^{\infty} \{c_n\}$ which is countable.

Now show that $Q = \bigcup_{n=1}^{\infty} \tilde{Q}_n$ is countable and dense in $\prod_{n=1}^{\infty} X_n$
by showing that $U \cap Q \neq \emptyset$ for all open $U \subset \prod_{n=1}^{\infty} X_n$:
We can assume $U$ is a basis element of the product topology,
i.e. $U = \prod_{n=1}^{\infty} U_n$ such that $U_n \in \tau_n \forall n$
and $U_n \neq X_n$ for finitely many $n$.
Then $M := \max\{n : U_n \neq X_n\}$ exists
and $U = \prod_{n=1}^{M} U_n \times \prod_{n=M+1}^{\infty} X_n$.
$Q_n$ is dense in $X_n \implies \exists\, q_n \in U_n \cap Q_n$.
Now $q = (q_1, \dots, q_M, c_{M+1}, \dots) \in Q \cap U$.
Because $U$ is an arbitrary open set, this shows that $Q$ is dense.

### Proposition: separability in metrizable space

If $(X, \tau)$ is metrizable (i.e. exists a metric $d$ such that $\tau = \tau_d$)
then second countability and separability are equivalent.
