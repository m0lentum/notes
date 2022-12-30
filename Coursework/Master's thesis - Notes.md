Solving the velocity potential formulation of the [[Wave equation]],

$$
\frac{\partial^2 \phi}{\partial t^2} = c^2 \nabla^2\phi
$$

Exact controllability: Instead of fully specifying initial conditions
to get a unique solution, allow initial conditions to vary and select them
by constructing an optimization problem that enforces some property.
In this case we want to enforce time-periodicity, i.e.
$u$ and $\frac{\partial{u}}{\partial{t}}$ are equal at time 0 and after a period T at all points in space.

## Differential form representation

Starting with the wave equation transformed to the
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
clockwise perpendicular form, obtained with a Hodge star and a negation
(negation because Hodge star rotates counterclockwise),
thus $\nabla \cdot = - d_1 \star$.
This is divergence expressed as a 2-form. To make the dimension of
forms match in the first equation, we need to add some more Hodge stars.
The first equation ends up as

$$
\star \partial_t v + c^2 d_1 (\star w) = \star f
$$

and the second equation

$$
\partial_t w - d_0 v = 0.
$$

Applying one more Hodge star to the first equation yields

$$
\begin{cases}
\partial_t v + c^2 \delta_1 w = f \\
\partial_t w - d_0v = 0 \\
\end{cases}
$$

where $\delta_1$ is the codifferential $\delta_1 = \star d_1 \star$ that takes 1-forms to 0-forms.

## Discretization

### Space

The domain $\Omega$ is approximated with a polygon mesh $K$ and its dual $K'$.
Discretized differential forms are continuous forms integrated over
mesh elements called _cochains_ (the sets of mesh elements themselves
are called _chains_). Each mesh consists of a 0-chain (vertices),
1-chain (edges) and 2-chain (faces). Cochains can be represented
as column vectors containing the values for each element of the chain.

0-cochains on $K$ have the same number of elements as 2-cochains on $K'$,
as do 1-cochains on $K$ and 1-cochains on $K'$, as well as 2-cochains on $K$
and 0-cochains on $K'$. These pairs are related by the discrete Hodge star,
which is a square matrix. We denote by $\star_k$ the discrete Hodge star
that takes $k$-forms on the primary mesh to $(n-k)$-forms on the dual mesh,
and by $\star_k^{-1}$ the inverse operator.

The discrete exterior derivative is computed by summing the boundary
$k$-cochain elements of a $(k+1)$-cochain. This is represented by a
multiplication with the _incidence matrix_ $d_k$ which encodes
the boundary $k$-cells of each $(k+1)$-cell and their orientation.
The same relationships on the dual mesh are represented by
the transpose $d_k^T$.
(TODO: work through the math,
does the transpose automatically have the correct orientations?)

Our unknowns in the continuous equations are the 1-form $w$ and 0-form $v$. 
We can approximate these with a 1-cochain $W$ and 0-cochain $V$.
Spatial discretization is done simply by replacing all the unknowns
and spatial operators with discrete equivalents:

$$
\begin{cases}
\partial_t V + c^2 \star_0^{-1} d_1^T \star_1 W = F \\
\partial_t W - d_0V = 0 \\
\end{cases}
$$

(not sure what happens when time derivative and star combine.
What is the time derivative of a differential form in the first place?
I think I don't need to know how the continuous case works for time
discretization so skipping this consideration for now)

TODO: some of this is general info
that should go in [[Discrete exterior calculus]]

### Time

Using a staggered finite difference time step with values of $V$ computed
at integer times and values of $W$ offset by half a timestep,
we use the approximations

$$
\begin{aligned}
\partial_t V &= \frac{V^{n+1} - V^n}{\Delta t} \\
\partial_t W &= \frac{W^{n+\frac{3}{2}} - W^{n+\frac{1}{2}}}{\Delta t} \\
\end{aligned}
$$

where the superscript denotes the index of the time step.

(TODO: does it matter which value is at half offset?
probably not since the only time that changes anything
is at the first and last time step?)

This gives the equations

$$
\begin{aligned}
\frac{V^{n+1} - V^n}{\Delta t} + c^2 \star_0^{-1} d_1^T \star_1 W^{n+\frac{1}{2}} &= F \\
\frac{W^{n+\frac{3}{2}} - W^{n+\frac{1}{2}}}{\Delta t}
	- d_0V^{n+1} &= 0 \\
\end{aligned}
$$

Multiplying by $\Delta t$ and moving terms around gives the time stepping formulas

$$
\begin{aligned}
V^{n+1} &= V^n - \Delta t c^2 \star_0^{-1} d_1^T
	\star_1 W^{n+\frac{1}{2}} - \Delta t F \\
W^{n+\frac{3}{2}}
	&= W^{\frac{1}{2}} + \Delta t d_0V^{n+1} \\
\end{aligned}
$$

To get $V^{n+\frac{1}{2}}$ and $W^n$ we can use the linear approximations

$$
\begin{aligned}
V^{n+\frac{1}{2}} &= \frac{v^n + v^{n+1}}{2} \\
W^{n} &= \frac{w^{n-\frac{1}{2}} + w^{n+\frac{1}{2}}}{2} \\
\end{aligned}
$$

(see chapter 5.4 of Räbinä's thesis).
This is needed to get a full solution at a single time instance
at the end of the simulated time window.

TODO: how to correctly set initial conditions, do we use this synchronized
time instance thing there too, or can we just set them at different times?

TODO: read up on boundary conditions and test problems

TODO: stability (CFL condition), no need for a thorough analysis yet
but I should at least understand what it's about

## Adjoint state method

Moved to [[Adjoint state method]]

## Weak formulations

Moved to [[Weak formulation]], not actually relevant to the thesis
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

Moved to [[Differential form]]