Like [[induced topology]], co-induced topology
is defined by asking that a map or family of maps is continuous,
but this time with the maps going the opposite direction.

Definition: Let $(X, \tau)$ be a [[Topology|topological space]],
$Y$ a nonempty set, $f : X \rightarrow Y$ a map.
Then $\tau' := \{U \subset Y : f^{-1}[U] \in \tau\}$ is the topology on $Y$
co-induced by $f$, a.k.a. _final topology_.

$\tau'$ is the _finest_ topology on $Y$ that makes $f$ continuous
(any subset of it would also make $f$ continuous,
up to and including the minitopology which isn't very interesting).

### Quotient topology

Let $X$ be a set, $\sim$ an [[equivalence relation]] on $X$.
The _quotient topology_ on the [[quotient set]] $X/{\sim} := \{[x] : x \in X\}$
is the topology coinduced by the canonical projection
$\tau' = \{U \subset X/{\sim} : p^{-1}[U] \in \tau\}$.

## Many maps

$(X_i, \tau_i)$ topological spaces, $Y$ nonempty, $f_i : X_i \rightarrow Y$.
The topology on $Y$ co-induced by the family of maps $\{f_i : i \in I\}$ is
$\tau' := \{U \subset Y : f^{-1}[U] \in \tau_i \text{ for all } i \in I\}$
(i.e. the intersection of all individual co-induced topologies).

### Disjoint union topology

Let $X_i, i \in I$ be nonempty sets.
The disjoint union of $\{X_i\}$ is
$$
\bigsqcup_{i \in I} X_i := \{(x, i) : x \in X_i, i \in I\}
$$
(i.e. points of all sets tagged with a set identifier).
$\varphi_j : X_j \rightarrow \bigsqcup X_i$, $\varphi_j(x) = (x, j)$
is called the _canonical injection_
and the distjoint union topology on $\bigsqcup X_i$
is the topology co-induced by the canonical injections $\{\varphi_j : j \in I\}$.
