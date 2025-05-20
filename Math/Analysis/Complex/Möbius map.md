A Möbius map is a [[conformal map]] with the form 
of one of the following:
- $x \mapsto x + b$ (translation)
- $x \mapsto Ax$, $A^TA = 1$ (isometric linear map)
- $x \mapsto \lambda x$, $\lambda \in \mathbb{R} \setminus \{0\}$ (dilation)
- $x \mapsto \frac{x}{|x|^2}$ (geometric inverse, fi: "muljautus")

## Möbius maps in $\mathbb{C}$

Here we study Möbius maps that are also [[complex analytic function]]s.
Translations and dilations are always analytic,
isometries are not when they reflect but are when they rotate,
and inversions aren't but the complex inverse $z \mapsto \frac{1}{z} = \frac{\overline{z}}{|z|^2}$ is.
Thus complex analytic Möbius maps are of the form
- $z \mapsto z_0 + z$
- $z \mapsto z_0z$ (combined dilation and rotation)
- $z \mapsto \frac{1}{z}$
Compositions of these are always of the general form
$$
z \mapsto \frac{az + b}{cz + d}
$$
where $a,b,c,d \in \mathbb{C}$.

It turns out these maps follow composition and inverse rules
that exactly match those of matrices: let
$$
A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}
$$
and denote $f_A(z) = \frac{az + b}{cz + d}$.
Then $f_A \circ f_B = f_{AB}$
and $f_A^{-1} = f_{A^{-1}}$.

Note that the matrix $A$ is always invertible 
as long as this map is defined and not constant.
Also note that scaling the entire matrix
by any complex constant $\lambda$ cancels out in the map,
so we say $A \sim B$ if $A = \lambda B$ for some $\lambda \in \mathbb{C}$.