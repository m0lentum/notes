Certain subcategories of matrices (/linear maps)
form [[group]]s with matrix multiplication (/composition) as the group operation.
Specifically, any set of matrices
that is closed under multiplication forms a group.
Some of these groups:

- general linear group $GL(n, \mathbb{R})$:
  invertible $n \times n$ matrices with real coefficients.
  - is a subgroup of $GL(n, \mathbb{C})$
- special linear group $SL(n, \mathbb{R})$:
  subgroup of $GL(n, \mathbb{R})$ with determinant 1
  - volume-preserving transformations
- orthogonal group $O(p,q)$:
  preserves [[Metric (manifold)]] $g$ with signature $(p,q)$,
  i.e. $g(Tv,Tw) = g(v,w)$ for $T \in O(p,q)$
- special orthogonal group $SO(p,q)$: $O(p,q)$ plus determinant 1
  - with Euclidean metric denoted $O(n)$, $SO(n)$
  - $SO(3)$ is the group of rotations in $\mathbb{R}^3$
  - $SO(3,1)$ is called the _Lorentz group_
- unitary group $U(n)$: complex equivalent to $O(n)$,
  preserving inner product $\langle v, w \rangle = \sum_{i=1}^n \overline{v}^i w^i$
- Poincaré group: symmetries of Minkowski space (see [[Metric (manifold)]]):
  [[diffeomorphism]]s that preserve spacetime intervals
  - compositions of translation, [[Lorentz transformation]],
	  parity ($(t,x,y,z) \mapsto (t,-x,-y,-z)$) and time reversal

These groups are all [[Lie group]]s.

As subgroups of $GL(V)$, matrix groups have a _fundamental representation_
consisting of that matrix unmodified.
Other [[representation]]s exist as well.

## Sources

Baez & Muniain (1994). Gauge fields, knots and gravity