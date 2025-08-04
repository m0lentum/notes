A representation of a [[group]] $G$ on [[vector space]] $V$
is a [[homomorphism]] $\rho : G \rightarrow GL(V)$
(see [[Group#Group action]], [[Matrix groups]]).

Two representations $\rho, \rho'$ are _equivalent_
is there is a bijective linear map $T : V \rightarrow V$ such that
$\rho(g)T = T\rho'(g)$ for all $g \in G$.

## Subrepresentations

Let $\rho : G \rightarrow GL(V)$ be a representation of $G$ on $V$
and $V'$ an _invariant_ subspace of $V$:
if $v \in V'$, then $\rho(g)v \in V'$ for all $g \in G$,
in other words $V'$ is closed under the group action of $G$
as represented by $\rho$.
Then we can define $\rho' : G \rightarrow GL(V')$ as $\rho'(g)v = \rho(g)v$,
called a subrepresentation of $\rho$ on $V'$.

This is similar to the restriction of a function
to a subset of its original domain:
we only change the domain, not the operation.

## Irreducible representations

$\{0\}$ and $V$ are always invariant subspaces for any $G,V,\rho$.
If these are the only ones, then $\rho$ is called _irreducible_.

If $G$ is compact, any representation of $G$
is equivalent to a direct sum of irreducible representations.

Example: $U(1)$ (unitary 1D group, aka complex unit circle),
with complex multiplication as the group product.
For any $n \in \mathbb{Z}$, $U(1)$ has a representation
$\rho_n : U(1) \rightarrow GL(\mathbb{C})$, $\rho_n(e^{i\theta})v = e^{ni\theta}v$.
These are irreducible simply because $\mathbb{C}$
does not have subspaces other than $\{0\}$ and $\mathbb{C}$.
(not to be confused with $\mathbb{R}^2$, which does have other subspaces!)

## Sources

Baez & Muniain (1994). Gauge fields, knots and gravity
