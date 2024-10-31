Let $f : (X_1, d_1) \rightarrow (X_2, d_2)$ be a bijection between metric spaces.
$f$ is a _homeomorphism_ if $f$ and $f^{-1}$ are continuous.

A homeomorphism maps open sets to open sets and closed sets to closed sets.
([[Open and closed sets]])
###### Proof
Let $f : X_1 \rightarrow X_2$ be a homeomorphism.
Because $f^{-1} : X_2 \rightarrow X_1$ is continuous (by definition),
for all open sets $U \subset X_1$, $(f^{-1})^{-1}(U) = f(U)$ is open
due to [[Continuity#Theorem Characterizing continuity via open and closed sets|theorem]].

As a consequence of this applied both ways,
$U \subset X_1$ is open $\iff$ $f(U) \subset X_2$ is open.

######
Consequently, [[Topology]] is preserved under homeomorphisms.

Spaces where a homeomorphism exists between them
are called _homeomorphic_.