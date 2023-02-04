Whitney forms provide a way to produce a piecewise smooth interpolating
function called the Whitney map from the discrete values on a [[Discrete Exterior Calculus|DEC]]
simplicial mesh/complex. They are defined on a per-simplex basis,
based on [[barycentric coordinates]], as follows:

Let $\sigma = [x_0, \dots, x_p]$ denote a $p$-simplex. Define $\lambda_0, \dots, \lambda_p$
as the barycentric functions for $x_0, \dots, x_p$ inside simplices these points
are part of and zero elsewhere.
The Whitney form $\mathcal{W}$ associated with $\sigma$ is

$$
\mathcal{W}(\sigma) = p! \sum_{i=0}^p (-1)^i
\lambda_i d\lambda_0 \wedge \dots \wedge \widehat{d\lambda_i}
\wedge \dots d\lambda_p
$$

where $\widehat{\quad}$ denotes that the term is omitted.

Concretely, the interesting one of these for my thesis is the 1-form

$$
\mathcal{W}(\sigma) = \lambda_0 d\lambda_1 - \lambda_1 d\lambda_0.
$$

where $\sigma = [x_0, x_1]$ is an edge of the mesh. This translates to
$\lambda_0 \nabla \lambda_1 - \lambda_1 \nabla \lambda_0$
in vector calculus notation. (see [[Barycentric coordinates]] for
how to compute $\nabla \lambda_i$)

## Whitney map

Denote by $K$ be the DEC simplicial complex, $\omega \in \mathcal{C}_p^*(K)$ a cochain on $K$,
and $S^p$ the set of all $p$-simplices in $K$. The Whitney map
$\mathcal{W} : C_p^*(K) \rightarrow F^p(K)$ is defined as

$$
\mathcal{W}(\omega)
= \mathcal{W}(\sum_{\sigma_i \in S^p} a_i \sigma_i)
= \sum_{\sigma_i \in S^p} a_i \mathcal{W}(\sigma_i)
$$

Slightly confusingly, the $\mathcal{W}$ in the rightmost expression is the Whitney
form for the simplex $\sigma_i$, whereas the same symbol in the leftmost expression
is the Whitney map for the cochain $\omega$.

In more concrete terms, the Whitney map for point $x$ is
evaluated by taking the boundary $p$-simplices of the $n$-simplex
that $x$ lies in (where $n$ is the dimension of the space) and
summing the values of each of their Whitney forms at $x$.
For instance, for 1-forms in 2D, we would find the triangle $x$ lies in
with sides $\sigma_0, \sigma_1, \sigma_2$ and associated values $a_0, a_1, a_2$ and take the sum

$$
a_0 (\mathcal{W}(\sigma_0))(x) + a_1 (\mathcal{W}(\sigma_1))(x) + a_2 (\mathcal{W}(\sigma_2))(x)
$$
