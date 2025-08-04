Given an initial guess $x_0$, the FOM performs an [[Krylov subspace#Arnoldi method|Arnoldi]] factorization
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

## Variations

- restarted FOM
- incomplete orthogonalization method (IOM)
	- direct variant (DIOM)