The _residue_ of a complex [[meromorphic function]]
at a [[Singularity (complex)|singularity]] $z_0$
is the first negative coefficient of its [[Laurent series]]:
if $f(z) = \sum_{-\infty}^{\infty} a_n (z - z_0)^n$,
then $\text{Res}(f, z_0) = a_{-1}$.

The residue is important in the computation of integrals.
The reason for this is that for all $n \neq -1$,
$a_n (z - z_0)^n$ has a [[primitive]]
and therefore by [[Cauchy's theorem]],
its integral over closed paths vanishes.
Thus the integral of a meromorphic function
over any closed path depends only on the residues at its singularities.
This is the _residue theorem_ (stated fully later in this note).

## Computing residues

If $z_0$ is a first-order pole of $f$ (see [[Singularity (complex)]]), then
$$
(z - z_0)f(z) = \sum_{n=-1}^{\infty} a_n(z - z_0)^{n+1}
\overset{z \rightarrow z_0}{\longrightarrow} a_{-1} = \text{Res}(f, z_0)
$$
because multiplying by $(z - z_0)$ sets the -1th term
as the constant term in the series
and all terms above this tend to zero when $z \rightarrow z_0$.
Therefore, we can compute the residue as
$$
\text{Res}(f, z_0) = \lim_{z \rightarrow z_0} (z - z_0)f(z).
$$

If $z_0$ is a $k$th-order pole,
there is an analytic function $g$ such that
$f(z) = (z - z_0)^{-k} g(z)$.
Then 
$$
g(z) = (z - z_0)^k f(z)
= \sum_{n=-k}^{\infty} a_{n}(z - z_0)^{n+k}
= \sum_{m=0}^{\infty} a_{m-k}(z - z_0)^m
$$
This is just a Taylor series whose coefficients can be obtained by differentiating.
Denoting $b_m = a_{m-k}$,
$$
\begin{aligned}
\text{Res}(f, z_0) &= a_{-1} = b_{k-1}
= \frac{g^{(k-1)}(z_0)}{(k-1)!} \\
&= \frac{1}{(k-1)!} \lim_{z \rightarrow z_0} \frac{d^{k-1}}{dz^{k-1}} \Big((z-z_0)^k f(z)\Big)
\end{aligned}
$$

(note: all this is assuming we're in a neighborhood
small enough not to contain any other singularities,
which always exists because $f$ is meromorphic.)

## Residue theorem

Let $f$ be a [[meromorphic function]] in a [[Simply connected set|simply connected]] domain $U$,
with singularity set $S := \{ z_i : i \in I \}$.
If $\gamma$ is a closed path in $U \setminus S$, then
$$
\int_{\gamma} f(z)\,dz = 2\pi i \sum_{i \in I} n(\gamma, z_i) \text{Res}(f, z_i)
$$
where $n(\gamma, z_i)$ is the [[winding number]] of $\gamma$ around $z_i$.

In particular, if $\gamma$ is a circular path around one singularity $z_0$,
$$
\int_{\gamma} f(z)\,dz = 2\pi i \text{Res}(f, z_0).
$$

Reason: for any $\gamma$, we can construct a [[cycle]] with zero [[homology]]
by adding suitable circle paths around each singularity.
Then by [[Cauchy's theorem]], the integral over this cycle is zero,
implying the integral over $\gamma$ equals the sum of integrals
over the circle paths.

Note: [[Cauchy's integral formula]] follows from the residue theorem:
$\frac{f(w)}{w - z_0}$ (where $f$ analytic) has a first-order pole at $z_0$
with residue $f(z_0)$.
The residue theorem with these values is equal to Cauchy's integral formula.
