The tangent space of a [[manifold]] $M$ at point $p \in M$,
denoted $T_pM$,
is a vector space parallel with $M$ at $p$
with dimension equal to that of $M$.
Given a coordinate [[chart]] $\varphi : \mathbb{R}^n \rightarrow M$,
it can be thought of as the span of the [[differential]] $d\varphi$ at $p$.

The tangent space has a natural dual space
called the _cotangent space_ $T_p^*M$ which consists of the _covectors_ (1-forms)
parallel to $M$ at $p$.
A covector is a linear function that takes a vector and produces a scalar.
Given a [[Metric (manifold)]] $g$, we can define the isomorphism
$v \mapsto g(v, \cdot)$ which converts a tangent vector $v$ to a cotangent vector
that measures another vector in the direction of $v$.
This map is referred to as "raising and lowering indices" in [[Einstein notation]].

A related space is the space of k-forms ([[Differential form]]) at $p$,
denoted $\Lambda^kT_p^*M$
(of which the cotangent space is a special case).
Similarly, we could define the space of k-vectors $\Lambda^kT_pM$
(less often seen in literature).