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
Assuming the force is the [[Lorentz force]] $F = q(E + v \times B)$
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
to arrive at a system describing electromagnetically interacting plasma
(see the Wikipedia article linked at the start).

