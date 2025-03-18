Often seen in physics involving waves,
the complex function for imaginary numbers is defined as

$$
e^{i\theta} = \cos(\theta) + i\sin(\theta)
$$

where $\theta$ represents an angle walking around the unit circle.
Alternative notation: $e^{i\theta} = \exp(i\theta)$

Extended to a general complex number $z = a + bi$ it becomes
$$
e^{a + bi} = e^ae^{bi} = e^a (\cos(b) + i\sin(b))
$$
where $e^a$ is the regular real exponential function.

This can be further extended to a non-$e$ root
by applying a logarithm (more on that later in this note), producing
$$
z^w = e^{\text{Log} z^w} = e^{w\text{Log}z}
$$

Geometric intuition: $e^x$ is exponential growth, solution to $\frac{df}{dx} = f$.
$e^{iz}$ is like that, but multiplying by $i$ rotates by 90 degrees.
Thus, at every $z$, the growth is proportional to $z$ but moves us
in the tangential direction of a circle centered at origin.
Thus, if $z$ is ever unit-length, we stay on the unit circle forever.

A consequence of this definition is _Euler's formula_,
commonly written as
$$
e^{i\pi} + 1 = 0
$$
which is cool because it connects five very important constants in math,
$e$, $i$, $\pi$, $1$ and $0$.

### Derivation

The crucial point here is that it doesn't make sense in this context
to think about exponentiation as repeated multiplication.
Instead, we consider the Taylor series expansion of $e^x$:

$$
e^x = \sum_{n=0}^{\infty} \frac{x^n}{n!}
$$

This is just a polynomial so all sorts of things can be fed into it,
including irrational and complex numbers. Then we have

$$
\begin{align}
e^{i\theta} &= \sum_{n=0}^{\infty} \frac{i^n\theta^n}{n!} \\
&= 1 + i\theta + \frac{-\theta^2}{2} + \frac{-i\theta^3}{6}
+ \frac{\theta^4}{24} + \frac{i\theta^5}{120} + \dots \\
\end{align}
$$

where every other element is purely real and every other is purely imaginary.
If you take only the real elements you get the Taylor series for
$\cos(\theta)$, and the imaginary elements give $\sin(\theta)$. Thus we have Euler's formula.

## Logarithm

The logarithm is the inverse of the exponential:
$$
\text{Log}(z) = \log(|z|) + i\text{Arg}(z)
$$
where $\log$ is the regular real logarithm
and $\text{Arg}$ is the main argument (i.e. angle) of $z$.
This is the _main branch_ of the logarithm;
other branches are obtained by taking
different values of the argument (which is $2\pi$-periodic).

It's always true that $\exp(\text{Log}(z)) = z$,
however, due to the discontinuity of $\text{Arg}$,
$\text{Log}(\exp(z)) = z$ does not always hold.
On the other hand, it's always true that
$\text{Log}(\exp(z)) = z + 2\pi ki$ for some $k \in \mathbb{Z}$.
This is an example of the general idea of
_branches of inverse functions_,
where a function is the inverse of another continuous function
only in a specific open set where it is continuous.

## Root

The complex root is the inverse
of complex exponentiation $z^n = |z|^ne^{ni\text{Arg}(z)}$,
$$
\sqrt[n]{z} = \sqrt[n]{|z|} \exp(\frac{1}{n}i\text{Arg}(z)).
$$
Again, this is the main branch of the root,
defined by picking main argument as the angle parameter.
Other roots satisfying $(\sqrt[n]{z})^n = z$ are obtained by
$\sqrt[n]{z} = \sqrt[n]{|z|} \exp(\frac{2\pi k}{n} i\text{Arg}(z))$, $k \in \mathbb{Z}$.

The special case of all roots $\sqrt[n]{1}$
are called the _nth roots of unity_,
which are $n$ equally spaced values on the unit circle.
These are important in discrete [[Fourier transform]]s.

## Properties

- $z^{v + w} = z^vz^w$
- NOT true: $(zw)^v = z^vw^v$
- $z^{\frac{1}{n}} = \sqrt[n]{z}$
- $zw = |z||w|e^{i(\text{Arg}(z) + \text{Arg}(w))}$
- $\cos \theta = \text{Re}(e^{i\theta}) = \frac{e^{i\theta} + e^{-i\theta}}{2}$
- $\sin \theta = \text{Im}(e^{i\theta}) = \frac{e^{i\theta} - e^{-i\theta}}{2i}$