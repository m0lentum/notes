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
where $E$ and $H$ are the electric and magnetic fields,
$\rho$ and $\rho^*$ are electric and magnetic charge densities,
and the additional fields $D = \varepsilon E$ and $B = \mu H$
are electric and magnetic flux densities,
$J = \sigma E$ and $J^* = \sigma^* H$ are electric and magnetic current densities,
and finally, $\sigma$ and $\sigma^*$ are electric and magnetic conductivities
in an absorbing material.

We can replace $E$ and $H$ with 1-forms $\tilde{E}$ and $\tilde{H}$ (for which $d = \nabla \times$),
$D$ and $B$ with 2-forms $\tilde{D}$ and $\tilde{B}$ (for which $d = \nabla \cdot$),
$J$ and $J^*$ with 2-forms, and $\rho$ and $\rho^*$ with 1-forms,
and we get
$$
\begin{aligned}
d\tilde{E} &= -\frac{\partial \tilde{B}}{\partial t} - \tilde{J}^* \\
d\tilde{H} &= \frac{\partial \tilde{D}}{\partial t} + \tilde{J} \\
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
\tilde{J}^* &= \star \sigma^* \tilde{H}. \\
\end{aligned}
$$

TODO: work through the last part of this section
where the system is unified into two equations