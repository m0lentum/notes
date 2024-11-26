Let $(X, \tau)$ be a [[Topology|topological space]].
A subcollection $\mathcal{B} \subset \tau$ is a _basis_ (fi: kanta) for $\tau$
if every open set $U \in \tau$ can be written as a union of sets in $\mathcal{B}$,
$$
U = \bigcup_{i \in I} B_i, \quad B_i \in \mathcal{B}
$$

A basis determines topology _uniquely_:
if $\tau$ is a topology on $X$ and $\mathcal{B}$ its basis,
then $\tau' = \{\bigcup_{i \in I} B_i : I \text{ index set}, B_i \in \mathcal{B} \,\forall\, i \in I\}$
is a topology on $X$ and $\tau' = \tau$.
We say $\tau$ is a topology _generated_ by basis $\mathcal{B}$.

### Examples

If $(X, d)$ is a [[metric]] space, then the collection of all open balls in $X$
$\mathcal{B} = \{B(x, r) : x \in X, r > 0\}$ is a basis for the metric topology $\tau_d$.
$\mathcal{B} = \{B(x, \frac{1}{n} : x \in X, n \in \mathbb{N}\}$ is also a basis
(and a _coarser_ one).

If $X$ is nonempty with discrete topology ($\tau = \mathcal{P}(X)$, [[Power set]]),
then singletons form a basis:
$\mathcal{B} = \{\{x\} : x \in X\}$.

Consider $\mathbb{R}$ and let $\mathcal{B} = \{[a, b) : a < b\}$.
By the basis lemma (see below) $\mathcal{B}$ is a basis for some topology $\tau$ on $\mathbb{R}$.
$\tau$ is called the _lower limit topology_
and $\mathbb{R}, \tau$ the _Sorgenfrey line_.

### Lemma (characterization of basis)

$\mathcal{B}$ is a basis for topology $\tau$
$\iff$ if $U \in \tau$ and $x \in U$
then there is $B \in \mathcal{B}$ s.t. $x \in B \subset U$.

### Basis lemma

Let $X \neq \emptyset$, $\mathcal{B} \subset \mathcal{P}(X)$.
$\mathcal{B}$ is a basis for some topology $\tau$ on $X$
$\iff$
- $\mathcal{B}$ is a cover of $X$ ($\bigcup \mathcal{B} = X$)
- for every $B_1, B_2 \in \mathcal{B}$ and $x \in B_1 \cap B_2$
  there is $B_3$ s.t. $x \in B_3 \subset B_1 \cap B_2$.

###### Proof

"$\implies$": Assume $\mathcal{B}$ is a basis for $\tau$.
$X \in \tau \implies$ $X$ can be expressed as a union of basis sets.
Finite intersections stay in $\tau$ (topology axiom 3)
$\implies B_1 \cap B_2 \in \tau \implies B_1 \cap B_2 = \bigcup_{i \in I} B_i$ for some index set $I$.

"$\impliedby$": Assume the two bullet points above.
Then $X \in \tau$ because $\mathcal{B}$ is a cover,
finite intersections are in $\tau$ by point 2 and induction,
and arbitrary unions are in $\tau$ because $\tau$ is generated
as the set of arbitrary unions of $\mathcal{B}$.

### Lemma (coarseness of basis)

Let $X \neq \emptyset$ and $\tau_1, \tau_2$ topologies on $X$
with bases $\mathcal{B}_1, \mathcal{B}_2$.
Then $\mathcal{B}_1 \subset \mathcal{B}_2 \implies \tau_1 \subset \tau_2$.

## Subbasis

Let $(X, \tau)$ be a topological space.
A subcollection $\mathcal{S} \subset \tau$ is a _subbasis_ (fi: esikanta) for $\tau$
if the set of all its finite intersections
$\{\bigcap_{i=1}^{n} S_i : n \in \mathbb{N}, S_i \in \mathcal{S} \,\forall\, i\}$
is a basis for $\tau$.

Thus we have a hierarchy:
subbasis -> finite intersections form basis -> arbitrary unions form topology.

Like a basis, a subbasis also generates a topology uniquely
(see definition at the start of the note).

### Examples

Half-infinite open intervals in $\mathbb{R}$
yield a subbasis for the standard topology on $\mathbb{R}$:
$\mathcal{S} = \{(-\infty, x) : x \in \mathbb{R}\} \cup \{(x, \infty) : x \in \mathbb{R}\}$.

Open strips in $\mathbb{R}^2$
yield a subbasis for the standard topology on $\mathbb{R}^2$:
$\mathcal{S} = \{(a, b) \times \mathbb{R} : a < b\} \cup \{\mathbb{R} \times (c, d) : c < d\}$

### Proposition (all covers are subbases)

Let $X \neq \emptyset$, $A \in \mathcal{P}(X)$.
If $A$ is a cover of $X$, then it is a subbasis for some topology $\tau$ on $X$.
Moreover, $\tau$ is the coarsest topology that contains $A$.

## Neighborhood basis

Let $(X, \tau)$ be a topological space and $x \in X$.
$\mathcal{B}(x) \subset \tau$ where $x \in B$ for all $B \in \mathcal{B}(x)$ 
is a neighborhood basis of $x$ if every open neighborhood of $x$
contains a member of $\mathcal{B}(x)$.
