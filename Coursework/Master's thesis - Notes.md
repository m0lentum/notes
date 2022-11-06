Wave equation / Helmholtz equation, time-dependent form:

$$
\frac{\partial^2 \phi}{\partial t^2} = c^2 \nabla^2\phi
$$

where $\phi$ is a velocity potential and $c$ is a nonnegative material constant
that affects the propagation speed of the wave

I think c is squared to communicate nonnegativity
and not for any physical reason (?)

Interpretation: displacement accelerates based on curvature.
The more narrow an individual wave, the quicker it starts moving towards
the equilibrium state.


Exact controllability: Instead of fully specifying initial conditions
to get a unique solution, allow initial conditions to vary and select them
by constructing an optimization problem that enforces some property.
In this case we want to enforce time-periodicity, i.e.
$u$ and $\frac{\partial{u}}{\partial{t}}$ are equal at time 0 and after a period T at all points in space.

## Differential form representation

Starting with the Helmholtz equation transformed to the
first order system

$$
\begin{cases}
\partial_t v - c^2\nabla \cdot \mathbf{w} = f \\
\partial_t \mathbf{w} - \nabla v = 0 \\
\end{cases} \quad \text{in } \Omega \times [0, T]
$$

where $v = \frac{\partial \phi}{\partial t}$ is acoustic pressure and $\mathbf{w} = \nabla \phi$ is velocity
(TODO: velocity of what exactly? wave propagation or displacement?).
$\Omega$ is the spatial domain and $T$ is the time period.

The vector-valued $\mathbf{w}$ can be represented with a 1-form $w = \mathbf{w}^{\flat}$
and the scalar-valued $v$ can be represented with a 0-form $v$.
The gradient of a scalar field is the exterior derivative of a 0-form $d_0$.
The divergence of a 1-form in 2D is the exterior derivative of its
perpendicular form, obtained with a Hodge star, thus $\nabla \cdot = d_1 \star$.
This is divergence expressed as a 2-form. To make the dimension of
forms match in the first equation, we need to add some more Hodge stars.
The first equation ends up as

$$
\star \partial_t v - c^2 d_1 (\star w) = \star f
$$

and the second equation

$$
\partial_t w - d_0 v = 0.
$$

Applying one more Hodge star to each equation yields

$$
\begin{cases}
\partial_t v - \star c^2 d_1 (\star w) = f \\
\star \partial_t w - \star d_0v = 0 \\
\end{cases}
$$

(TODO: why is this form nicer?)

## Adjoint state method

Moved to [[Adjoint state method]]

## Weak formulations

Moved to [[Weak formulations]], not actually relevant to the thesis
since these are not used with DEC

## Conjugate gradient optimization
related words:

Conjugate: two vectors $x$ and $y$ are $A$-conjugate w.r.t a positive definite
square matrix $A$ when $y^TAx = 0$. As with orthogonal vectors (which could also
be described as $I$-conjugate), this relationship is invariant w.r.t. scaling.
[source](https://math.stackexchange.com/questions/523810/conjugate-vectors)

Relatedly, the $A$-inner product $\langle x, y \rangle_A$ is defined as $\langle Ax, y \rangle = (Ax)^Ty$.
This only works if $A$ is symmetric positive definite because both those properties
are required for the definition of an inner product.
Positive definite means $\langle x, x \rangle > 0$ for all $||x|| \neq 0$
and (conjugate) symmetry means $\langle x, y \rangle$ = $\overline{\langle y, x \rangle}$.

TODO: refactor linear algebra section to have a note per numerical
method, move this stuff to a page about conjugate gradient.
Maybe also a separate algebra page to define these words

## Differential forms

Moved to [[Differential forms]]