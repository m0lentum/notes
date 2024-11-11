Let $f : (X_1, \tau_1) \rightarrow (X_2, \tau_2)$ be a bijection between topological spaces.
$f$ is a _homeomorphism_ if $f$ and $f^{-1}$ are [[Continuity (topology)|continuous]].

A homeomorphism maps open sets to open sets and closed sets to closed sets.
([[Open and closed sets]] for discussion in metric space context)
###### Proof
Let $f : X_1 \rightarrow X_2$ be a homeomorphism.
Because $f^{-1} : X_2 \rightarrow X_1$ is continuous (by definition),
for all open sets $U \subset X_1$, $(f^{-1})^{-1}(U) = f(U)$ is open
due to [[Continuity (metric)#Theorem Characterizing continuity via open and closed sets|theorem]].

As a consequence of this applied both ways,
$U \subset X_1$ is open $\iff$ $f(U) \subset X_2$ is open.

######
Consequently, [[Topology]] is preserved under homeomorphisms.

## Homeomorphism classes

Topological spaces $X, Y$ are _homeomorphic_
if a homeomorphism $f : X \rightarrow Y$ exists.
Notation: $X \approx Y$.

"$\approx$" is an equivalence relation
on the collection of all topological spaces:
- $X \approx X$ (reflexivity)
- $X \approx Y \implies Y \approx X$ (symmetry)
- $X \approx Y$ and $Y \approx Z \implies X \approx Z$ (transitivity)