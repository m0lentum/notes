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
- Gauss-Jordan substitution (is that what it's even called? :P )
- LU & Cholesky decomposition
- Jacobi, Gauss-Seidel & SOR
- Revise the numerical methods course's material for more

### Projection methods

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
TODO: currently reading this chapter, write down some more
once I understand it

## Sources

Book: Saad, Y. (2003). Iterative Methods for Sparse Linear Systems.
