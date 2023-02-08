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

where $v = \frac{\partial \phi}{\partial t}$ is acoustic pressure and $\mathbf{w} = \nabla \phi$ is particle velocity
$\Omega$ is the spatial domain and $T$ is the time period.

The vector-valued $\mathbf{w}$ can be represented with a 1-form $w = \mathbf{w}^{\flat}$
and the scalar-valued $v$ can be represented with a 0-form $v$.
The gradient of a scalar field is the exterior derivative of a 0-form $d_0$.
The divergence of a 1-form in 2D is the exterior derivative 
of its counterclockwise perpendicular form, $\nabla \cdot = d_1 \star$.
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

Instead of velocity, we solve for the _flux_ $q = \star w$
because this allows us to easily represent flux-based boundary conditions.
Applying one more Hodge star to both equations
and substituting $q$ yields

$$
\begin{cases}
\partial_t v - c^2 \star d_1 q = f \\
\partial_t q - \star d_0 v = 0 \\
\end{cases}
$$

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

Our unknowns in the continuous equations are the 1-form $q$ and 0-form $v$. 
We can approximate these with a primal 1-cochain $Q$ and dual 0-cochain $V$.
Spatial discretization is done simply by replacing all the unknowns
and spatial operators with discrete equivalents:

$$
\begin{cases}
\partial_t V - c^2 \star_2 d_1 Q = F \\
\partial_t Q - \star_1^{-1} d_1^T V = 0 \\
\end{cases}
$$

Here $\star_1^{-1}$ denotes the Hodge star taking values from the dual mesh
to the primal one.

(not sure what happens when time derivative and star combine.
What is the time derivative of a differential form in the first place?
I think I don't need to know how the continuous case works for time
discretization so skipping this consideration for now)

### Time

Using a staggered finite difference time step with values of $V$ computed
at integer times and values of $W$ offset by half a timestep,
we use the approximations

$$
\begin{aligned}
\partial_t V &= \frac{V^{n+1} - V^n}{\Delta t} \\
\partial_t Q &= \frac{Q^{n+\frac{3}{2}} - Q^{n+\frac{1}{2}}}{\Delta t} \\
\end{aligned}
$$

where the superscript denotes the index of the time step.

(TODO: does it matter which value is at half offset?
probably not since the only time that changes anything
is at the first and last time step?)

This gives the equations

$$
\begin{aligned}
\frac{V^{n+1} - V^n}{\Delta t} - c^2 \star_2 d_1 Q^{n+\frac{1}{2}} &= F \\
\frac{Q^{n+\frac{3}{2}} - Q^{n+\frac{1}{2}}}{\Delta t}
	- \star_1^{-1} d_1^T V^{n+1} &= 0 \\
\end{aligned}
$$

Multiplying by $\Delta t$ and moving terms around gives the time stepping formulas

$$
\begin{aligned}
V^{n+1} &= V^n + \Delta t c^2 \star_2 d_1
	Q^{n+\frac{1}{2}} + \Delta t F \\
Q^{n+\frac{3}{2}}
	&= Q^{\frac{1}{2}} + \Delta t \star_1^{-1} d_1^T V^{n+1} \\
\end{aligned}
$$

To get $V^{n+\frac{1}{2}}$ and $W^n$ we can use the linear approximations

$$
\begin{aligned}
V^{n+\frac{1}{2}} &= \frac{V^n + V^{n+1}}{2} \\
Q^{n} &= \frac{Q^{n-\frac{1}{2}} + Q^{n+\frac{1}{2}}}{2} \\
\end{aligned}
$$

(see chapter 5.4 of Räbinä's thesis).
This is needed to get a full solution at a single time instance
at the end of the simulated time window.

TODO: is setting initial conditions at $V^0$ and $Q^{\frac{1}{2}}$ accurate, or 
should $Q$ be set at time 0 and take a half step forward?
(also TODO: work out the formula for a half step from the above approximations)

TODO: stability (CFL condition), no need for a thorough analysis yet
but I should at least understand what it's about

## Adjoint state method

See [[Adjoint state method]] for theory.
TODO: construct the state and adjoint state matrices for the wave equation

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

## Test problems

### Vibrating membrane

Extremely simple case to test basic parts of the implementation.

- Dirichlet boundary condition $\phi = 0$
	- models a membrane solidly attached to a frame from all sides
- no source terms, $f = 0$
- square domain $\Omega = [0, \pi]^2$
- initial conditions e.g. $\phi_0 = \sin(ax)\sin(by)$ where $a$ and $b$ are any integer
  (fulfills boundary condition)

### Circular scatterer

Spatial domain is the area between two circles, inner edge $\Gamma_{sca}$
models a scattering object and the outer edge $\Gamma_{ext}$ has an absorbing
boundary condition modelling the wave leaving the domain without
interacting with the edge.

An incoming plane wave $\phi_{inc}$ moves through the domain in some direction
expressed as the (angular) _wave vector_ $\vec{\kappa}$ (arrow notation instead
of bold because Obsidian doesn't know bold kappa) whose magnitude
is the _wavenumber_ $\kappa$. The wavenumber counts the number of radians
per unit of distance, relating to the wavelength $\lambda$ by $\kappa = \frac{2\pi}{\lambda}$.
The angular velocity of the wave is then $\omega = c\kappa = \frac{2\pi c}{\lambda}$.
The equation for the incoming wave is

$$
\phi_{inc} = -\cos(\omega t - \vec{\kappa} \cdot \mathbf{x})
$$

which we place at the boundary of the scatterer using the boundary
condition $\phi = \phi_{inc}$ on $\gamma_{sca} = \Gamma_{sca} \times [0, T]$.
On the external boundary $\gamma_{ext} = \Gamma_{ext} \times [0,T]$ 
we use the first order Engquist-Majda boundary condition

$$
\frac{1}{c}\frac{\partial\phi}{\partial t} + \mathbf{n} \cdot \nabla\phi = 0
$$

where $\mathbf{n}$ is the outward-facing unit normal of the boundary.
The dot product with the boundary normal is equivalent to the flux,
thus the expression reduces to just $\mathbf{q}$.

The boundary conditions in terms of acoustic pressure and velocity are thus

$$
\begin{aligned}
v &= \frac{\partial}{\partial t}\phi_{inc} & \text{on } \gamma_{sca} \\
\mathbf{q} &= \star(\nabla\phi_{inc})^{\flat} & \text{on } \gamma_{sca} \\
v + c\mathbf{q} &= 0 & \text{on } \gamma_{ext} \\
\end{aligned}
$$

where

$$
\begin{aligned}
\frac{\partial}{\partial t}\phi_{inc} &= \omega\sin(\omega t - \vec{\kappa} \cdot \mathbf{x}) \\
\nabla \phi_{inc} &= -\vec{\kappa} \sin(\omega t - \vec{\kappa} \cdot \mathbf{x})
\end{aligned}
$$

Initial conditions for the time-dependent case can be set to e.g.

$$
\begin{aligned}
v^0 &= \omega \sin(\vec{\kappa} \cdot \mathbf{x}) \\
q^0 &= \star(-\vec{\kappa} \sin(\vec{\kappa} \cdot \mathbf{x}))^{\flat} \\
\end{aligned}
$$

which fulfill the boundary conditions on the scatterer's surface
but not on the outer edge. For the time-harmonic case (which we'll
be solving for with the controllability method) we need
to fulfill all the boundary conditions all the time. For this
we need the Mur transition, whereby initial conditions and source
terms are zero, and source terms are intensified over time
using an easing function.

#### Setting values of q

The value of a discrete 1-form is its integral
over a mesh edge. In this case, for an element $q$ of $Q$, the flux of the
incoming wave can be evaluated by integrating the velocity in the direction
of the normal,

$$
\begin{aligned}
q &= \int_0^l -\vec{\kappa} \sin(\omega t 
	- \vec{\kappa} \cdot (p_1 + u\mathbf{\hat{l}}))
	 \cdot \hat{\mathbf{n}} \,du \\
&= -\int_0^l (\vec{\kappa} \cdot \mathbf{\hat{n}})
	\sin(\omega t - (\vec{\kappa} \cdot p_1)
	 - (\vec{\kappa} \cdot \mathbf{\hat{l}})u) \,du \\
&\text{if $\vec{\kappa} \cdot \mathbf{\hat{l}} \neq 0$:} \\
&= -\frac{\vec{\kappa} \cdot \mathbf{\hat{n}}}{\vec{\kappa} \cdot \mathbf{\hat{l}}}
	\Big[\cos(\omega t - (\vec{\kappa} \cdot p_1)
	- (\vec{\kappa} \cdot \mathbf{\hat{l}})u) \Big]_{u=0}^{u=l} \\
&= \frac{\vec{\kappa} \cdot \mathbf{\hat{n}}}{\vec{\kappa} \cdot \mathbf{\hat{l}}}
	\Big(\cos(\omega t - (\vec{\kappa} \cdot p_1))
	 - \cos(\omega t - (\vec{\kappa} \cdot p_1) - (\vec{\kappa} \cdot \mathbf{l}))\Big) \\
&\text{otherwise:} \\
&= -l(\vec{\kappa} \cdot \mathbf{\hat{n}})
	\sin(\omega t - (\vec{\kappa} \cdot p_1))
\end{aligned}
$$

where $\mathbf{l} = p_2 - p_1$ is the direction vector of the edge,
$l = ||\mathbf{l}||$, $\mathbf{\hat{l}} = l^{-1} \mathbf{l}$,
$p_1$ and $p_2$ are the endpoints of the edge, and $u \in [0, l]$ is the parameter in the parametric
expression of the line segment forming the edge $p_1 + u\mathbf{\hat{l}}$.

For the initial conditions use the same formula but set the $\omega t$ term to zero.

### Square with known solution

Simple case to test accuracy of the method. Pick an arbitrary solution,
substitute it into the equations and solve for boundary conditions
and possible source terms.

Picking as the analytic solution the plane wave (as in the circular scatterer case)

$$
\phi = -\cos(\omega t - \vec{\kappa} \cdot \mathbf{x})
$$

for which

$$
\begin{aligned}
\frac{\partial \phi}{\partial t} &= \omega \sin(\omega t - \vec{\kappa} \cdot \mathbf{x}) \\
\frac{\partial^2 \phi}{\partial t^2} &= \omega^2 \cos(\omega t - \vec{\kappa} \cdot \mathbf{x}) \\
\nabla \phi &= -\vec{\kappa} \sin(\omega t - \vec{\kappa} \cdot \mathbf{x}) \\
\nabla \cdot \nabla \phi &= (-\vec{\kappa} \cdot -\vec{\kappa}) \cos(\omega t - \vec{\kappa} \cdot \mathbf{x}) \\
	&= \kappa^2 \cos(\omega t - \vec{\kappa} \cdot \mathbf{x})
\end{aligned}
$$
Substituting these into the state equation gives

$$
\frac{\partial^2 \phi}{\partial t^2} - c^2\nabla^2\phi
= \omega^2 \cos(\omega t - \vec{\kappa} \cdot \mathbf{x})
- c^2\kappa^2 \cos(\omega t - \vec{\kappa} \cdot \mathbf{x})
$$

which equals zero assuming $\omega = c\kappa$.

We set initial conditions to $v = \frac{\partial \phi}{\partial t}|_{t=0}$ and $w = \nabla \phi |_{t=0}$ and boundary conditions
in $\gamma_{ext} \times [0, T]$ to $v = \frac{\partial \phi}{\partial t}$ and $w = \nabla \phi$, solve the state equation using DEC,
and examine the error in the interior of the computation mesh.
