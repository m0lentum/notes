The definition if the same as in metric spaces ([[Compactness (metric)]]):
A [[Topology|topological space]] $(X, \tau)$ is compact
if every open cover of $X$ has a finite subcover.

Many of the properties of compact metric spaces
don't hold in general topological spaces
or only hold in [[Hausdorff space]]s.

An equivalent characterization of a compact space
is the "finite intersection property":
If $\{F_i : i \in I\}$ is a collection of closed sets
such that $\bigcap_{i \in I} F_i = \emptyset$,
then exists a finite subcollection $J \subset I$
such that $\bigcap_{i \in J} F_i = \emptyset$
(intuitively, this is just the complement of the definition).

## Properties

Cantor's intersection theorem:
Let $X$ be a compact topological space,
$E_1, E_2, \dots$ a sequence of closed nonempty sets
nested such that $E_1 \supset E_2 \supset \dots$
Then $\bigcap_{n=1}^{\infty} E_n \neq \emptyset$.

Let $X, Y$ be topological spaces, $A \subset X$ compact, $f : X \rightarrow Y$ [[Continuity (topology)|continuous]].
Then $f(A)$ is compact.

$X$ compact, $X \approx Y$ (i.e. $X$ and $Y$ [[Homeomorphism|homeomorphic]]).
Then $Y$ is compact.

$X$ compact, $f : X \rightarrow \mathbb{R}$ continuous.
Then $f$ meets its maximum and minimum values.
(Weierstrass theorem)

$X$ compact, $A \subset X$ closed.
Then $A$ is compact.

$E_1, \dots, E_n \subset X$ a finite collection of compact sets.
Then $\bigcup_{i=1}^{n} E_i$ is compact.

Intersection of compact sets is not always compact.
Counterexample: $X = \mathbb{R} \cup \{0^*\}$ ("artificial origin")
with topology defined as the open sets of the standard topology on $\mathbb{R}$
plus for any set that contains $0$,
also include that set with all combinations of $0$ and $0^*$.
In this space, $A = [0, 1]$ and $B = ]0, 1] \cup \{0^*\}$ are compact
but $A \cap B = ]0, 1]$ is not.

If $X$ is compact _and_ [[Hausdorff space|Hausdorff]], then
- compact subsets are closed
- intersection of any number of compact subsets is compact

If $X$ is Hausdorff and
- $A \subset X$ is compact and $x \in X \setminus A$,
  then $A$ and $x$ have disjoint neighborhoods
- $A, B \subset X$ are compact and disjoint,
  then $A$ and $B$ have disjoint neighborhoods
(cf. regular and normal spaces [[Separation axioms]])
Corollary: if $X$ is compact and Hausdorff, then it is normal.

## Sequential compactness

A topological space is sequentially compact
if every [[sequence]] has a convergent subsequence.

In metrizable spaces compactness and sequential compactness are equivalent,
but in general neither implies the other.