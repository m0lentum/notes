A subset $A$ of a [[Topology|topological space]] $X$ is called _dense_ (in $X$)
if $\overline{A} = X$ ([[Closure]]).

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
