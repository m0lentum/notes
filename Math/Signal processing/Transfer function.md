The transfer function of a (linear time-invariant) digital filter
is the [[Z-transform]] of its impulse response.
The transfer function is very useful
for frequency-domain analysis of a filter.
Most importantly, we can figure out the effect of the filter
on the amplitude and phase of a given frequency $\omega$
by applying the transfer function to $e^{\omega i}$.

Given the filter as a difference equation
$$
\begin{aligned}
&y[n] = b_0x[n] + b_1x[n-1] + \dots + b_Kx[n-K] - a_1y[n-1] - a_2y[n-2] - \dots - a_M[n-M] \\
\iff & y[n] + \sum_{m=1}^M a_my[n-m] = \sum_{k=0}^K b_kx[n-k]
\end{aligned}
$$
we can derive the transfer function by taking the Z-transform of this equation
(using the fact that Z-transform is linear
and the Z-transform of a sequence delayed by $k$
is the sequece multiplied by $z^{-k}$;
$X(z)$ and $Y(z)$ are unknown at this point),
$$
\begin{aligned}
\Big(1 + \sum_{m=1}^M a_mz^{-m}\Big)Y(z) &= \Big(\sum_{k=0}^K b_kz^{-k}\Big)X(z) \\
Y(z) &= \frac{\sum_{k=0}^K b_kz^{-k}}{1 + \sum_{m=1}^M a_mz^{-m}}X(z)
\end{aligned}
$$
We also know that the response of this system to the signal $x[n]$
is the convolution between the impulse response $h[n]$ and that signal $h * x$,
which is $H(z)X(z)$ in the Z-transform domain,
i.e. $Y(z) = H(z)X(z)$.
Therefore the Z-transform of the impulse response
(i.e. the transfer function of this filter) is
$$
H(z) = \frac{\sum_{k=0}^K b_kz^{-k}}{1 + \sum_{m=1}^M a_mz^{-m}}
$$
Note that these coefficients are directly observable in the difference equation.
The nominator has the coefficients of $x$
and the denominator has the coefficients of $y$
(with signs corresponding to the form where all elements of $y$ are on the left hand side).