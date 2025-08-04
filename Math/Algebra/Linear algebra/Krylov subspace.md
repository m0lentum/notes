A Krylov subspace is a vector space of the form

$$
\mathcal{K}_m(A, v) = \text{span}\,\{v, Av, A^2v, \dots, A^{m-1}v\}
$$

where $A$ is a nonsingular matrix and $v$ is a vector.
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

Krylov subspaces are the basis for a class of [[Projection methods]]
particularly well suited for sparse [[Linear system]]s.

## Arnoldi method

The Arnoldi method is a way to find an orthonormal basis
for a Krylov subspace $\mathcal{K}_m(A,v)$. The simplest variant is very obvious
— start with some unit vector, then multiply it by $A$ and
orthonormalize the result, and repeat this until the
orthonormalization returns zero. There are variants of this
using different orthonormalization methods
(Gram-Schmidt, Modified Gram-Schmidt, Householder).

The Arnoldi method produces an orthonormal basis $V_m$ with $m$ (dimension
of the Krylov subspace) vectors that have $n$ (dimension of $A$) elements,
and a $(m+1) \times m$ [[Matrix#Upper lower Hessenberg|Hessenberg]] matrix $H_m$ for which

$$
V_m^TAV_m = H_m.
$$

Geometric intuition: Transforming by $H_m$ within $\mathcal{K}_m$ is equivalent
to changing basis from $\mathcal{K}_m$ to $\mathbb{R}^n$, transforming by $A$,
and changing basis back to $\mathcal{K}_m$.

The usefulness of Krylov subspaces in numerical methods
is based on the Hessenberg shape of this matrix.
Hessenberg systems can be somewhat straightforwardly
transformed into a triangular system
which can then be solved directly at a low cost
using forward/backward substitution.