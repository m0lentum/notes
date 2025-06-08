Given a basis $\{e_i\}_{i=1}^n$ for $n$-dimensional vector space $V$,
there is an associated $n$-form $\omega \in \Lambda^nV$ (see [[Tangent space]])
defined as $\omega = e_1 \wedge \dots \wedge e_n$.
In general, the highest-dimensional [[Differential form]] in a space
is called a volume form (or sometimes pseudoscalar)
because it only has one basis vector, like the scalars.

Under a change of coordinates to $\{f_i\}$
given by the matrix $T$,
$f_1 \wedge \dots \wedge f_n = (\det T)\,e_1 \wedge \dots \wedge e_n$,
and the relative orientation of these bases
can be deduced from the sign of the volume form -
if $\det T > 0$, orientation of $\{f_i\}$ matches with $\{e_i\}$.
This has implications for the orientability of [[manifold]]s:
a manifold is orientable iff it admits a smoothly varying volume form.

A [[Metric (manifold)|metric]] $g$ induces a canonical volume form
(defined pointwise - $g$ varies from point to point!):
$\text{vol} = \sqrt{|\det g_{ij}|}\, dx^1 \wedge \dots \wedge dx^n$.
This agrees on all oriented [[chart]]s.