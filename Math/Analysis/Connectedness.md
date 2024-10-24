A metric space $(X, d)$ is _disconnected_
if there are two nonempty and disjoint open sets $U, V \subset X$
such that $U \cup V = X$,
in other words $U, V \neq \emptyset$, $U \cap V = \emptyset$, and $U \cup V = X$.
A space that isn't disconnected is _connected_.

Note: e.g. $[a, b]$ is open in the space $[a, b]$
even though it's not open in $\mathbb{R}$.

If $E \subset X$, then $E$ is connected
if the induced metric space $(E, d)$ is connected.

If for every $x, y \in X$ there is a [[path]] from $x$ to $y$,
$X$ is _path-connected_.
Every path-connected space is connected,
but not every connected space is path-connected.

## Examples

Empty sets $\emptyset$ and singletons $\{x\}$ are connected.

If $(X, \delta)$ is a discrete space,
then $X$ is connected $\iff$ $X = \{x\}$.

The rational numbers $\mathbb{Q}$ are disconnected.
They can be expressed as e.g.
$\mathbb{Q} = (\mathbb{Q} \,\cap\, ]-\infty, \sqrt{2}[) \cup (\mathbb{Q} \,\cap\, ]\sqrt{2}, \infty[)$,
since $\sqrt{2}$ is irrational and therefore not in $\mathbb{Q}$.

## Properties

$E \subset X$ is connected $\iff$ two sets $U, V \subset X$
with the following properties don't exist:
$U \cap E \neq \emptyset$, $V \cap E \neq \emptyset$, $U \cap V \cap E = \emptyset$, $E \subset U \cup V$.

The definition also works if $U, V$ are both closed sets
because then $V = X \setminus U$ and $U = X \setminus V$ are open.

If $A \subset X$ is connected and $U, V \subset X$
such that $U \cap V = \emptyset$ and $A \subset U \cup V$,
then either $A \subset U$ or $A \subset V$.

If $A \subset X$ is a set with the previously described property,
then $A$ is connected.

$X$ is disconnected $\iff$ there exists a [[Continuity|continuous]] surjection
$f : X \rightarrow \{0, 1\}$ (or equivalently $f : X \rightarrow \mathbb{N}$).

Consequently, $X$ is connected
$\iff$ all continuous maps from $X$ to $\mathbb{N}$ are constants.

If $E \subset X$ is connected and $E \subset A \subset \overline{E}$,
then $A$ is connected.
Particularly, $\overline{E}$ ([[Closure]]) is connected.

If $E \subset X$ is connected and $f : X \rightarrow Y$ is continuous,
then $f(E)$ is connected.

If $\{Y_{\alpha}\}_{\alpha \in A}$ is a set of $X$'s connected subsets
such that $\cap_{\alpha \in A} Y_{\alpha} \neq \emptyset$, then $\cup_{\alpha \in A} Y_{\alpha}$ is connected.