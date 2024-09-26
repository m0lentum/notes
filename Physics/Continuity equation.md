[wikipedia](https://en.wikipedia.org/wiki/Continuity_equation)
A continuity equation describes the time evolution 
of some continuous quantity.
It is a _local_ form of conservation laws such as conservation of mass,
implying that not only does the quantity stay constant over the entire system,
it also cannot "teleport" discontinuously from place to place.

## Fluid mechanics

(paraphrased from Pecseli, H. (2013). Waves and Oscillations in Plasmas.)

Say we have a 1-dimensional fluid with a velocity field $u$
and a mass density field $\rho$,
and we want it to conserve its mass over time.
The mass density at a point $x$ can change for two reasons.

First, if it varies over distance, $\Delta \rho = \rho(x + \Delta x) - \rho(x) \neq 0$,
then due to velocity $u = \frac{\Delta x}{\Delta t}$
(where $\Delta x$ was chosen to match the velocity)
transporting the mass, a fixed observer at $x$ will experience
a difference of $-\Delta \rho$ over time $\Delta t$
(because $\rho(x)$ is moved to $\rho(x + \Delta x)$ over that time).
Using this to approximate the time derivative of mass density
we get 
$$
\frac{\Delta \rho}{\Delta t}
= -\frac{\Delta x}{\Delta t}\frac{\Delta \rho}{\Delta x}
= -u\frac{\Delta \rho}{\Delta x}
\approx -u\frac{\partial \rho}{\partial x}.
$$

Second, if the fluid is _compressible_,
there can be gradients in velocity,
causing a different amount of fluid
to enter a volume than is exiting it
and thereby changing the mass density.
Let $\Delta u = u(x + \Delta x) - u(x) \neq 0$.
Then the change of mass density at $x$ is approximated as
the difference between entering and exiting density
$$
\frac{\Delta \rho}{\Delta t} = \rho u(x) - \rho u(x + \Delta x)
= -\rho\frac{\Delta u}{\Delta x}
\approx -\rho \frac{\partial u}{\partial x}.
$$
Combining these results we get
$$
\frac{\partial \rho}{\partial t}
= -u\frac{\partial \rho}{\partial x} - \rho\frac{\partial u}{\partial x}
= -\frac{\partial (u\rho)}{\partial x}
$$
(due to the product rule for derivatives).

In higher dimensions the same reasoning applies
resulting in the sum of partial derivatives in all basis directions,
i.e. the divergence, and gives the following equation:
$$
\frac{\partial}{\partial t}\rho + \nabla \cdot (\mathbf{u}\rho) = 0
$$
Integrating this over a volume gives an intuitive interpretation:
$$
\frac{\partial}{\partial t} \int_{\mathcal{V}} \rho(\mathbf{r}, t) \,dV
= -\int_{\mathcal{V}} \nabla \cdot (\mathbf{u} \rho) \,dV
= -\int_{\mathcal{S}} (\mathbf{u}\rho) \cdot \hat{\mathbf{n}} \,dS
$$
meaning that the mass within any volume changes only due to a net flux
over the volume's boundary.
