The Z-transform is a generalization of the [[Fourier transform]].
Where the Fourier transform only takes inputs on the unit circle,
the Z-transform takes inputs from anywhere in the complex plane.
The Z-transform of a sequence $x[n]$ is
$$
X(z) = \sum_{n=-\infty}^{\infty} x[n]z^{-n}
$$
Compare to the discrete-time Fourier transform (DTFT):
$$
X(\omega) = \sum_{n=-\infty}^{\infty} x[k]e^{-i\omega n}
$$

This is exactly the z-transform restricted to the values $e^{i\omega}$.
The same goes for the discrete Fourier transform (DFT),
which is the DTFT with inputs restricted to integer powers of a root of unity.

When a z-tranform has the form
$$
X(z) = \frac{N(z)}{D(z)} = \frac{\sum_{m=0}^{M} a_mz^{-m}}{\sum_{k=0}^{K} b_kz^{-k}}
$$
(typically the case when dealing with a [[transfer function]],
the points $N(z) = 0$ are called the _zeros_
and the points $D(z) = 0$ are called the _poles_ of $X(z)$.

## Region of convergence

Since the z-transform is an infinite series,
it only converges for a certain set of inputs.
Often useful in the derivation of a z-transform
is the formula for the sum of a geometric series,
$$
\sum_{n=-\infty}^{\infty}r^n = \frac{1}{1 - r}, \quad \text{for } |r| < 1.
$$
When the z-transform is a geometric series,
this formula tells us both its value and its region of convergence.

Example: z-transform of a unit step 
$$
x[n] = u[n] = \begin{cases}
0, \text{if } n < 0, \\
1, \text{otherwise}
\end{cases}
$$

$$
\begin{aligned}
X(z) &= \sum_{n=-\infty}^{\infty} u[n]z^{-n} = \sum_{n=0}^{\infty}z^{-n} \\
&= \sum_{n=0}^{\infty} (z^{-1})^n = \frac{1}{1 - z^{-1}}
\end{aligned}
$$
which converges when $|z^{-1}| < 1 \iff |z| > 1$.