[intro paper](https://warwick.ac.uk/fac/sci/hetsys/studentinformation/induction/mathsinduction/pde/pde.pdf)

This is necessary because the "strong" form of the PDE as defined above
requires that the solution $u$ is twice differentiable.
Such solutions may not exist in practice, so we come up with a related
but not strictly equivalent formulation that admits more solutions.

Equality of two vectors can be investigated indirectly by comparing
their inner products with other vectors. In finite dimensions,

$$
u = v \in \mathbb{R}^d \iff \forall \varphi \in \mathbb{R}^d
, u \cdot \varphi = v \cdot \varphi \in \mathbb{R}
$$

where $\varphi$ is called a _test vector_ (or test function, if the vectors are functions).

In infinite dimensions this implication only holds from left to right,
and we're looking for $u$ in infinite-dimensional function space.
This is why the solution based on this is weak - satisfying the
inner product equality with all test vectors does not imply actual equality.

To derive the weak form, we first multiply the equation
by an arbitrary test function, then integrate over the solution domain.
Because we just did a multiplication, we can always do integration by parts here
(I think?), giving a formula with an integral over the domain and another
integral over its boundary. Here we can insert boundary conditions to the formula,
which particularly simplifies a lot in the case of the Dirichlet condition $u = 0$.

The integral makes the second-order derivative of $u$ disappear.
The problem is now a first order equation that needs to hold for
every test function, and can thus be formulated as a system of equations
with a row for every test function.

See the derivation done for a Laplace equation in the intro paper linked earlier.

TODO: Sobolev spaces, work through the definition of weak derivative.
What's a closure of a space?
