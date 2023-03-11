[good wiki notes](https://optimization.cbe.cornell.edu/index.php?title=Conjugate_gradient_methods)

The Conjugate Gradient algorithm is a [[Krylov subspace]] [[Projection methods|projection method]]
specialized for symmetric positive definite matrices.
There are multiple equivalent formulations.
The best known one according to Saad
(in Iterative Methods for Sparse Linear Systems, 2003)
is the following:
Given the system $Ax = b$ and an initial guess $x_0$,

1. Compute initial residual and search direction
   $r_0 = b - Ax_0$, $p_0 = r_0$
2. For $j = 0,1,\dots,$,until convergence:
3. Compute the line search parameter
   that will make the next residual orthogonal to the previous,
   $\alpha_j := \frac{\langle r_j, r_j \rangle}{\langle Ap_j, p_j\rangle}$
4. Compute the next approximate solution
   $x_{j+1} := x_j + \alpha_j p_j$
5. Compute the next residual
   $r_{j+1} := r_j - \alpha_j A p_j$
6. Compute the line search parameter
   that will make the next search direction A-conjugate to the previous,
   $\beta_j := \frac{\langle r_{j+1}, r_{j+1} \rangle}{\langle r_j, r_j \rangle}$
7. Compute the next search direction
   $p_{j+1} := r_{j+1} + \beta_j p_j$

The name Conjugate _Gradient_ comes from the fact that
the method was first developed for minimizing a quadratic function

$$
F(x) = \frac{1}{2} x^T A x - bx
$$

whose minimum is found when

$$
\nabla F(x) = Ax - b = 0.
$$

## Related words

Conjugate: two vectors $x$ and $y$ are $A$-conjugate
w.r.t a positive definite square matrix $A$ when $y^TAx = 0$.
As with orthogonal vectors
(which could also be described as $I$-conjugate),
this relationship is invariant w.r.t. scaling.
[source](https://math.stackexchange.com/questions/523810/conjugate-vectors)

Relatedly, the $A$-inner product $\langle x, y \rangle_A$ is defined as $\langle Ax, y \rangle = (Ax)^Ty$.
This only works if $A$ is symmetric positive definite
because both those properties are required
for the definition of an inner product.
Positive definite means $\langle x, x \rangle > 0$ for all $x : ||x|| \neq 0$
and (conjugate) symmetry means $\langle x, y \rangle$ = $\overline{\langle y, x \rangle}$.

## Derivation

Saad (2003) provides a lengthy derivation I can't be bothered to write down,
starting with the Lanczos algorithm and then deriving the CG algorithm
from the fact that the residuals are all mutually orthogonal
and the search directions are all mutually A-conjugate.

Why are the residuals orthogonal and search directions A-conjugate?
This can be derived from the Krylov subspace's properties like Saad does,
but here's a shorter explanation
(based on a presently unpublished paper by Mönkölä et al.):

Given an A-conjugate set of search directions $\{\mathbf{p}_0, \mathbf{p}_1, \dots, \mathbf{p}_{n-1}\}$
where $n$ is the dimension of the system matrix $A$
and an initial guess $\mathbf{x}_0$, the solution $\mathbf{x}_*$
can be expressed as a linear combination

$$
\mathbf{x}_*
= \mathbf{x}_0 + \sum_{i=0}^{n-1} \alpha_i \mathbf{p}_i
= \mathbf{x}_k + \sum_{i=k}^{n-1} \alpha_i \mathbf{p}_i
$$

We can eliminate several terms from this
by multiplying with $\mathbf{p}_j^T A$, where $j$ is any index:

$$
\begin{aligned}
\mathbf{p}_j^T A (\mathbf{x}_* - \mathbf{x}_k)
&= \mathbf{p}_j^T A \sum_{i=k}^{n-1} \alpha_i \mathbf{p}_i \\
\mathbf{p}_j^T (b - A\mathbf{x}_k)
&= \sum_{i=k}^{n-1} \alpha_i \mathbf{p}_j^T A \mathbf{p}_i \\
-\mathbf{p}_j^T \mathbf{r}_k
&= \alpha_j \mathbf{p}_j^T A \mathbf{p}_j \\
\end{aligned}
$$

At the last step, $\mathbf{r}_k$ is the residual at $\mathbf{x}_k$
and the sum terms where $i \neq j$ are eliminated by $A$-conjugacy.

This gives us a formula for $\alpha_j$:

$$
\alpha_j = -\frac{\mathbf{p}_j^T \mathbf{r}_k}{\mathbf{p}_j^T A \mathbf{p}_j}
$$

Note that this reasoning gives the opposite sign for $\alpha_j$
compared to Saad's formulation.
This needs to be accounted for elsewhere in the algorithm.

In the series of approximate solutions earlier we have defined

$$
\mathbf{x}_{k+1} = \mathbf{x}_k + \alpha_k \mathbf{p}_k
= \mathbf{x}_k - \frac{\mathbf{p}_k^T \mathbf{r}_k}{\mathbf{p}_k^T A \mathbf{p}_k} \mathbf{p}_k
$$

TODO: updating the residual vector
