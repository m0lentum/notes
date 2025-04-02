A function series is a function
defined pointwise as a series $f(z) = \sum_{j=0}^{\infty} f_j(z)$.
The two most important examples in practice
are the [[Fourier series]] and [[Taylor series]].

When computing the value of a series,
the order of summation cannot in general be changed
because this would change the resulting value.
This can happen if the series does not converge _absolutely_
(i.e. its absolute value does not converge,
implying it has negative terms or rotates in the complex plane).

An important connection with [[Complex analytic function]]s
is that any analytic function
can be expressed locally as a convergent power series.

## Convergence

A function series converges _pointwise_
if $\sum_{j=0}^{\infty} f_j(z)$ converges for all $z$
(where a series converges if the partial sums
$S_k(z) = \sum_{j=0}^k f_j(z)$ converge towards a value $f(z)$ when $k \rightarrow \infty$,
which in turn is the case if for all $\varepsilon > 0$
exists $N_{\varepsilon}$ such that $|f(z) - S_k(z)| < \varepsilon$ when $k \geq N_{\varepsilon}$,
which is often easiest to show by showing that
the partial sums form a [[Cauchy sequence]]).

The series converges _uniformly_
if $N_{\varepsilon}$ can be chosen such that it does not depend on $z$.

The series converges _locally uniformly_ in $U$
if it converges uniformly in all compact subsets of $U$.
To check this in practice, it suffices to check for uniform convergence
in all disks $D_r(z_0)$ such that $\overline{D}_r(z_0) \subset U$ ([[Closure]]),
sometimes denoted $D_x(z_0) \subset \subset U$.

### Theorem: Weierstrass M-test

Let $f_n : U \rightarrow \mathbb{C}$ such that $||f_n||_{\infty} \leq M_n$ for $n \in \mathbb{N}$.
If $\sum_{n=0}^{\infty} M_n < \infty$, then $f(z) := \sum_{n=0}^{\infty} f_n(z)$ converges uniformly.

### Theorem: Derivatives of a series

Let $f_k : U \rightarrow \mathbb{C}$ be analytic such that $\sum f_k \rightarrow f$
locally uniformly in $U$.
Then $f$ is analytic and $\sum f_k^{(n)} \rightarrow f^{(n)}$ for all $n$.
###### Idea of the proof
Compute the first derivative with [[Cauchy's integral formula]].
The found partial sums form a [[Cauchy sequence]].
Show that the function $g$ that this sequence converges to is equal to $f'$
by defining $f(z) - f(w)$ as a line segment integral from $w$ to $z$,
letting $w \rightarrow z$, and noting that this equates $g$ with the difference quotient
which is the definition of $f'$.
Higher-order derivatives follow by induction.


### Example: geometric series

Show that the series $\sum_{n=0}^{\infty} z^n$ converges:
$$
S_k = \sum_{n=0}^k z^n = 1 + z + z^2 + \dots + z^k
$$
multiply by $-z$:
$$
-zS_k = \sum_{n=0}^k -z^{n+1} = -z - z^2 - \dots - z^{k+1}
$$
subtract:
$$
S_k - zS_k = 1 - z^{k+1}
$$
$$
\implies S_k = \frac{1 - z^{k+1}}{1-z}
$$
which converges to $\frac{1}{1-z}$ iff $|z| < 1$,
therefore the geometric series converges in $D_1 \subset \mathbb{C}$.

## Power series

A power series around a point $z_0$ is defined as
$$
\sum_{n=0}^{\infty} a_n (z - z_0)^n
$$
where $a_n \in \mathbb{C}$.

The _radius of convergence_ of this series is
$$
\rho = \frac{1}{\limsup_{n \rightarrow \infty} \sqrt[n]{|a_n|}}
$$
where $\limsup_{n \rightarrow \infty} x_n = \lim_{n \rightarrow \infty} \sup \{x_n, x_{n+1}, x_{n+2}, \dots\}$
(for which $\infty$ is considered a valid value and $\frac{1}{0} = \infty$, $\frac{1}{\infty} = 0$).

(note: if $\lim_{n \rightarrow \infty} x_n$ exists, then $\lim_{n \rightarrow \infty} x_n = \limsup_{n \rightarrow \infty} x_n$)

With $\rho$ defined this way the power series
- converges locally uniformly in $D_{\rho}(z_0)$ to an analytic function
- diverges for all $z \in \mathbb{C} \setminus \overline{D}_{\rho}(z_0)$
- may converge or diverge on $\partial D_{\rho}(z_0)$

Explanation:
The power series is equivalent to the geometric series
$$
\sum_{n=0}^{\infty}(\sqrt[n]{a_n}(z - z_0))^n
$$
and so this converges as long as
$$
|\sqrt[n]{a_n}(z - z_0)| < 1 \iff |z - z_0| < \frac{1}{|\sqrt[n]{a_n}|}
$$
for all $n$.