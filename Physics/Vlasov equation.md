[wikipedia](https://en.wikipedia.org/wiki/Vlasov_equation)

The Vlasov equation describes a system of plasma
where particles influence each other through long-range interactions
such as electromagnetic fields
and not through pair collisions.

The core of this model is the _distribution function_
$f(x, p, t)$ describing the number per unit volume
of particles with approximately position $x$ and momentum $p$.
Sometimes velocity $v$ is used in place of momentum,
related by $p = mv$.

This distribution function is the unknown
in the _collisionless Boltzmann equation_
$$
\frac{d}{dt} f(r, p, t) = 0
$$
where
$$
\frac{d}{dt}f = \frac{\partial f}{\partial t}
+ \frac{dr}{dt} \cdot \frac{\partial f}{\partial r}
+ \frac{dp}{dt} \cdot \frac{\partial f}{\partial p}.
$$

$\frac{dr}{dt}\frac{\partial f}{\partial r}$ is the _diffusion_ term
describing the change in distribution caused by particles moving
from place to place,
where $\frac{dr}{dt} = v = \frac{p}{m}$.

$\frac{dp}{dt}$ is the _force_ acting on particles.

## Vlasov-Maxwell equations

Assuming the aforementioned force is the [[Lorentz force]]
$F = q(E + v \times B)$
where $q$ is the charge of a particle,we get
$$
\frac{\partial f}{\partial t}
+ v \cdot \frac{\partial f}{\partial r}
+ q(E + v \times B) \cdot \frac{\partial f}{\partial p}
= 0.
$$

Given the particle distribution function we get the charge density
at a given position $r$ by counting the particles at $r$,
i.e. integrating over all momenta,
$$
\rho(r, t) = q \int_{-\infty}^{\infty} f(r, p, t) \,d^3p
$$
and the current density analogously by counting the total velocity at $r$,
$$
J = q \int_{-\infty}^{\infty} fv \,d^3p.
$$

We can then combine these with the [[Maxwell equations]]
for propagating the electric and magnetic fields forward in time
to arrive at a system describing electromagnetically interacting plasma:

Say we have a plasma consisting of
negatively charged electrons with charge $e$,
mass $m_e$ and distribution $f_e(r, p, t)$
and positively charged ions with charge $Z_i e$,
mass $m_i$ and distribution $f_i(r, p, t)$.
Then we have a Vlasov equation for each type of particle
as defined earlier plus the [[Maxwell equations]]

$$
\begin{aligned}
\frac{\partial f_e}{\partial t} + v_e \cdot \frac{\partial f_e}{\partial r}
&+ e(E + v_e \times B) \cdot \frac{\partial f_e}{\partial p} = 0 \\
\frac{\partial f_i}{\partial t} + v_i \cdot \frac{\partial f_i}{\partial r}
&+ Z_i e(E + v_i \times B) \cdot \frac{\partial f_i}{\partial p} = 0 \\
\nabla \times E &= -\frac{\partial B}{\partial t} \\
\nabla \times B &= \mu_0 (J + \varepsilon_0 \frac{\partial E}{\partial t}) \\
\nabla \cdot E &= \frac{\rho}{\varepsilon_0} \\
\nabla \cdot B &= 0 \\
\end{aligned}
$$
where $\rho$ and $J$ are defined above
and $v_{\alpha} = \frac{p_{\alpha}}{m_{\alpha}}$.

(This is ignoring the relativistic lightspeed terms in the Wikipedia formulation.)

Note: this form of the equations isn't directly translatable
to differential forms because it involves both $\nabla \times E$ and $\nabla \cdot E$,
which we can't express at the same time with the exterior derivative
(it's $\nabla \times$ if E is a 1-form and $\nabla \cdot$ if E is a 2-form).
We can fix this by applying constitutive relations (see [[Maxwell equations]]).
However, let's think about 2D first.

### 2D

[[Maxwell equations#2D]] for transverse electric (TE) waves
where $H$ is orthogonal and $E$ parallel to the xy plane,
(TODO: does that mode make sense to apply here?
what are the physical implications?):
$$
\begin{aligned}
\frac{\partial E_y}{\partial t} &= -\varepsilon^{-1} (\frac{\partial H_z}{\partial x} + J_y) \\
\frac{\partial E_x}{\partial t} &= \varepsilon^{-1} (\frac{\partial H_z}{\partial y} - J_x) \\
\frac{\partial H_z}{\partial t}
&= \mu^{-1} (\frac{\partial E_x}{\partial y}  - \frac{\partial E_y}{\partial t}) \\
\end{aligned}
$$
($B$ replaced with $H$ because this seems to be the more common notation)

For the Vlasov equation, $r$ and $p$ simply become two-dimensional vectors.
However, the Coulomb force contains a cross product with the magnetic field.
Here the magnetic field is orthogonal to the xy plane and we get
$$
\frac{\partial f}{\partial t} + v \cdot \frac{\partial f}{\partial r}
+ e(E + H_z(-v_y, v_x)) \cdot \frac{\partial f}{\partial p} = 0
$$
(with the subscripts removed to clarify $v = (v_x, v_y)$)

Denoting by $\perp$ the counterclockwise rotation by 90 degrees, $\perp((x, y)) = (-y, x)$,
(which is also the effect of the Hodge star on 1-forms),
we can express the equations given so far as
$$
\begin{aligned}
\frac{\partial E}{\partial t} &= -\varepsilon^{-1} (\perp(\nabla H_z) + J) \\
\frac{\partial H_z}{\partial t} &= \mu^{-1} \nabla \cdot E \\
\nabla \cdot D &= \rho = e \int_{-\infty}^{\infty} Z_i f_i(r, p, t) - f_e(r, p, t) \,d^2p \\
\nabla \cdot B &= 0 \\
D &= \varepsilon E \\
B &= \mu H \\ 
0 &= \frac{\partial f_e}{\partial t} + v_e \cdot \frac{\partial f_e}{\partial r}
+ e(E + H_z \perp(v_e)) \cdot \frac{\partial f_e}{\partial p} \\
0 &= \frac{\partial f_i}{\partial t} + v_i \cdot \frac{\partial f_i}{\partial r}
+ Z_i e(E + H_z \perp(v_i)) \cdot \frac{\partial f_i}{\partial p} \\
\end{aligned}
$$

#### [[Differential form]] representation

To express the above equations in terms of differential forms,
we can use the following variables (overhead number denoting form dimension):
- $\overset{1}{E} = E_xdx + E_ydy$
- $\overset{1}{D} = D_xdx + D_ydy = \star \varepsilon E$
- $\overset{2}{\rho} = \rho dx \wedge dy$
- $\overset{1}{J} = J_xdx + J_ydy$
- $\overset{0}{H} = H_z$
- $\overset{2}{B} = B_z dx \wedge dy = \star \mu H$
- $\overset{0}{f_i} = f$ (for which $\star f = f dp_1 \wedge dp_2$)
TODO: some sources have the flux as $D = D_xdy - D_ydx$, why?
I guess that expresses the same thing as the star?

The differentials in the Vlasov equation are gradients,
which suggests 0-forms.
However, we also have need to take a surface integral of it 
over the velocity space, which suggests 2-forms.
We can convert between the two with $\star$,
but care must be taken to get place things on meshes
such that we get matching primal/dual cochains in all formulas (working on it..)
Let's try with 0-forms first.

The dot products with velocities and gradients of $f$ in the Vlasov equation
are equivalent to the Lie derivative of a 0-form $\mathcal{L}_v f \equiv v \cdot \nabla_r f$.
Discretizing this is a tricky matter,
but let's just express the equations in terms of this first.
Denoting by $V_{\alpha}$ the velocity field consisting of all $v_{\alpha}$
and by $F_{\alpha}$ the Lorentz force field $q_{\alpha}(E + H \star v_{\alpha})$
(where $q_e = e$, $q_i = Z_i e$),
combining into a total 4D field $(V_{\alpha}, F_{\alpha})$,
we get the system
$$
\begin{aligned}
\frac{\partial \overset{1}{E}}{\partial t} &= -(\star \varepsilon)^{-1} (\star d \overset{0}{H} + \overset{1}{J}) 
= -\varepsilon^{-1} (d\overset{0}{H} + \overset{1}{J}) \\

\overset{1}{J}(r) &= \int_{p} \star (q_i \overset{0}{f_i}(r, p) - q_e \overset{0}{f_e}(r, p)) v \\

\frac{\partial \overset{0}{H}}{\partial t} &= (\star \mu)^{-1} d \star \overset{1}{E} 
= \mu^{-1} \star d \star \overset{1}{E} \\

d \star \overset{1}{D} &= \overset{2}{\rho} = \int_{p} \star (q_i \overset{0}{f_i} - q_e \overset{0}{f_e}) \\

d\overset{2}{B} &= 0 \text{ trivial because $d$ of a volume form doesn't exist} \\

\overset{1}{D} &= \star \varepsilon \overset{1}{E}
\text{ (used to derive eq. 1 from the $\partial_t D$ form)} \\

\overset{2}{B} &= \star \mu \overset{0}{H} \\ 

\frac{\partial \overset{0}{f_e}}{\partial t} &= -\mathcal{L}_{(V_e, F_e)} \overset{0}{f_e} \\

\frac{\partial \overset{0}{f_i}}{\partial t} &= -\mathcal{L}_{(V_i, F_i)} \overset{0}{f_i} \\
\end{aligned}
$$

TODO: ~~the Lorentz force results in something that isn't actually a 1-form
but we should be advecting things along a 1-form field~~?
Never mind, it's a 1-form, just currently unclear if dual or primal.
(or actually, does it need to be a vector field?
in Euclidean space it's not really an important distinction
but makes a difference in arbitrary metric spaces)
Also, be more consistent about whether the Vlasov equation
is in momentum or velocity space

The electromagnetic field equations
match the pressure-velocity acoustics equations as they should,
and the form dimensions seem to match in all the equations 👍
However, as learned in that case,
boundary conditions may involve fluxes across the boundary,
so be prepared to express these equations in terms of electric flux instead.

#### Lie derivative discretization

Algebraic derivation from Hirani (2003): Discrete Exterior Calculus:
$\mathcal{L}_X(\omega) = \mathbf{i}_Xd\omega + d\mathbf{i}_X\omega$
where
$\mathbf{i}_X\omega = (-1)^{k(n-k)} \star(\star\omega \wedge X^{\flat})$
for the 0-form $f$ the second term disappears and we get
$\mathcal{L}_X(f) = \mathbf{i}_X df = \star(\star d f \wedge X^{\flat})$.

Basic finite difference time discretization for $\frac{\partial f}{\partial t} = -\mathcal{L}_X(f)$:
$$
\frac{f^{n+1} - f^n}{\Delta t} = -\star(\star d f^{?} \wedge X^{\flat})
$$
gives the explicit timestep
$$
f^{n+1} = f^n - \star(\star d f^n \wedge X^{\flat})
$$
however, this seems to be unconditionally unstable,
at least in my test example where $X$ is constant.
An implicit version would be to solve
$$
(I + \Delta t L_X) f^{n+1} = f^n
$$
where $L_X$ is the matrix that computes $\star(\star d f^{n+1} \wedge X^{\flat})$
when multiplied with $f^{n+1}$
(this exists because the discrete wedge product
is defined a linear combination of cochain elements)

TODO: look into more sophisticated time discretizations
