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

#### Exact time stepping

In a time-harmonic case, the solution at timestep $k$
can be expressed in terms of complex exponentiation as

$$
\begin{aligned}
P^{k} &= \text{real}(\hat{P} \exp(-i\omega t^k)) \\
Q^{k} &= \text{real}(\hat{Q} \exp(-i\omega (t^k + \frac{\Delta t}{2}))
\end{aligned}
$$

Substituting this formula into the numerator of the approximation
for $\partial_t P(t^k)$ where $t^k = t + \frac{\Delta t}{2}$, we get

$$
\begin{aligned}
& P(t^k + \frac{\Delta t}{2}) - P(t^k - \frac{\Delta t}{2}) \\
&= \text{real} \Big[ \hat{P} \exp(-i\omega (t^k + \frac{\Delta t}{2})) \Big]
- \text{real} \Big[ \hat{P} \exp(-i\omega (t^k - \frac{\Delta t}{2}) \Big] \\
&= \text{real} \Big[ \hat{P} (\exp(-i\omega (t^k + \frac{\Delta t}{2}))
- \exp(-i\omega (t^k - \frac{\Delta t}{2})) \Big] \\
&= \text{real} \Big[ \hat{P} \exp(-i\omega t^k)
\Big( \exp(-i\omega \frac{\Delta t}{2}) - \exp(i\omega \frac{\Delta t}{2}) \Big) \Big] \\
&= \text{real} \Big[ -i\omega \hat{P} \exp(-i\omega t^k)
\Big(\frac{\exp(-i\omega \frac{\Delta t}{2}) - \exp(i\omega \frac{\Delta t}{2})}{-i\omega}\Big) \Big] \\
&= \text{real} \Big[ \partial_t P(t^k)
\Big(\frac{\exp(-i\omega \frac{\Delta t}{2}) - \exp(i\omega \frac{\Delta t}{2})}{-i\omega}\Big) \Big] \\
&= - \frac{1}{\omega} \partial_t P(t^k)
\cdot \text{Im} \Big[\exp(-i\omega \frac{\Delta t}{2}) - \exp(i\omega \frac{\Delta t}{2}) \Big] \\
&= \partial_t P(t^k) \Big(\frac{2}{\omega} \sin(\frac{\omega \Delta t}{2}) \Big) \\
\end{aligned}
$$

The exact same formula arises from $\partial_t Q(t^k)$ where $t^k = t$.

With this, denoting $\phi = \frac{\omega \Delta t}{2}$,
the approximation for the time derivatives becomes

$$
\begin{aligned}
\partial_t P &= \frac{P^{n+1} - P^n}{\frac{2}{\omega}\sin\phi} \\
\partial_t Q &= \frac{Q^{n+\frac{3}{2}} - Q^{n+\frac{1}{2}}}{\frac{2}{\omega}\sin\phi} \\
\end{aligned}
$$

and the update equations

$$
\begin{aligned}
P^{n+1} &= P^n + \frac{2}{\omega}\sin\phi (c^2 \star_2 d_1
	Q^{n+\frac{1}{2}} + F) \\
Q^{n+\frac{3}{2}} &= Q^{n+\frac{1}{2}}
+ \frac{2}{\omega}\sin\phi (\star_1^{-1} d_1^T P^{n+1}) \\
\end{aligned}
$$

### Harmonic Hodge

The standard (Yee's) discrete diagonal Hodge operator is based on
assuming locally constant fields (i.e. value of the continous field
is constant everywhere on a mesh element).
If we assume instead that the solution is spatially harmonic,
we can get an operator that reproduces harmonic waves more accurately.

The shape of a harmonic wave depends on its propagating direction,
which is not constant in practical applications.
Thus, we would like to minimize the error in a least-squares sense
for waves propagating in all directions.
In other words, given the wave $\hat{u} = \exp(i \vec{\kappa} \cdot \mathbf{x})$
propagating in direction $\mathbf{d}$,
and the primal and dual edge elements $\mathcal{E}$ and $\mathcal{E}^*$
related by the Hodge star with $\star_1 \int_{\mathcal{E}} \hat{u} \cdot d\mathbf{l} = \int_{\mathcal{E}^*} \hat{u} \cdot d\mathbf{l}$,
we'd like to minimize the error norm

$$
||\int_{\mathcal{E}} \hat{u} \cdot d\mathbf{l} - \star_1^{-1} \int_{\mathcal{E}^*} \hat{u} \cdot d\mathbf{l}\,||^2
$$

integrated over all directions $\mathbf{d}$.
Denoting $\hat{u}_{\mathcal{E}} = \int_{\mathcal{E}} \hat{u} \cdot d\mathbf{l}$
and $\hat{u}_{\mathcal{E}^*} = \int_{\mathcal{E}^*} \hat{u} \cdot d\mathbf{l}$,
this gives the quadratic equation

$$
\hat{u}_{\mathcal{E}}^2
- 2 \star_1^{-1} \hat{u}_{\mathcal{E}} \hat{u}_{\mathcal{E}^*}
+ (\star_1^{-1})^2 \hat{u}_{\mathcal{E}^*}^2
$$

the derivative of which with respect to $\star_1$ is

$$
2 \star_1^{-1} \hat{u}_{\mathcal{E}^*}^2 - 2 \hat{u}_{\mathcal{E}} \hat{u}_{\mathcal{E}^*}
$$

which is zero and thus the error is minimized when

$$
\star_1^{-1} = \frac{\hat{u}_{\mathcal{E}} \hat{u}_{\mathcal{E}^*}}{\hat{u}_{\mathcal{E}^*}^2}
\iff \star_1 = \frac{\hat{u}_{\mathcal{E}^*}^2}{\hat{u}_{\mathcal{E}} \hat{u}_{\mathcal{E}^*}}.
$$

(this is for a single element of $\star_1$ so these are all real numbers)

Integrating over the unit circle gives the minimized result across all directions:

$$
\star_1 = \frac{\int_{0}^{2\pi} \hat{u}_{\mathcal{E}^*}^2 \,d\theta}
{\int_{0}^{2\pi} \hat{u}_{\mathcal{E}} \hat{u}_{\mathcal{E}^*} \,d\theta}
$$

Here $\hat{u}_{\mathcal{E}}$ is the wave $\hat{u} = \exp(i\vec{\kappa} \cdot \mathbf{x})$
integrated over $\mathcal{E}$ and the wave vector $\vec{\kappa}$
is dependent on the integration direction by $\vec{\kappa} = \frac{\omega}{c} \mathbf{d}$,
$\mathbf{d} = (\cos\theta, \sin\theta)$.

Because we integrate over the entire unit circle,
the solution will be the same regardless of the orientation of the edges
(as long as they're orthogonal),
so we can simplify computations by assuming
$\mathcal{E}$ is oriented along the x-axis and $\mathcal{E}^*$ along the y-axis,
each centered at the origin. With these assumptions,
the Taylor series $\exp(ax) = \sum_{n=0}^{\infty} \frac{a^nx^n}{n!}$,
and the auxiliary variable $\alpha = i \frac{\omega}{c} \cos\theta$ we get

$$
\begin{aligned}
\hat{u}_{\mathcal{E}} &= \int_{\mathcal{E}} \hat{u} \\
&= \int_{-\frac{l}{2}}^{\frac{l}{2}} \exp(i \frac{\omega}{c} x \cos\theta) \,dx \\
&= \int_{-\frac{l}{2}}^{\frac{l}{2}} \sum_{n=0}^{\infty} \frac{\alpha^n x^n}{n!} \,dx \\
&= \Big[ \sum_{n=0}^{\infty} \frac{1}{n}\frac{\alpha^n x^{n+1}}{n!} \Big]_{x = -\frac{l}{2}}^{x = \frac{l}{2}} \\
&= \sum_{n=0}^{\infty} \frac{\alpha^n \Big( (\frac{l}{2})^{n+1} - (-\frac{l}{2})^{n+1} \Big)}{(n + 1)!} \\
&\text{terms where $n$ is odd are eliminated} \\
&= \sum_{n=0}^{\infty} \frac{\alpha^{2n} 2(\frac{l}{2})^{2n+1}}{(2n + 1)!} \\
&= \sum_{n=0}^{\infty} \frac{\alpha^{2n} l^{2n+1}}{2^{2n}(2n + 1)!} \\
&= l \sum_{n=0}^{\infty} \frac{(\alpha l)^{2n}}{2^{2n}(2n + 1)!} \\
\end{aligned}
$$

Similarly, the exponential term for $\hat{u}_{\mathcal{E}^*}$
is $\beta = i \frac{\omega}{c} \sin\theta$
and the same integration (denoting length of the dual edge with $l^*$) produces

$$
\hat{u}_{\mathcal{E}^*} = l^* \sum_{n=0}^{\infty} \frac{(\beta l^*)^{2n}}{2^{2n}(2n + 1)!}.
$$

The first few terms of this series are

$$
\hat{u}_{\mathcal{E}} = l \Big( 1 + \frac{(\alpha l)^2}{24} + \frac{(\alpha l)^4}{1920} \Big).
$$

With these series expressions we can build the products
in the optimized Hodge star as series
whose first few terms are

$$
\begin{aligned}
\hat{u}_{\mathcal{E}^*}^2 &\approx (l^*)^2
\Big( 1 + \frac{(\beta l^*)^2}{12} + \frac{(\beta l^*)^4}{360} \Big) \\
\hat{u}_{\mathcal{E}} \hat{u}_{\mathcal{E}^*} &\approx ll^*
\Big( 1 + \frac{(\alpha l)^2}{24} + \frac{(\beta l^*)^2}{24} + \frac{(\alpha l \beta l^*)^2}{576} \Big) \\
\end{aligned}
$$

Now we need to integrate these expressions around the unit circle.
First, we can get rid of the imaginary terms in $\alpha$ and $\beta$
by evaluating the even powers.
Defining

$$
\hat{\kappa}_{\mathcal{E}} := \frac{\omega^2}{c^2} l^2,
\qquad \hat{\kappa}_{\mathcal{E}^*} := \frac{\omega^2}{c^2} (l^*)^2
$$

for which $(\alpha l)^2 = -\hat{\kappa}_{\mathcal{E}} \cos^2 \theta$
and $(\beta l^*)^2 = -\hat{\kappa}_{\mathcal{E}^*} \sin^2 \theta$
and renaming $l = |\mathcal{E}|$, $l^* = |\mathcal{E}^*|$
we get

$$
\begin{aligned}
\int_{0}^{2\pi} \hat{u}_{\mathcal{E}^*}^2 \,d\theta
&\approx |\mathcal{E}^*|^2 \int_{0}^{2\pi}
\Big( 1 - \frac{\hat{\kappa}_{\mathcal{E}^*} \sin^2\theta}{12}
+ \frac{\kappa_{\mathcal{E}^*}^2 sin^4\theta}{360} \Big) \,d\theta \\
&= 2|\mathcal{E}^*|^2 \pi \Big(
1 - \frac{\hat{\kappa}_{\mathcal{E}^*}}{6} + \frac{\hat{\kappa}_{\mathcal{E}^*}^2}{240}
\Big) \\
\\
\int_{0}^{2\pi} \hat{u}_{\mathcal{E}} \hat{u}_{\mathcal{E}^*} \,d\theta
&\approx |\mathcal{E}| |\mathcal{E}^*| \int_{0}^{2\pi}
\Big( 1 - \frac{\hat{\kappa}_{\mathcal{E}} \cos^2\theta}{24}
- \frac{\hat{\kappa}_{\mathcal{E}^*} \sin^2\theta}{24}
+ \frac{\hat{\kappa}_{\mathcal{E}} \cos^2\theta \hat{\kappa}_{\mathcal{E}^*} \sin^2\theta}{576} \Big) \,d\theta \\
&= 2 |\mathcal{E}| |\mathcal{E}^*| \pi \Big(
1 - \frac{\hat{\kappa}_{\mathcal{E}}}{12} - \frac{\hat{\kappa}_{\mathcal{E}^*}}{12}
+ \frac{\hat{\kappa}_{\mathcal{E}} \hat{\kappa}_{\mathcal{E}^*}}{1152} \Big) \\
\end{aligned}
$$

Leaving out the final terms which are too small to have an effect in our scenario,
and dividing these according to the formula for $\star_1$ yields

$$
\star_1 \approx \frac{|\mathcal{E}^*|}{|\mathcal{E}|}
\Big( \frac{1 - \frac{\hat{\kappa}_{\mathcal{E}^*}}{6}}
{ 1 - \frac{\hat{\kappa}_{\mathcal{E}}}{12} - \frac{\hat{\kappa}_{\mathcal{E}^*}}{12} } \Big).
$$

#### Face to vertex

The same consideration for $\star_2$ going from a primal face $\mathcal{F}$
to a dual vertex $v^*$ at the origin yields

$$
\star_2 = \frac{\int_0^{2\pi} \hat{u}(v^*)^2 \,d\theta}{\int_0^{2\pi} \hat{u}_{\mathcal{F}} \hat{u}(v^*) \,d\theta}
$$

where $\hat{u}_{\mathcal{F}}$ is the wave $\hat{u}$ integrated over the face
and $\hat{u}(v^*)$ is the wave evaluated at the vertex.
We can assume for now that the face is a circle with radius $r$ and area $\pi r^2$.
A generalization for polygons will be performed later.

The vertex being at the origin means $\hat{u}(v^*) = \hat{u}(0) = \exp(0) = 1$.

The integral of $\hat{u}$ over the circular face $\mathcal{F}$ is
symmetric for all angles $\theta$, so we may assume $\theta = \frac{\pi}{2}$,
i.e. that the wave is propagating along the y-axis.
Let $\gamma = \frac{i\omega}{c}$, and we have

$$
\begin{aligned}
\hat{u}_{\mathcal{F}} &= \int_{\mathcal{F}} \hat{u} \\
&= \int_{-r}^{r} \int_{-\sqrt{r^2 - x^2}}^{\sqrt{r^2 - x^2}}
  \exp(i\frac{\omega}{c} y) \,dydx \\
&= \int_{-r}^{r} \int_{-\sqrt{r^2 - x^2}}^{\sqrt{r^2 - x^2}}
  \sum_{n=0}^{\infty} \frac{\gamma^n y^n}{n!} \,dydx \\
&= \int_{-r}^{r} \sum_{n=0}^{\infty}
  \frac{\gamma^n \Big((\sqrt{r^2 - x^2})^{n+1} - (-\sqrt{r^2 - x^2})^{n+1} \Big)}{(n + 1)!} \,dydx \\
&\text{terms where $n$ is odd are eliminated} \\
&= \int_{-r}^{r} \sum_{n=0}^{\infty} \frac{2 \gamma^{2n} (\sqrt{r^2 - x^2})^{2n+1}}{(2n + 1)!} \,dx \\
\end{aligned}
$$

Here we change variable to $t$ such that $x = r\sin t$,
for which $dx = r\cos t dt$ and $\sqrt{r^2 - x^2} = r\cos t$,
and continue to integrate the first few terms of the series:

$$
\begin{aligned}
\hat{u}_{\mathcal{F}}
&= \int_{-\frac{\pi}{2}}^{\frac{\pi}{2}}
  \sum_{n=0}^{\infty} \frac{2\gamma^{2n} (r\cos t)^{2n+1}}{(2n + 1)!} r\cos t \,dt \\
&= \sum_{n=0}^{\infty} \frac{2\gamma^{2n} r^{2n+2}}{(2n + 1)!}
  \int_{-\frac{\pi}{2}}^{\frac{\pi}{2}} (\cos t)^{2n+2} \,dt \\
&= \pi r^2 \Big( 1 + \frac{(\gamma r)^2}{8} + \frac{(\gamma r)^4}{192} + \dots \Big) \\
\end{aligned}
$$

Let $\hat{\kappa}_{\mathcal{F}} = \frac{\omega^2}{c^2} r^2$, for which
$(\gamma r)^2 = -\hat{\kappa}_{\mathcal{F}}$
and $|\mathcal{F}| = \pi r^2$.
Integrating $\hat{u}_{\mathcal{F}} \hat{u}(v^*)$ over the unit circle then gives

$$
\begin{aligned}
\int_{0}^{2\pi} \hat{u}_{\mathcal{F}} \hat{u}(v^*) \,d\theta
&\approx |\mathcal{F}| \int_{0}^{2\pi}
  \Big( 1 - \frac{\hat{\kappa}}{8} + \frac{\hat{\kappa}^2}{192} \Big) \,d\theta \\
&= 2\pi |\mathcal{F}| \Big( 1 - \frac{\hat{\kappa}_{\mathcal{F}}}{8}
+ \frac{\hat{\kappa}_{\mathcal{F}}^2}{192} \Big) \\
\end{aligned}
$$

Because $\hat{u}(v^*)^2$ is the constant 1, its integral over the unit circle is $2\pi$.
It follows that

$$
\star_2 \approx \frac{1}{|\mathcal{F}|}
\Big( \frac{1}{1 - \frac{\hat{\kappa}_{\mathcal{F}}}{8} + \frac{\hat{\kappa}_{\mathcal{F}}^2}{192}} \Big).
$$

#### Polygon faces

The preceding derivation was based on circular faces,
but the faces in practical applications are polygons.
We can make use of results obtained from the circle case
by approximating polygons with circles.

Given a regular polygon with maximum internal sphere radius $r$
and minimum external sphere radius $R$,
integrating over a triangle or square using the approximation $r^2_{\mathcal{F}} = \frac{1}{3} (2r^2 + R^2)$
matches the first three terms of the Taylor polynomial obtained from the circle case.
(TODO: work through the integration to verify this)

With irregular convex polygons, each edge defines a different value for $r$
and each vertex a different value for $R$.
$r_k$ is the perpendicular distance from the origin to the edge $k$
and $R_k$ is the distance to the vertex $k$.
The approximation we use for irregular polygons with $n$ edges is the average
of the regular polygon approximations corresponding to each edge

$$
r_{\mathcal{F}}^2 \approx \frac{1}{3n} \sum_{k=1}^n (2r_k^2 + R_k^2).
$$

Applying this to $\hat{\kappa}_{\mathcal{F}}$ yields

$$
\hat{\kappa}_{\mathcal{F}} = \frac{\omega^2}{3nc^2} \sum_{k=1}^n (2r_k^2 + R_k^2).
$$

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

Here $U^N$ is a function of $\mathbf{e}$, specifically

$$
U^N = Q^N \mathbf{e}
- \sum_{i=0}^{N-1} Q^i \mathcal{D}^{-1} \mathcal{F}^{(N-1)-i}
$$

where $Q = -\mathcal{D}^{-1} \mathcal{C}$,
which follows from applying the recursive time-stepping formula
$U^{k+1} = -\mathcal{D}^{-1} (\mathcal{C} U^k + \mathcal{F}^k)$ $N$ times.

Using this information to manipulate $J$ to find
its quadratic structure and its gradient.
Defining $\mathbf{g} = \sum_{i=0}^{N-1} Q^i \mathcal{D}^{-1} \mathcal{F}^{(N-1)-i}$
which is a vector of the same dimension as $\mathbf{e}$,

$$
\begin{aligned}
J(\mathbf{e})
&= \frac{1}{2} (U^N - \mathbf{e})^T \Lambda (U^N - \mathbf{e}) \\
&= \frac{1}{2} ((Q^N - I) \mathbf{e} - \mathbf{g})^T \Lambda ((Q^N - I) \mathbf{e} - \mathbf{g}) \\
&= \frac{1}{2} \mathbf{e}^T (Q^N - I)^T \Lambda (Q^N - I) \mathbf{e} \\
&\qquad -\, \frac{1}{2} (\mathbf{e}^T (Q^N - I)^T \Lambda \mathbf{g}
  - \mathbf{g}^T \Lambda (Q^N - I)\mathbf{e}) \\
&\qquad +\, \frac{1}{2} \mathbf{g}^T \Lambda \mathbf{g} \\
&= \frac{1}{2} \mathbf{e}^T (Q^N - I)^T \Lambda (Q^N - I) \mathbf{e}
- \mathbf{g}^T \Lambda (Q^N - I)\mathbf{e}
+ \frac{1}{2} \mathbf{g}^T \Lambda \mathbf{g} \\
&=: \frac{1}{2}\mathbf{e}^T A \mathbf{e} - b^T \mathbf{e} + c \\
\end{aligned}
$$

The last simplification step is due to the symmetry
of the $\Lambda$-inner product.

From this we get an expression for the gradient of $J$,

$$
\nabla J(\mathbf{e}) = A\mathbf{e} - b
$$

#### Computing the gradient

We don't need to explicitly build the matrix $A$ to obtain the gradient.
We can get it using the [[adjoint state method]]
which states that

$$
\frac{dJ}{d\mathbf{e}}
= \frac{\partial J}{\partial \mathbf{e}}
- \mathbf{z}^T \frac{\partial S}{\partial \mathbf{e}}
$$

where $S$ is the state equation
and $\mathbf{z}$ is the solution of the adjoint equation

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

Writing out what $Z^k = -(\mathcal{D}^T)^{-1} \mathcal{C}^T Z^{k+1}$
means on a row by row basis:

$$
\begin{aligned}
Z^k &= -(\mathcal{D}^T)^{-1} \mathcal{C}^T Z^{k+1} \\
&= -\begin{bmatrix}
  -I & (\Delta t \star_1^{-1} d_1^T)^T \\
  0 & -I \\
\end{bmatrix}^{-1}
\begin{bmatrix}
  I & 0 \\
  (\Delta t c^2 \star_2 d_1)^T & I \\
\end{bmatrix}
\begin{bmatrix}
  z_0^{k+1} \\ z_1^{k+1}
\end{bmatrix} \\
\end{aligned}
$$

which is equivalent to solving the equation

$$
\begin{bmatrix}
  -I & (\Delta t \star_1^{-1} d_1^T)^T \\
  0 & -I \\
\end{bmatrix}
\begin{bmatrix}
  z_0^k \\ z_1^k
\end{bmatrix}
= -\begin{bmatrix}
  I & 0 \\
  (\Delta t c^2 \star_2 d_1)^T & I \\
\end{bmatrix}
\begin{bmatrix}
  z_0^{k+1} \\ z_1^{k+1}
\end{bmatrix}
$$

leading to the update formulas

$$
\begin{aligned}
z_1^k &= z_1^{k+1} + (\Delta t c^2 \star_2 d_1)^T z_0^{k+1} \\
z_0^k &= z_0^{k+1} + (\Delta t \star_1^{-1} d_1^T)^T z_1^k \\
\end{aligned}
$$

### Optimization algorithm

We use the [[Conjugate Gradient algorithm]] to find the minimum
of the cost function $J$ defined earlier.
This algorithm involves the residual $r = b - Ax$
and the direction update term $Ap_i$,
but we don't have access to the matrix $A$.

This is where the adjoint state equation comes in.
It provides a value for $\nabla J(x) = Ax - b = -r$,
and we can compute $b$ during the forward solve.
From these we get $Ap_i = \nabla J(p_i) + b$,
where $b = (Q^n - I)^T \Lambda (\sum_{i=0}^{N-1} Q^i \mathcal{D}^{-1} \mathcal{F}^{(N-1)-i})$.

The sum $\mathbf{g} = \sum_{i=0}^{N-1} Q^i \mathcal{D}^{-1} \mathcal{F}^{(N-1)-i}$
is equivalent to summing the contributions
of source terms to $U$ on each time step
and then time-stepping this vector just like the state vector.
However, in practice we don't need to compute $b$ at all.
Because source terms are present in $b$ and not in $A$,
we can obtain $Ap_i$ by setting source terms to zero
and then computing the gradient as usual.

Note: turns out this doesn't work right
if the computation mesh is bad.
It's possible to get reasonable results
from the forward-in-time state solver for a sufficiently smooth state
while the same solver for the search directions
gets stuck in oscillations or becomes unstable.
This took me nearly a week to figure out :^)

#### Initial values

To ensure stability, initial values for the CG algorithm
should fulfill all boundary conditions to avoid discontinuities.
This can be achieved using the _Mur transition_:
the application of a smooth easing function to source terms
from time 0 to $t_{tr}$.

The easing function used by Mur is

$$
f_{tr}(t) = (2 - \sin(\frac{\pi}{2} \frac{t}{t_{tr}}))\sin(\frac{\pi}{2} \frac{t}{t_{tr}})
$$

To apply this, we set the transition time $t_{tr}$ to a multiple
of the source terms' time period $T$,
set the initial state to zero,
and run the forward-in-time simulation until time $t_{tr}$
with the source terms multiplied by $f_{tr}(t)$.
We then take the state of the simulation at time $t_{tr}$
and use it as the initial state for the CG algorithm.

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
p &= \frac{\partial}{\partial t}\phi_{inc} & \text{on } \gamma_{sca} \\
\mathbf{q} &= \star(\nabla\phi_{inc})^{\flat} & \text{on } \gamma_{sca} \\
\frac{1}{c}p + \mathbf{q} &= 0 & \text{on } \gamma_{ext} \\
\end{aligned}
$$

where

$$
\begin{aligned}
\frac{\partial}{\partial t}\phi_{inc} &= \omega\sin(\omega t - \vec{\kappa} \cdot \mathbf{x}) \\
\nabla \phi_{inc} &= -\vec{\kappa} \sin(\omega t - \vec{\kappa} \cdot \mathbf{x})
\end{aligned}
$$

Because $p$ is defined on dual mesh vertices and not on any boundary elements directly,
we need to approximate it on the boundary to apply the absorbing boundary condition.
A simple approximation is obtained by assuming $p$ to be constant
within each primal mesh triangle, and therefore constant
everywhere on the nearest boundary edge.
The boundary condition can then be applied for edge $\mathcal{E}_i$ as

$$
\mathbf{q}_i = -\frac{1}{c} \int_{\mathcal{E}_i} p_{\mathcal{E}_i} \,dl
= -\frac{1}{c} |\mathcal{E}_i|p_{\mathcal{E}_i}
$$

where $|\mathcal{E}_i|$ is the length of the edge and $p_{\mathcal{E}_i}$ is the value of $p$
on the nearest dual vertex to the edge.

Initial conditions for the time-dependent case can be set to e.g.

$$
\begin{aligned}
p^0 &= \omega \sin(\vec{\kappa} \cdot \mathbf{x}) \\
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

We set initial conditions to $p = \frac{\partial \phi}{\partial t}|_{t=0}$ and $w = \nabla \phi |_{t=0}$ and boundary conditions
in $\gamma_{ext} \times [0, T]$ to $p = \frac{\partial \phi}{\partial t}$ and $w = \nabla \phi$, solve the state equation using DEC,
and examine the error in the interior of the computation mesh.

## Possible TODOs

- Hodge-optimize the mesh
- harmonic Hodge star
- examine stability and pick timestep size accordingly
  (currently I'm just experimentally picking one that works)
- figure out how to measure mesh quality
  and how control method convergence is affected by this
- **update comments in the code files**
	- and add .md note with some theory?