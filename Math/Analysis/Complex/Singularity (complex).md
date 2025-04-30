A singularity (fi: erikoispiste) of a complex [[Meromorphic function]] $f$
is a point where $f$ is not defined,
typically corresponding to a division by zero.

Singularities can be categorized into
_removable singularities_ (fi: poistuva),
_poles_ (fi: napa), and _essential singularities_ (fi: oleellinen)
based on the [[Laurent series]] representation of $f$
in the neighborhood of each singularity $z_0$:
if the series coefficient $a_n = 0$ for all $n < 0$,
$z_0$ is removable;
if $a_n = 0$ for all $n < -k$ where $k > 0$ (and $a_{-k} \neq 0$),
$z_0$ is a pole of _order_ $k$,
and if $a_n \neq 0$ for infinitely many $n < 0$,
$z_0$ is an essential singularity.

## Identifying singularities

If $\lim_{z \rightarrow z_0} |f(z)| \leq \infty$, $z_0$ is a removable singularity.
This corresponds to the fact that the Laurent series of $f$ at $z_0$
does not have any terms that divide by $z$,
which would blow up to infinity in this limit.

Similarly, if there is $k > 0$ such that
$\lim_{z \rightarrow z_0} |(z - z_0)^k f(z)| < \infty$, $z_0$ is a pole.
Here multiplying by $(z - z_0)^k$ eliminates all the negative-exponent terms.

Another expression of the preceding fact is that
if $f(z) = \frac{g(z)}{(z - z_0)^k}$ where $g(z)$ is analytic in a punctured disk around $z_0$,
then $z_0$ is a pole (or order $k$ if $k$ is the minimum exponent where this is true).
If the denominator of $f$ is a polynomial,
we can express it as a product of its roots, e.g.
$$
f(z) = \frac{1}{(z-1)^3(z+2)(z-i)^2}
$$
and the preceding formula directly gives us the poles and their orders:
at $z_0 = 1$, $f(z) = (z - z_0)^{-3} \frac{1}{(z + 2)(z - i)^2}$,
where $\frac{1}{(z + 2)(z - i)^2}$ is analytic in a punctured disk around 1,
and therefore 1 is a pole of order 3.
Similarly, -2 is a pole of order 1
and $i$ is a pole of order 2.

Riemann continuation theorem:
Let $f$ be analytic in $D_r^*(z_0)$.
If there is $M > 0$ such that $|f(z)| \leq M$ for all $z \in D_r^*(z_0)$
(i.e. $f$ is bounded in $D_r^*(z_0)$),
then $z_0$ is a removable singularity.

See also: [[Residue]].