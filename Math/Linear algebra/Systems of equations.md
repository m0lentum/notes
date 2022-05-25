A linear system of equations can be represented as
$$
\mathbf{Ax} = \mathbf{b}
$$
where $\mathbf{A}$ is a $m \times n$ [[Matrices|matrix]], $\mathbf{x}$ is a vector of dimension $n$
and $\mathbf{b}$ is a vector of dimension $m$.
This is equivalent to a set of equations
$$
\begin{cases}
a_{11}x_1 + a_{12}x_2 + \dots + a_{1n}x_n = b_1 \\
a_{21}x_1 + a_{22}x_2 + \dots + a_{2n}x_n = b_2 \\
\quad \vdots \\
a_{m1}x_1 + a_{m2}x_2 + \dots + a_{mn}x_n = b_m \\
\end{cases}
$$
with $n$ unknowns and $m$ equations.

## Solution methods

TODO: write about:
- Gaussian elimination
- LU & Cholesky decomposition
- Jacobi, Gauss-Seidel & SOR
- Revise the numerical methods course's material for more

### Projection methods

Source for pretty much all of this is chapter 5 and 6 of (Saad 2003).

Generally in projection methods, an approximation for a solution
in $\mathbb{R}^n$ is found in an $m$-dimensional subspace $\mathcal{K}$ such that it
is orthogonal to another $m$-dimensional subspace $\mathcal{L}$.
Methods differ in the choice of subspaces. If $\mathcal{K} = \mathcal{L}$,
the method is called *orthogonal*. Otherwise, it is *oblique*.

TODO: re-read Iterative Methods chapter 5 and write down some more,
especially try to come up with intuitions

#### Krylov subspace methods

A Krylov subspace is of the form
$$
\mathcal{K}_m(A, v) = \text{span}\,\{v, Av, A^2v, \dots, A^{m-1}v\}.
$$
This is (by definition!) the subspace of all vectors that can be
represented as $p(A)v$ where $p$ is a polynomial of degree $m-1$ or less.
Why? Writing out the generic polynomial expression,
$$
\begin{align}
p(A)v &= (x_0 + x_1A + x_2A^2 + \dots + x_{m-1}A^{m-1})v \\
&= x_0v + x_1Av + x_2A^2v + \dots + x_{m-1}A^{m-1}v \\
\end{align}
$$
which is exactly a linear combination of the basis vectors
defined above for $\mathcal{K}_m(A,v)$.

##### Arnoldi method

The Arnoldi method is a way to find an orthonormal basis
for a Krylov subspace $\mathcal{K}_m(A,v)$. The simplest variant is very obvious
— start with some unit vector, then multiply it by $A$ and
orthonormalize the result, and repeat this until the
orthonormalization returns zero. There are variants of this
using different orthonormalization methods
(Gram-Schmidt, Modified Gram-Schmidt, Householder).

The Arnoldi method produces an orthonormal basis $V_m$ with $m$ (dimension
of the Krylov subspace) vectors that have $n$ (dimension of $A$) elements,
and a $(m+1) \times m$ [[Matrices#Upper lower Hessenberg|Hessenberg]] matrix $H_m$ for which
$$
V_m^TAV_m = H_m.
$$
Geometric intuition: Transforming by $H_m$ within $\mathcal{K}_m$ is equivalent
to changing basis from $\mathcal{K}_m$ to $\mathbf{R}^n$, transforming by $A$,
and changing basis back to $\mathcal{K}_m$.

##### Full orthogonalization method (FOM)

Given an initial guess $x_0$, the FOM performs an Arnoldi factorization
on the Krylov subspace defined by the _residual_ of the initial guess,
$r_0 = b - Ax_0$. Thus, $\frac{r_0}{||r_0||}$ is the first basis vector of $\mathcal{K}_m$,
meaning operating on $r_0$ is equivalent to operating
on $e_1$ (i.e. $(1, 0, 0, \dots)$) in the Krylov subspace.
After orthogonalization, we get the approximate solution
$$
x_m = x_0 + V_mH_m^{-1}(||r_0||e_1)
$$
Intuition: $H_m^{-1}$ is like the part of  $A^{-1}$ in $\mathcal{K}_m$.
Multiplying the residual by this gives an approximation for
how much $x_0$ was off by. Compare with how multiplying by $A^{-1}$
gives the difference from the exact correct answer $x$:
$$
A^{-1}r_0 = A^{-1}(b - Ax_0) = A^{-1}b - x_0 = x - x_0
$$
However, we don't know $A^{-1}$ and computing it is very expensive,
so we approximate it in the Krylov subspace instead,
where $H_m$ is a small, easy to invert matrix.

The residual as well as it times $H_m^{-1}$ are in $\mathcal{K}_m$.
$x_m$ obtained as above is the closest point to $x_{m-1}$
where the residual is zero if projected to $\mathcal{K}_m$,
i.e. it fulfills the Galerkin condition $b - Ax_m \perp \mathcal{K}_m$.

## Sources

Book: Saad, Y. (2003). Iterative Methods for Sparse Linear Systems.
