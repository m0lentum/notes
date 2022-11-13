[intro paper](https://doi.org/10.1016/j.jcp.2013.08.007)

A differential form is, intuitively, whatever comes after the integral sign
in an integral. Depending on the dimension of the thing being integrated over,
they are called 1-forms, 2-forms etc. 1-forms correspond to line integrals
(e.g. $v^1 = \mathbf{v} \cdot d\mathbf{l}$), 2-forms to surface integrals (e.g. $w^2 = \mathbf{w} \cdot d\mathbf{A}$) etc.
There are also 0-forms which are equivalent to simple scalar functions.

"Discrete forms" as used in DEC computations are these forms integrated over
an element of a mesh, i.e. a scalar quantity like $a^3 = \int_{\Omega_i} adV$
on a volume element $\Omega_i$. Because of this connection with integrals,
the solution of a system of discrete forms is exactly the solution to
the corresponding continuous PDE (TODO: check the cited source and understand why).

In 3D, 0-forms and 3-forms are natural choices for representing directionless
(i.e. scalar) quantities on points and volumes respectively,
and 1- and 2-forms similarly best represent values with
direction (i.e. vectors). This is because a lines and surfaces
(which 1- and 2-forms are integrated over) have a well-defined notion
of a direction, but points and volumes don't.
In 2D, there are no forms of higher dimension than 2, and 2-forms represent
area integrals (as they do in 3D, but without a meaningful direction
since they're all in the same plane).

## Operators

### Wedge product

Multiplication between differential forms is done using the exterior product
a.k.a. wedge product, $\wedge$. It behaves similarly to the same operator from
[[geometric algebra]], producing higher-dimensional forms and alternating signs
when commuted according to $a^j \wedge b^k = (-1)^{jk}b^k \wedge a^j$.

In 3D, a wedge product between a 0-form and anything behaves like a scalar
multiplication, one between two 1-forms behaves like a cross product,
and one between a 1-form and a 2-form behaves like a dot product.
Other combinations don't exist because they would produce forms of higher
dimension than 3.

In 2D, 0-forms still behave like scalars, but the only other option
is a product between two 1-forms, which behaves like a curl or a
"perp-dot" product (dot product with one argument rotated 90°).

### Exterior derivative

Much like the wedge product behaves like scalar cross and dot products,
the exterior derivative behaves like the multidimensional differentiation
operators gradient $\nabla$, curl $\nabla \times$ and divergence $\nabla \cdot$.
Opposite to differentiation of a polynomial, this actually increases the dimension
of the form by one. This becomes intuitive when you work through the dimensions:
differentiate a scalar field and you get the gradient which is a vector.
Take the curl of a vector field and you get another vector, which corresponds
to taking the exterior derivative of a 1-form. And finally, take the divergence
of a vector field and you get a scalar, which is what the exterior derivative
does to a 2-form.

On discrete forms, the exterior derivative maps the set of boundary
$(n-1)$-cells of a $n$-cell to the value of the $n$-cell, which can be derived
using the divergence theorem / Stokes' theorem. Intuitively, summing over
1-forms on a closed edge loop is like "rotating" around the enclosed surface,
which makes it measure curl, and summing over faces of a volume element is
like measuring fluxes over those faces, which makes it act like divergence.

In 2D, this sequence is again stopped short due to the missing dimension,
and the derivative of 1-forms can be interpreted as either a curl or
a divergence of a rotated field (similar to how the exterior product
is a "2D cross" or "perp-dot" product).

### Hodge star

[wikipedia page](https://en.wikipedia.org/wiki/Hodge_star_operator)

In $n$-dimensional space, the Hodge star $\star$ is an isomorphism
associating $k$-forms with $(n-k)$-forms (see [[Differential form]]).
Intuitively, it associates scalars with volume-forms
and vectors with bivectors (in 3D) or vectors with orthogonal
vectors (in 2D).

You can think of bivectors in 3D as defining a plane
and the corresponding Hodge dual vector as the normal to that plane.
It is equivalent to the correspondence between a cross product
vector and the corresponding wedge product bivector,

$$
\star (u \wedge v) = u \times v
$$

and vice versa.

The Hodge star preserves magnitude when applied twice
but may change orientation depending on dimension of the space
and forms in question:

$$
\star\star\eta = (-1)^{k(n-k)}\eta
$$

In 2D Euclidean space (n = 2):
- $\star 1 = dx \wedge dy$
- $\star dx = dy$
- $\star dy = -dx$
- $\star (dx \wedge dy) = 1$
In 2D applying the star twice changes sign for 1-forms.

In 3D Euclidean space (n = 3):
- $\star 1 = dx \wedge dy \wedge dz$
- $\star dx = dy \wedge dz$
- $\star dy = dz \wedge dx$
- $\star dz = dx \wedge dy$
- $\star (dx \wedge dy) = dz$
- $\star (dy \wedge dz) = dx$
- $\star(dz \wedge dx) = dy$
- $\star (dx \wedge dy \wedge dz) = 1$
In 3D applying the star twice never changes sign.

TODO: proxy vectors and musical isomorphisms, codifferential