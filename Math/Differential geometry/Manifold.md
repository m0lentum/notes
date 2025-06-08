[wikipedia](https://en.wikipedia.org/wiki/Manifold)

An $n$-dimensional manifold $M$ is a [[Topology|topological space]]
that locally resembles Euclidean space $\mathbb{R}^n$,
i.e. every point in it has a neighborhood
[[Homeomorphism|homeomorphic]] to an open subset of $\mathbb{R}^n$.
E.g. curves and surfaces which don't intersect themselves
(an intersection point would not have a neighborhood like this).

There are many types of manifolds with some additional structure,
e.g. smooth / differentiable manifolds can be differentiated,
Riemannian / Lorentzian manifolds have a Riemannian / Lorentzian [[Metric (manifold)|metric]], etc.

One notable type of manifold is an _orientable_ manifold.
A smooth manifold is orientable iff
it admits a smoothly varying [[Volume form]].
Intuitively, this means we can't somehow walk around the manifold
and come back to the same point facing a different direction.
Examples of nonorientable manifolds where this can happen
are the _Möbius strip_ and the _Klein bottle_.

A manifold can be an abstract space of its own,
or it can exist inside another space via _embedding_ or _immersion_.
Roughly speaking, all manifold properties are preserved in an embedding
(no self-intersections, no loss of smoothness)
whereas an immersion allows self-intersections.
The Klein bottle is an example of a manifold that cannot be embedded in 3D
but can be immersed (and this is how it's usually visualized, with a self-intersection).
(source: Keenan Crane's discrete differential geometry course on youtube)

Another class of manifold is a _manifold with boundary_,
where the boundary is locally homeomorphic
to an open subset of the $n$-dimensional Euclidean closed half-space
instead of the entire space.