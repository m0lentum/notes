[wikipedia](https://en.wikipedia.org/wiki/Maxwell%27s_equations)

The Maxwell equations are a set of four partial differential equations
describing electromagnetic fields.
They can be written as follows:

- $\nabla \cdot E = \frac{\rho}{\varepsilon_0}$ (Gauss's law)
- $\nabla \cdot B = 0$ (Gauss's law for magnetism)
- $\nabla \times E = -\frac{\partial B}{\partial t}$ (Faraday's law of induction)
- $\nabla \times B = \mu_0 (J + \varepsilon_0 \frac{\partial E}{\partial t})$ (Ampère-Maxwell law)

Here $E$ and $B$ are the electric and magnetic fields,
$\rho$ is the electric charge density,
$J$ is the current density
$\varepsilon_0$ is the vacuum permittivity
and $\mu_0$ is the vacuum permeability.

Permittivity is a measure of how strong of an electric field
is produced by a given charge
(i.e. how much force it exerts on other charged particles).
Permeability is an analogous quantity for the magnetic field.

## [[Differential form]] representation
([Räbinä 2014](http://urn.fi/URN:ISBN:978-951-39-5951-7))

Räbinä uses a slightly different formulation of the equations
$$
\begin{aligned}
\nabla \times E &= -\frac{\partial B}{\partial t} - J^* \\
\nabla \times H &= \frac{\partial D}{\partial t} + J \\
\nabla \cdot B &= \rho^* \\
\nabla \cdot D &= \rho \\
\end{aligned}
$$
(TODO: why is this equivalent?)

where $E$ and $H$ are the electric and magnetic fields,
$\rho$ and $\rho^*$ are electric and magnetic charge densities,
and the additional fields $D = \varepsilon E$ and $B = \mu H$
are electric and magnetic flux densities,
$J = \sigma E$ and $J^* = \sigma^* H$ are electric and magnetic current densities,
and finally, $\sigma$ and $\sigma^*$ are electric and magnetic conductivities
in an absorbing material.

We can replace $E$ and $H$ with 1-forms $\tilde{E}$ and $\tilde{H}$ (for which $d = \nabla \times$),
$D$ and $B$ with 2-forms $\tilde{D}$ and $\tilde{B}$ (for which $d = \nabla \cdot$),
$J$ and $J^*$ with 2-forms, and $\rho$ and $\rho^*$ with 3-forms
(note that this is specifically in 3D),
and we get
$$
\begin{aligned}
d\tilde{E} &= -\partial_t \tilde{B} - \tilde{J}^* \\
d\tilde{H} &= \partial_t \tilde{D} + \tilde{J} \\
d\tilde{B} &= \tilde{\rho}^* \\
d\tilde{D} &= \tilde{\rho} \\
\end{aligned}
$$
with the relations between the 2-form fluxes
and 1-form fields given by
$$
\begin{aligned}
\tilde{D} &= \star \varepsilon \tilde{E} \\
\tilde{B} &= \star \mu \tilde{H} \\
\tilde{J} &= \star \sigma \tilde{E} \\
\tilde{J}^* &= \star \sigma^* \tilde{H} \\
\end{aligned}
$$
The [[continuity equation]] gives the following additional relation
for $\tilde{J}$ and $\tilde{\rho}$ (and the same for the magnetic equivalents):
$$
\partial_t \tilde{\rho} + d\tilde{J} = 0
$$
This applied to the exterior derivative of the first equation yields
$$
\begin{aligned}
dd\tilde{E} &= -\partial_t d\tilde{B} - dJ^* \\
0 &= -\partial_t d\tilde{B} + \partial_t \tilde{\rho^*} \\
\partial_t d\tilde{B} &= \partial_t \tilde{\rho^*} \\
\end{aligned}
$$
and
$$
\partial_t d\tilde{D} = \partial_t \tilde{\rho}.
$$
This implies that the last two of the four equations
are automatically preserved over time
and we don't need to consider them in time integration
as long as they are satisfied at one point in time.
Thus we have an initial value problem for the first two equations,
which can be expressed by applying all the relations derived here as
$$
\begin{aligned}
d\tilde{E} &= -\partial_t \tilde{B} - \tilde{J}^* \\
&= -\partial_t (\star \mu \tilde{H}) - \star\sigma^*\tilde{H} \\
&= -\star \mu \partial_t \tilde{H} - \star\sigma^*\tilde{H} \\
d\tilde{H} &= \partial_t \tilde{D} + \tilde{J} \\
&= \star \varepsilon \partial_t \tilde{E} + \star \sigma \tilde{E} \\
\tilde{E}(0) &= \tilde{E}_0 \\
\tilde{H}(0) &= \tilde{H}_0 \\
\end{aligned}
$$
This can be discretized using DEC.
