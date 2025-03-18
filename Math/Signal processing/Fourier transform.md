- [3b1b introduction,
interpretation as wrapping around a circle and computing averages](https://www.youtube.com/watch?v=spUNpyF58BY)
- [3b1b on the complex Fourier series, tracing paths,
interpretation as stopping other frequencies,
relevance for solving PDEs](https://www.youtube.com/watch?v=r6sGWTCMz2k)
- [3b1b on the uncertainty principle
and interpretation as correlation](https://www.youtube.com/watch?v=MBnnXbOM5S4)
- [Veritasium on FFT, its history,
and interpretation as correlation](https://www.youtube.com/watch?v=nmgFG7PUHfo)

The Fourier transform takes a function in the time domain
and returns a function in the frequency domain.
There are a few different forms it can take
depending on whether we operate in a continuous or discrete space.

## Continuous-time Fourier transform

The continuous-time Fourier transform of a function $x(t)$ is
$$
X(\omega) = \int_{-\infty}^{\infty} x(t)e^{-i\omega t} dt
$$
where $\omega$ is the angular velocity of a sinusoid wave
(see [[Complex exponential]]).
There are several ways to interpret
what the multiplication with $e^{-i\omega t}$ does in this integral
(many requiring some geometric visualization;
see the 3b1b videos linked at the top of the document).
One of them is that this measures of the _correlation_ of $x(t)$ 
with the the given wave,
which tends to zero in the limit if $x(t)$ is a sum of sinusoid waves
and none of them have the exact same frequency as $e^{-i\omega t}$.

The inverse of the continuous-time Fourier transform is
$$
x(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} X(\omega)e^{i\omega t} d\omega
$$
which evaluates all possible frequencies and sums their contributions
at the given point $t$.
TODO: where does that $2\pi$ come from?

## Fourier series

The Fourier series transforms a periodic continous function
into a sum of waves with discrete frequencies,
where the lowest frequency is the period of the function
and the rest are integer multiples of it.
The $n$th element of the series is
$$
X[n] = \frac{1}{P} \int_{-P/2}^{P/2} x(t)e^{-2\pi i \frac{n}{P} t} dt,
$$
where $P$ is the period of $x$,
related to the original function by
$$
x(t) = \frac{1}{P} \sum_{n=-\infty}^{\infty}X[n]e^{2\pi i \frac{n}{P} t}.
$$

In the case of $P = 2\pi$ this simplifies to
$$
X[n] = \frac{1}{2\pi} \int_{-\pi}^{\pi} x(t)e^{-int} dt,
$$
removing the constants and making it clearer which the important variables are.

## Discrete-time Fourier transform

DTFT is the same operation as the continuous-time FT,
producing a continuous spectrum,
but the input is a discrete sequence $x[n], n \in \mathbb{Z}$.
$$
X(\omega) = \sum_{n=-\infty}^{\infty} x[n]e^{-i\omega n}
$$

## Discrete Fourier transform

DFT takes a discrete periodic time-domain sequence
and produces a discrete set of frequency values
with the same length as the original sequence.
For the sequence $x$ with a period of $N$ samples,
$$
X[n] = \sum_{k=0}^{N-1} x[k]w_N^{-kn}
$$
where $w_N$ is the _Nth root of unity_
$w_N = e^{2\pi i / N}$ characterized by $w_N^N = 1$.

The inverse of this is
$$
x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] w_N^{kn}
$$
As both $x$ and $X$ are discrete sequences, they can be interpreted as vectors
and the DFT implemented as a matrix product:
$$
\begin{aligned}
X[n] &= \sum_{k=0}^{N-1} x[k]w_N^{-kn} \\
\implies X &= \begin{bmatrix}
w_N^0 & w_N^0 & w_N^0 & \dots & w_N^0 \\
w_N^0 & w_N^{-1} & w_N^{-2} & \dots & w_N^{-(N-1)} \\
w_N^0 & w_N^{-2} & w_N^{-4} & \dots & w_N^{-2(N-1)} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
w_N^0 & w_N^{-(N-1)} & w_N^{-2(N-1)} & \dots & w_N^{-(N-1)^2} \\
\end{bmatrix}
x
\end{aligned}
$$

The inverse has a similar matrix expression
with a sign flip on the exponents and the constant factor $N^{-1}$.

The geometric interpretation of this matrix is
that each row corresponds to $N$ samples of a frequency
that is an integer multiple of the fundamental frequency (length of the signal).
When moving left to right, we rotate clockwise around the unit circle
in steps of $i_{row}/N$ full rotations per step.
The first row is the constant frequency,
the second rotates around the unit circle once over the entire signal,
the third rotates twice, the fourth three times etc.
This is analogous to the DTFT,
restricting the inputs to a discrete set of evenly spaced frequencies.