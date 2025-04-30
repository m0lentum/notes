A Laurent series is a [[function series]] that generalizes the Taylor series
into a "double-ended" series:
$$
\sum_{n=-\infty}^{\infty} a_n (z - z_0)^n
$$
which is said to converge if both subseries
$$
\sum_{n=0}^{\infty} a_n(z - z_0)^n
\quad \text{and} \quad 
\sum_{n=1}^{\infty} a_{-n}(z - z_0)^{-n}
$$
converge.

The point of the Laurent series is that it can express functions
that have singularities that break the Taylor series representation.
Unfortunately the coefficients of the Laurent series
are generally difficult to find,
but they have a general form as the Fourier coefficients
around a $r$-radius circle $\theta \mapsto z_0 + re^{i\theta}$
(where $r$ must lie in the annulus of convergence, see later)
$$
a_n = \frac{1}{2\pi r^n} \int_0^{2\pi}f(z_0 + re^{i\theta})e^{-in\theta} \,d\theta
$$

The Laurent series is unique and therefore can sometimes be found
by using tricks such as expressing the function
in the form of the sum of a geometric series $\frac{1}{1 - z}$.

The Laurent series converges (locally uniformly) in an annulus
with inner radius $\rho_I = \limsup_{n \rightarrow \infty} \sqrt[n]{|a_{-n}|}$
and outer radius $\rho_O =  \frac{1}{\limsup_{n \rightarrow \infty} \sqrt[n]{|a_{n}|}}$
and diverges outside of it.
