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
- norm: $|z| = \sqrt{a^2 + b^2}$
- inverse: $\frac{1}{z} = \frac{1}{a + bi} = \frac{a - bi}{a^2 + b^2} = \frac{\overline{z}}{|z|^2}$
- real and imaginary parts denoted $\text{Re}(z)$ and $\text{Im}(z)$
	- these can be expressed in terms of the complex conjugate as
		$\text{Re}(z) = \frac{z + \overline{z}}{2}$, $\text{Im}(z) = \frac{z - \overline{z}}{2i}$.
- [[Complex exponential]] / logarithm / root

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

Due to the rotating properties it's very useful to express
complex numbers in terms of polar coordinates,
which is made very convenient by the [[Complex exponential]],
$$
z = |z|e^{i\theta}
$$
where $\theta = \text{Arg}(z)$ is the _argument_ of $z$
representing its angle on the unit circle
constrained to the range $(-\pi, \pi]$.