[wikipedia](https://en.wikipedia.org/wiki/Argument_principle)

The argument principle is an integral formula
related to [[Cauchy's integral formula]] and the [[residue]] theorem,
relating contour integrals of [[meromorphic function]]s
to their zeros and poles.

Let $f : U \rightarrow \mathbb{C}$ be meromorphic in $U$
with zeros $z_1, \dots, z_{N_z}$ and poles $p_1, \dots, p_{N_p}$
(see [[Singularity (complex)]], [[Laurent series]]),
whose orders are $k_{z,i}$ and $k_{p,i}$,
and $\gamma : [a, b] \rightarrow U \setminus \{z_i, p_i\}$ a closed path.
Then
$$
\frac{1}{2\pi i} \int_{\gamma} \frac{f'(z)}{f(z)}dz
= \sum_{i=1}^{N_z} k_{z,i} n(\gamma, z_i)
-  \sum_{i=1}^{N_p} k_{p,i} n(\gamma, p_i)
$$
where $n(\gamma, z)$ is the [[winding number]].
For a circle path enclosing all zeros and poles listed
this simplifies to 
$$
\frac{1}{2\pi i} \int_{\partial D_r(z_0)} \frac{f'(z)}{f(z)}dz
= \sum_{i=1}^{N_z} k_{z,i} - \sum_{i=1}^{N_p} k_{p,i}
$$

The expression $\frac{f'(z)}{f(z)}$ is called the _logarithmic derivative_
(see the wikipedia article for more on this),
which intuitively measures the rate of change
_relative_ to the function's value.

The argument principle can be proven
by expressing $f$ locally in the form
$(z - z_j)^{k_{z,j}}g(z)$ or $(z - p_j)^{-k_{p,j}}g(z)$ where $g(z_j) \neq 0$
and using the [[residue]] theorem.