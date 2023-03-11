Solving the velocity potential formulation of the [[Wave equation]],

$$
\frac{\partial^2 \phi}{\partial t^2} = c^2 \nabla^2\phi
$$

Exact controllability: Instead of fully specifying initial conditions
to get a unique solution, allow initial conditions to vary and select them
by constructing an optimization problem that enforces some property.
In this case we want to enforce time-periodicity, i.e.
$u$ and $\frac{\partial{u}}{\partial{t}}$ are equal at time 0 and after a period T at all points in space.

## [[Differential form]] representation

Starting with the wave equation transformed to the
first order system

$$
\begin{cases}
\partial_t p - c^2\nabla \cdot \mathbf{v} = f \\
\partial_t \mathbf{v} - \nabla p = 0 \\
\end{cases} \quad \text{in } \Omega \times [0, T]
$$

where $p = \frac{\partial \phi}{\partial t}$ is acoustic pressure and $\mathbf{v} = \nabla \phi$ is particle velocity
$\Omega$ is the spatial domain and $T$ is the time period.

The vector-valued $\mathbf{v}$ can be represented with a 1-form $v = \mathbf{v}^{\flat}$
and the scalar-valued $p$ can be represented with a 0-form $p$.
The gradient of a scalar field is the exterior derivative of a 0-form $d_0$.
The divergence of a 1-form in 2D is the exterior derivative
of its counterclockwise perpendicular form, $\nabla \cdot = d_1 \star$.
This is divergence expressed as a 2-form. To make the dimension of
forms match in the first equation, we need to add some more Hodge stars.
The first equation ends up as

$$
\star \partial_t p - c^2 d_1 (\star v) = \star f
$$

and the second equation

$$
\partial_t v - d_0 p = 0.
$$

Instead of velocity, we solve for the _flux_ $q = \star v$
because this allows us to easily represent flux-based boundary conditions.
Applying one more Hodge star to both equations
and substituting $q$ yields

$$
\begin{cases}
\partial_t p - c^2 \star d_1 q = f \\
\partial_t q - \star d_0 p = 0 \\
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

Our unknowns in the continuous equations are the 1-form $q$ and 0-form $p$.
We can approximate these with a primal 1-cochain $Q$ and dual 0-cochain $P$.
Spatial discretization is done simply by replacing all the unknowns
and spatial operators with discrete equivalents:

$$
\begin{cases}
\partial_t P - c^2 \star_2 d_1 Q = F \\
\partial_t Q - \star_1^{-1} d_1^T P = 0 \\
\end{cases}
$$

Here $\star_1^{-1}$ denotes the Hodge star taking values from the dual mesh
to the primal one.

This can also be represented as the matrix equation

$$
(\Lambda \partial_t + M) \begin{bmatrix}
  P \\ Q
\end{bmatrix}
= \begin{bmatrix}
  F \\ 0
\end{bmatrix}
$$

where

$$
\begin{align*}
  \Lambda &= I \\
  M &= \begin{bmatrix}
    0 & -c^2 \star_2 d_1 \\
    -\star_1^{-1} d_1^T & 0 \\
  \end{bmatrix}
\end{align*}
$$

This factorization will be relevant later
when computing energy.

### Time

Using a staggered finite difference time step with values of $P$ computed
at integer times and values of $W$ offset by half a timestep,
we use the approximations

$$
\begin{aligned}
\partial_t P &= \frac{P^{n+1} - P^n}{\Delta t} \\
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
\frac{P^{n+1} - P^n}{\Delta t} - c^2 \star_2 d_1 Q^{n+\frac{1}{2}} &= F \\
\frac{Q^{n+\frac{3}{2}} - Q^{n+\frac{1}{2}}}{\Delta t}
	- \star_1^{-1} d_1^T P^{n+1} &= 0 \\
\end{aligned}
$$

Multiplying by $\Delta t$ and moving terms around gives the time stepping formulas

$$
\begin{aligned}
P^{n+1} &= P^n + \Delta t c^2 \star_2 d_1
	Q^{n+\frac{1}{2}} + \Delta t F \\
Q^{n+\frac{3}{2}}
	&= Q^{n+\frac{1}{2}} + \Delta t \star_1^{-1} d_1^T P^{n+1} \\
\end{aligned}
$$

TODO: stability (CFL condition), no need for a thorough analysis yet
but I should at least understand what it's about

## Exact controllability

The purpose of the exact controllability method is
to guide the system into a time-periodic state.
This is done by solving an optimization problem,
but to define it we need some more information first.

### State equation

We start by formulating the time-stepping process until time $T$
(the state equation) as a matrix equation.
From this we'll be able to obtain the adjoint equation by inspection.
For a single timestep we have

$$
\begin{bmatrix}
I  & \Delta t c^2 \star_2 d_1 & -I \\
& I & \Delta t \star_1^{-1} d_1^T & -I
\end{bmatrix}
\begin{bmatrix}
P^n \\ Q^{n+\frac{1}{2}} \\ P^{n+1} \\ Q^{n+\frac{3}{2}}
\end{bmatrix}
+
\begin{bmatrix}
F^n \\ 0 \\ F^{n+1} \\ 0
\end{bmatrix}
= 0
$$

(TODO: should there be a source term for $Q$ too?)

Denoting $U^n = (P^n, Q^{n+\frac{1}{2}})^T$, $\mathcal{F}^n = (F^n, 0)^T$
and including the initial conditions $U^0 = \mathbf{e}$ we get

$$
S(\mathbf{e}, U(\mathbf{e})) =
\begin{bmatrix}
I \\
\mathcal{C} & \mathcal{D} \\
& \mathcal{C} & \mathcal{D} \\
& & \ddots & \ddots \\
& & & \mathcal{C} & \mathcal{D} \\
& & & & \mathcal{C} & \mathcal{D} \\
\end{bmatrix}
\begin{bmatrix}
U^0 \\ U^1 \\ \vdots \\ U^{N-1} \\ U^N
\end{bmatrix}
- \begin{bmatrix}
\mathbf{e} \\ 0 \\ \vdots \\ 0 \\ 0
\end{bmatrix}
+ \begin{bmatrix}
0 \\ \mathcal{F}^0 \\ \vdots \\ \mathcal{F}^{N-2} \\ \mathcal{F}^{N-1}
\end{bmatrix}
= 0
$$

where

$$
\begin{aligned}
\mathcal{C} &= \begin{bmatrix}
I & \Delta t c^2 \star_2 d_1 \\
0 & I
\end{bmatrix} \\
\mathcal{D} &= \begin{bmatrix}
-I & 0 \\
\Delta t \star_1^{-1} d_1^T & -I \\
\end{bmatrix}
\end{aligned}
$$

### Cost function

The objective is to find initial conditions $\mathbf{e}$
where the solution at time $T$ is equal to $\mathbf{e}$.
We can accomplish this by formulating a least-squares optimization problem
that measures the difference between $U^N$ and $e$.
Specifically, we measure the _energy_

$$
J(\mathbf{e}, \mathbf{u}(\mathbf{e}))
= \frac{1}{2} (U^N - \mathbf{e})^T \Lambda (U^N - \mathbf{e})
$$

The gradient of the cost function with respect to $\mathbf{e}$
is needed for the optimization algorithm.
This can be obtained using the [[adjoint state method]]
which states that

$$
\frac{dJ}{d\mathbf{e}}
= \frac{\partial J}{\partial \mathbf{e}}
- \mathbf{z}^T \frac{\partial S}{\partial \mathbf{e}}
$$

where $\mathbf{z}$ is the solution of the adjoint equation

$$
\Big(\frac{\partial S}{\partial \mathbf{u}}\Big)^T
\mathbf{z} =
\Big(\frac{\partial J}{\partial \mathbf{u}}\Big)^T
$$

Since $U^n$ is the only value of $\mathbf{u}$ that exists in $J$,

$$
\Big(\frac{\partial J}{\partial \mathbf{u}}\Big)^T = \begin{bmatrix}
  0 \\ 0 \\ \vdots \\ 0 \\ \Lambda(U^N - \mathbf{e})
\end{bmatrix}.
$$

Similarly, since $\mathbf{e}$ is only present in the first row
of the state equation, $\frac{\partial S}{\partial \mathbf{e}} = (-I, 0, 0, \dots, 0)^T$
and thus $\mathbf{z}^T \frac{\partial S}{\partial \mathbf{e}} = -Z^0$.

we also know that

$$
\frac{\partial J}{\partial \mathbf{e}} = -\Lambda(U^N - \mathbf{e}).
$$

It follows that the gradient we're looking for is

$$
\frac{dJ}{d\mathbf{e}} = -\Lambda(U^N - \mathbf{e}) + Z^0.
$$

For this we need to compute $Z^0$ using the adjoint state equation.

The value of $\frac{\partial S}{\partial \mathbf{u}}$
is the multiplier matrix of $\mathbf{U}$ in $S$.
Thus, the adjoint state equation in matrix form is

$$
\begin{bmatrix}
  I & \mathcal{C}^T \\
  & \mathcal{D}^T & \mathcal{C}^T \\
  & & \mathcal{D}^T & \mathcal{C}^T \\
  & & & \ddots & \ddots \\
  & & & & \mathcal{D}^T & \mathcal{C}^T \\
  & & & & & \mathcal{D}^T \\
\end{bmatrix}
\begin{bmatrix}
  Z^0 \\ Z^1 \\ \vdots \\ Z^{N-1} \\ Z^N
\end{bmatrix}
= \begin{bmatrix}
  0 \\ 0 \\ \vdots \\ 0 \\ \Lambda (U^N - \mathbf{e})
\end{bmatrix}
$$

This can be solved with a backward procedure starting with

$$
Z^N = (\mathcal{D}^T)^{-1} \Lambda (U^N - \mathbf{e})
$$

followed by repeating

$$
Z^k = -(\mathcal{D}^T)^{-1} \mathcal{C}^T Z^{k+1}
$$

for $k = N-1, \dots, 1$ and finally

$$
Z^0 = -\mathcal{C}^T Z^1
$$

## Conjugate gradient optimization


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
thus the expression reduces to just $\mathbf{q}$ on the boundary curve.

The boundary conditions in terms of acoustic pressure and velocity are thus

$$
\begin{aligned}
v &= \frac{\partial}{\partial t}\phi_{inc} & \text{on } \gamma_{sca} \\
\mathbf{q} &= \star(\nabla\phi_{inc})^{\flat} & \text{on } \gamma_{sca} \\
\frac{1}{c}v + \mathbf{q} &= 0 & \text{on } \gamma_{ext} \\
\end{aligned}
$$

where

$$
\begin{aligned}
\frac{\partial}{\partial t}\phi_{inc} &= \omega\sin(\omega t - \vec{\kappa} \cdot \mathbf{x}) \\
\nabla \phi_{inc} &= -\vec{\kappa} \sin(\omega t - \vec{\kappa} \cdot \mathbf{x})
\end{aligned}
$$

Because $v$ is defined on dual mesh vertices and not on any boundary elements directly,
we need to approximate it on the boundary to apply the absorbing boundary condition.
A simple approximation is obtained by assuming $v$ to be constant
within each primal mesh triangle, and therefore constant
everywhere on the nearest boundary edge.
The boundary condition can then be applied for edge $\mathcal{E}_i$ as

$$
\mathbf{q}_i = -\frac{1}{c} \int_{\mathcal{E}_i} v_{\mathcal{E}_i} \,dl
= -\frac{1}{c} |\mathcal{E}_i|v_{\mathcal{E}_i}
$$

where $|\mathcal{E}_i|$ is the length of the edge and $v_{\mathcal{E}_i}$ is the value of $v$
on the nearest dual vertex to the edge.

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
