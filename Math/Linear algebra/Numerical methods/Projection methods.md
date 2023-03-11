Generally in projection methods, an approximation for a solution
in $\mathbb{R}^n$ is found in an $m$-dimensional subspace $\mathcal{K}$ such that it
is orthogonal to another $m$-dimensional subspace $\mathcal{L}$.
Methods differ in the choice of subspaces. If $\mathcal{K} = \mathcal{L}$,
the method is called *orthogonal*. Otherwise, it is *oblique*.

## Krylov subspace methods

Krylov subspace methods are projection methods
where the projection space is a [[Krylov subspace]].
There are lots of slightly different methods based on this,
the simplest being the [[Full Orthogonalization Method]] (FOM)
and the closely related [[Generalized Minimum Residual Method]] (GMRES).
Special cases of these for specific classes of matrices are e.g.
the [[Symmetric Lanczos Algorithm]] for symmetric matrices 
and [[Conjugate Gradient algorithm]] for symmetric positive definite matrices.

## Sources

Book: Saad, Y. (2003). Iterative Methods for Sparse Linear Systems.