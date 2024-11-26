A [[sequence]] $(x_n)$ in a [[Topology|topological space]] $(X, \tau)$
converges to a point $x \in X$
if for any neighborhood $U$ of $x$ there exists an index $N \in \mathbb{N}$
such that if $n \geq N$ then $x_n \in U$.
(see [[Sequence#Convergence]] for the equivalent definition in metric context)

In general topological spaces, limits are not unique.
Example: Sierpinski space $(\{0,1\}, \{\emptyset, \{0\}, \{0,1\}\})$.
Here the sequence $(1, 1, 1, \dots)$ converges to 1 as expected,
but $(0, 0, 0, \dots)$ converges to both 0 and 1:
all neighborhoods of 0 obviously contain 0,
but also the only neighborhood of 1 is $\{0, 1\}$
which contains 0 and hence contains all the elements of this sequence.

On the other hand, in [[Hausdorff space]]s limits are unique.

[[Induced topology#Continuity (topology) Continuity and Convergence (topology) convergence|Results in induced topologies]] 

## Example: $\mathbb{R}$ with co-countable topology

Consider $(\mathbb{R}, \tau_{co})$ where $\tau_{co}$ is the co-countable topology
(i.e. sets whose complement is countable).
Only sequences that are constant past some index converge,
because otherwise for any potential limit point we can construct a neighborhood
by removing all sequence elements that aren't equal to that point from $\mathbb{R}$,
resulting in a set whose complement is countable ($\implies$ is open).
If we try to do this when the sequence is constant past some index however,
we'll end up also removing the limit point itself from the set,
making it no longer a neighborhood of this point.

Now for $A = ]0, 1[$, $\overline{A} = \mathbb{R}$ ([[Closure]])
because closed sets in this topology are either countable, empty, or $\mathbb{R}$,
and there is no countable set containing $A$.
No sequence in $A$ converges to boundary point $a = 0$
due to the previous reasoning (only tail-constant sequences converge).

$\text{id} : (\mathbb{R}, \tau_{co}) \rightarrow (\mathbb{R}, \tau_E)$ where $\tau_E$ is the standard (Euclidean) topology
is sequentially continuous but not continuous ([[Continuity (topology)]]).
The standard topology has convergent sequences that aren't constant past an index,
and therefore their preimages do not converge in the co-countable topology.

## Lemma: convergence in terms of neighborhood basis

Let $X$ be a topological space, $x \in X$, $\{B_i : i \in I\}$ a [[Basis (topology)#Neighborhood basis|neighborhood basis]] of $x$.
Suppose $(x_n)_{n=1}^{\infty} \subset X$.
Then $x_n \longrightarrow x$ $\iff \forall\, B_i \,\exists\, N$ s.t. $n \geq N \implies x_n \in B_i$.
