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
- $\overset{?}{f_i} = ?$
TODO: some sources have the flux as $D = D_xdy - D_ydx$, why?
I guess that expresses the same thing as the star?

How does $f$ interact with the other variables?
It's a 4-dimensional function that gets integrated over velocity space.
The result of the integral is a density which should be a 2-form.
Integrating over velocity space suggests that this should be a 2-form in velocity as well.
I guess that makes the value of $f$ a 4-form in 4D phase space?

The equations expressed with these variables and exterior calculus operators are
$$
\begin{aligned}
\frac{\partial E}{\partial t} &= -\varepsilon^{-1} (\star d H + J) \\
\frac{\partial H}{\partial t} &= \mu^{-1} d \star E \\
d \star D &= \rho = e \int_{-\infty}^{\infty} Z_i f_i(r, p, t) - f_e(r, p, t) \,d^2p \\
dB &= 0 \text{ trivial because $d$ of a volume form doesn't exist} \\
D &= \star \varepsilon E \\
B &= \star \mu H \\ 
0 &= \frac{\partial f_e}{\partial t} + v_e \cdot \frac{\partial f_e}{\partial r}
+ e(E + H_z \star v_e) \cdot \frac{\partial f_e}{\partial p} \\
0 &= \frac{\partial f_i}{\partial t} + v_i \cdot \frac{\partial f_i}{\partial r}
+ Z_i e(E + H_z \star v_i) \cdot \frac{\partial f_i}{\partial p} \\
\end{aligned}
$$

