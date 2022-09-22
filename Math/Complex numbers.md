Imaginary unit $i$ is defined as the number for which $i^2 = -1$.
A complex number is a number with a real part and imaginary part
$a + bi$ and can be thought of as a vector $(a, b)$ in $\mathbb{R}^2$.

Operations and notation:
- sums and multiplications work just like for reals,
  $(a + bi) + (c + di) = (a + c) + (b + d)i$
  and $(a + bi) * (c + di) = (a * c) + (bi * c) + (a * di) + (bi * di)$
  $= (ac - bd) + (cb + ad)i$
- conjugate (fi: liittoluku), denoted with $z^*$ or $\overline{z}$:
  for $z = a + bi$, $z^* = a - bi$
- real and imaginary parts denoted $\text{Re}(z)$ and $\text{Im}(z)$

Multiplying by a complex number behaves like a linear transformation in $\mathbb{R}^2$
that scales and rotates depending on the real and imaginary parts.
The corresponding linear transformation matrix for $z = a + bi$ 
is the one that transforms $(1,0)$ to $z$ and $(0,1)$ to the left normal of $z$
(i.e. $-b + ai$),
$$
zw =
\begin{bmatrix}
a & -b \\
b & a \\
\end{bmatrix}w
$$

## Euler's formula

Very frequently seen in physics involving waves,
Euler's formula is
$$
e^{i\theta} = \cos(\theta) + i\sin(\theta)
$$
meaning $\theta$ represents an angle walking around the unit circle.
Alternative notation: $e^{i\theta} = \exp(i\theta)$

Geometric intuition: $e^x$ is exponential growth, solution to $\frac{df}{dx} = f$.
$e^{iz}$ is like that, but multiplying by $i$ rotates by 90 degrees.
Thus, at every $z$, the growth is proportional to $z$ but moves us
in the tangential direction of a circle centered at origin.
Thus, if $z$ is ever unit-length, we stay on the unit circle forever.

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