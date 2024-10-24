[wikipedia](https://en.wikipedia.org/wiki/Maxwell%27s_equations)

The Maxwell equations are a set of four partial differential equations
describing electromagnetic fields.
They can be written as follows:

- $\nabla \cdot E = \frac{\rho}{\varepsilon_0}$ (Gauss's law)
- $\nabla \cdot H = 0$ (Gauss's law for magnetism)
- $\nabla \times E = -\frac{\partial H}{\partial t}$ (Faraday's law of induction)
- $\nabla \times H = \mu_0 (J + \varepsilon_0 \frac{\partial E}{\partial t})$ (Ampère-Maxwell law)

Here $E$ and $H$ are the electric and magnetic fields,
$\rho$ is the electric charge density,
$J$ is the current density
$\varepsilon_0$ is the vacuum permittivity
and $\mu_0$ is the vacuum permeability.

Permittivity is a measure of how strong of an electric field
is produced by a given charge
(i.e. how much force it exerts on other charged particles).
Permeability is an analogous quantity for the magnetic field.

Modifying the equations slightly by moving the permittivity and permeability
behind the electric and magnetic fluxes $D$ and $B$
given by the constitutive equations
$$
\begin{aligned}
D &= \varepsilon E \\
B &= \mu H \\
\end{aligned}
$$
we get the form used by Davidson, D. (2010).
Computational Electromagnetics for RF and Microwave Engineering.
$$
\begin{aligned}
\nabla \times E &= -\frac{\partial}{\partial t} B \\
\nabla \times H &= J + \frac{\partial}{\partial t} D \\
\nabla \cdot D &= \rho \\
\nabla \cdot B &= 0 \\
\end{aligned}
$$

## Interpretation

Gauss's law says that sources and sinks of electric fields
(i.e. points with nonzero divergence)
are created by charges.

Gauss's law for magnetism means that magnetic monopoles don't exist -
field lines always loop back to the source,
summing up into zero.

Faraday's law of induction says that a change in the magnetic field
will induce a current circulating around the direction of change.

The Ampère-Maxwell law says that either a current or a change in the electric field
will induce a magnetic field circulating around the direction of current/change.

These properties are perhaps more intuitive in the integral form of the equations
relating surface fluxes to work along the surface boundary.
Here's a good [video from Up and Atom](https://www.youtube.com/watch?v=F3QHUvr8d8I) explaining them.

## 2D

Source: Davidson 2010 (citation above)

A 2D Euclidean form of the equations can be deduced
by setting either $E$ or $H$ orthogonal to the xy plane,
resulting in _transverse magnetic_ (TM)
or _transverse electric_ (TE) wave modes, respectively.
In the TE mode, the nonzero components of the fields are then
$E_x$, $E_y$, and $H_z$
and the curls simplify to $\nabla \times E = \partial_y E_x - \partial_x E_y$
(a scalar / vector in the z-axis),
and $\nabla \times H = (\partial_y H_z, -\partial_x H_z)$
(a vector in the xy plane).
This leads to the first two Maxwell equations from the above formulation
$$
\begin{aligned}
\frac{\partial E_x}{\partial y} - \frac{\partial E_y}{\partial x}
&= -\frac{\partial B}{\partial t}
= -\frac{\partial}{\partial t} \mu H_z \\
\implies \frac{\partial H_z}{\partial t}
&= \frac{1}{\mu} (\frac{\partial E_x}{\partial y}  - \frac{\partial E_y}{\partial t})
\end{aligned}
$$
and
$$
\begin{aligned}
(\frac{\partial H_z}{\partial y}, -\frac{\partial H_z}{\partial x}) &= J + \frac{\partial D}{\partial t}
= J + \frac{\partial}{\partial t} \varepsilon E \\
\implies \frac{\partial E_x}{\partial t} &= \frac{1}{\varepsilon} (\frac{\partial H_z}{\partial y} - J_x) \\
\frac{\partial E_y}{\partial t} &= -\frac{1}{\varepsilon} (\frac{\partial H_z}{\partial x} + J_y) \\
\end{aligned}
$$
Divergence is the same in 2D so the other two equations don't change.

TODO: in what situations are TE modes vs. TM modes applicable?

An expression of this using differential forms in an arbitrary metric space
is given in Radozycki, T. (2019). Reduction of the classical electromagnetism to a two-dimensional curved surface.
TODO: study this

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
