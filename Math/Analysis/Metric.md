A _metric_ is a generalization for the idea of _distance_.

Let $X$ be a set.
A map $d : X \times X \rightarrow [0, \infty[$ is a metric if
- $d(x, y) = 0 \iff x = y$
- $d(x, y) = d(y, x)$ for all $x,y \in X$
- $d(x,y) + d(y, z) \leq d(x,z)$ for all $x,y,z \in X$

The pair $(X, d)$ is called a _metric space_.

Examples:
- any [[Norm|normed space]] is also a metric space
	under the metric induced by the norm,
	e.g. ($\mathbb{R}^n$, $x,y \mapsto ||x - y||_2$) 
- discrete metric:
	$\delta(x,y) = \begin{cases}1,\text{ if }x \neq y \\ 0,\text{ if }x = y \end{cases}$
- angle metric on $S^{n-1} = \{x \in \mathbb{R}^n : ||x|| = 1\}$:
	$d_{S^{n-1}}(x, y) = \arccos(x \cdot y)$

A metric space is called _bounded_ if there is $x_0 \in X$
and $r > 0$ such that $X = B(x_0, r)$
(note: this is an equality because $x \subset B(x_0, r)$
and by definition $B(x_0, r) \subset X$)
Example: any space with the discrete metric
is bounded because $\bar{B}(x, 1) = X$.

## Induced metric

If $(X, d)$ is a metric space and $A \subset X$,
then $d|_{A \times A}$ (the _restriction_ of $d$ to domain $A \times A$)
is the metric induced by $d$ in $A$
and $(A, d|_{A \times A})$ is a metric space.
## Product metric

Let $(X, d_X)$ and $(Y, d_Y)$ be metric spaces.
In the product space $X \times Y$ we can define
a $p$-product metric for $p \geq 1$,
$$
d_p((x_1, y_1), (x_2, y_2)) = \sqrt[p]{d_X(x_1, x_2)^p + d_Y(y_1, y_2)^p}.
$$
This is analogous to the $l^p$ [[norm]].
Example: the $d_2$ metric for $\mathbb{R} \times \dots \times \mathbb{R}$ ($n$ times), 
is the Euclidean metric for $\mathbb{R}^n$.

All $p$-product metrics are [[Lipschitz continuity|bi-Lipschitz]] equivalent.

##### Theorem: continuous maps in product spaces

Let $(X, d_X)$, $(Y, d_Y)$, $(Z, d_Z)$ be metric spaces.
1. The projection maps $P_X : X \times Y \rightarrow X, \,P_X(x, y) = x$
	and $P_Y : X \times Y \rightarrow Y, \,P_Y(x, y) = y$
	are continuous.
2. $F : Z \rightarrow X \times Y$ is continuous $\iff$ the component maps
	$P_X \circ F : Z \rightarrow X$ and $P_Y \circ F : Z \rightarrow Y$
	are continuous.

It follows from this that the product of open sets is open
and the product of closed sets is closed.

###### Proof

Let $A \subset X$, $B \subset Y$ be open/closed sets.
Then $A \times B = P_X^{-1}(A) \cap P_Y^{-1}(B)$.
$P_X$ and $P_Y$ are continuous, and therefore ([[Continuity (metric)#Theorem Characterizing continuity via open and closed sets|theorem]])
the preimages of open/closed sets are open/closed
and thus this intersection is also open/closed.

## Equivalent metrics

Two metrics $d$ and $\tilde{d}$ are said to be _equivalent_
if they induce the same [[Topology]],
$\tau(X, d) = \tau(X, \tilde{d})$.
Equivalence is denoted $d \sim \tilde{d}$.
They are _[[Lipschitz continuity|bi-Lipschitz]] equivalent_ if
$$
\exists\, K \geq 0 :  \frac{1}{K} d(x,y) \leq \tilde{d}(f(x), f(y)) \leq Kd(x,y).
$$

##### Theorem: Continuous maps with equivalent metrics

Let $f : (X, d_X) \rightarrow (Y, d_Y)$, $d_X \sim \tilde{d}_X$, $d_Y \sim \tilde{d}_Y$.
Then $f$ is [[Continuity (metric)|continuous]] $\iff$ $f : (X, \tilde{d}_X) \rightarrow (Y, \tilde{d}_Y)$
is continuous.

###### Proof

Denote $\tilde{f} : (X, \tilde{d}_X) \rightarrow (Y, \tilde{d}_Y)$.
Because $d_X \sim \tilde{d}_X$, the identity map
$\text{id}_X : (X, d_X) \rightarrow (X, \tilde{d}_X)$ is a [[Homeomorphism]],
as is $\text{id}_Y : (Y, d_Y \rightarrow (Y, \tilde{d}_Y)$.
$$
\begin{CD}
(X, d_X) @>f>> (Y, d_Y) \\
@VV\text{id}_XV		@VV\text{id}_YV \\
(X, \tilde{d}_X) @>\tilde{f}>> (Y, \tilde{d}_Y) \\
\end{CD}
$$
This diagram illustrates that $\tilde{f} = \text{id}_Y \circ f \circ \text{id}_X^{-1}$
which is a composition of continuous maps and thus continuous.
The same goes for $f = \text{id}_Y^{-1} \circ \tilde{f} \circ \text{id}_X$. $\square$
