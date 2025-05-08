## Strain & stress tensors

The state of an elastic material can be described
by the displacement of each point from its rest position,
$\mathbf{u} = \mathbf{x} - \mathbf{x}_0$.
Considering the difference in position between nearby points $d\mathbf{x}$
after deformation (written componentwise with $i$ indexing the component),
we have $dx_i' = dx_i + du_i$.
The distance between these points is
$dl = \sqrt{\sum_{i=1}^{n} dx_i}$,
from which we can write
$dl'^2 = \sum_{i=1}^{n} dx_i'^2 = \sum (dx_i + du_i)^2 = \sum (dx_i^2 + 2dx_idu_i + du_i^2)$,
where in turn $du_i = \sum_{k=1}^n \frac{\partial u_i}{\partial x_k}dx_k$.
Now
$$
\begin{aligned}
dl'^2 &= dl^2 + \sum_i (2dx_idu_i + du_i^2) \\
&= dl^2 + \sum_i (\sum_k 2dx_i \frac{\partial u_i}{\partial x_k} dx_k
    + (\sum_l \frac{\partial u_i}{\partial x_l} dx_l)^2) \\
&= dl^2 + 2\sum_i \sum_k \frac{\partial u_i}{\partial x_k} dx_i dx_k
    + \sum_i \sum_k \sum_l \frac{\partial u_i}{\partial x_k} \frac{\partial u_i}{\partial x_l} dx_k dx_l \\
\end{aligned}
$$
From this form we can exchange some indices to obtain
(sum symbols omitted, same as before)
$$
dl'^2 = dl^2 + (\frac{\partial u_k}{\partial x_i} + \frac{\partial u_i}{\partial x_k}) dx_i dx_k
    + \frac{\partial u_l}{\partial x_k} \frac{\partial u_l}{\partial x_i} dx_k dx_i
$$
from which we get, by collecting common terms, the _strain tensor_
$$
\epsilon(u_{ik}) = \frac{1}{2}\Big(\frac{\partial u_i}{\partial x_k} + \frac{\partial u_k}{\partial x_i}
    + \sum_l \frac{\partial u_l}{\partial x_k}\frac{\partial u_l}{\partial x_i}\Big)
$$
When the strain is small, the last term becomes negligible
due to being quadratic, giving the _linearized_ form
$$
\epsilon(\mathbf{u}) = \frac{1}{2}(\nabla \mathbf{u} + (\nabla \mathbf{u})^T)
= \begin{bmatrix}
  \frac{\partial u_1}{\partial x_1} & \frac{1}{2}(\frac{\partial u_1}{\partial x_2} + \frac{\partial u_2}{\partial x_1}) \\
  \frac{1}{2}(\frac{\partial u_1}{\partial x_2} + \frac{\partial u_2}{\partial x_1}) & \frac{\partial u_2}{\partial x_2}  \\
\end{bmatrix}
$$
(in 2D)

With this $dl'^2$ can be expressed as
$$
dl'^2 = dl^2 + \sum_i\sum_k 2\epsilon(u_{ik})dx_idx_k.
$$
The strain tensor describes differences in distance between points,
which lends itself to the _generalized Hooke's law_
describing spring-like forces in the elastic medium:
$$
\sigma(\mathbf{u}) = C\epsilon(\mathbf{u})
$$
where $\sigma(\mathbf{u})$ is the _stress tensor_ at the point $\mathbf{u}$
and $C$ is a rank 4 tensor containing material parameters,
called the _stiffness tensor_ or _elastic moduli tensor_.

The individual elements of $\sigma(\mathbf{u})$ are then
$$
\sigma_{ij}(\mathbf{u}) = \sum_{k} \sum_l C_{ijkl} \epsilon_{kl}(\mathbf{u})
$$

The stiffness tensor is symmetric along multiple axes:
Because the strain and stress tensors are symmetric,
$C_{ijkl} = C_{jikl} = C_{ijlk}$.
When the material is spatially isotropic,
$C$ must also be invariant under rotations and reflections,
which in particular means that all shearing forces give the same stress
regardless of direction and all compressional forces do as well,
leaving only two free parameters $\lambda$ and $\mu$
for compressional and shear forces respectively.

The components of the stiffness tensor are then written as
$C_{ijkl} = \lambda \delta_{ij}\delta_{kl} + \mu(\delta_{ik}\delta_{jl} + \delta_{il}\delta_{jk})$
(remember this is Einstein summation notation)
(I don't quite understand where this comes from but let's move on for now).
When applied to the strain $\epsilon(\mathbf{u})$ this gives
$$
\begin{aligned}
\sigma_{ij}(\mathbf{u}) &= \lambda \delta_{ij} \sum_{k} \frac{\partial u_k}{\partial x_k}
    + 2\mu (\frac{1}{2}(\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i})) \\
\implies \sigma(\mathbf{u}) &= \lambda (\nabla \cdot \mathbf{u}) I + 2\mu\epsilon(\mathbf{u}) \\
&= \begin{bmatrix}
    \lambda(\frac{\partial u_1}{\partial x_1} + \frac{\partial u_2}{\partial x_2}) + 2\mu \frac{\partial u_1}{\partial x_1} &
    \mu(\frac{\partial u_1}{\partial x_2} + \frac{\partial u_2}{\partial x_1}) \\
    \mu(\frac{\partial u_1}{\partial x_2} + \frac{\partial u_2}{\partial x_1}) &
    \lambda(\frac{\partial u_1}{\partial x_1} + \frac{\partial u_2}{\partial x_2}) + 2\mu \frac{\partial u_2}{\partial x_2} \\
\end{bmatrix}
\end{aligned}
$$
(last step in 2D)

## Wave equation

Stress in an elastic medium produces a force whose coordinates are
$$
F_i = \sum_k \frac{\partial \sigma_{ik}}{\partial x_k}
$$
(spatial derivative and not just stress itself
because stress depends on displacement and displacement depends on location -
if two adjacent points have the same displacement and therefore the same stress,
they are at rest relative to each other)
which is the divergence of the stress tensor
$$
\mathbf{F} = \nabla \cdot \sigma(\mathbf{u})
$$
(this is a vector, not the scalar you get from a vector field's divergence!
specifically a vector containing divergences of rows of the stress tensor)

Equating this to mass times acceleration
(where mass at infinitesimal scale becomes density $\rho$) we get 
$$
\rho \frac{\partial^2 \mathbf{u}}{\partial t^2} - \nabla \cdot \sigma(\mathbf{u}) = 0
$$
(where $\mathbf{u}$ is a vector field depending on the spatial coordinate $\mathbf{x}$).

Substituting the expression for the isotropic stress tensor given in the previous section,
$$
\rho \frac{\partial^2 \mathbf{u}}{\partial t^2} - \nabla \cdot (
\lambda (\nabla \cdot \mathbf{u}) I + 2\mu\epsilon(\mathbf{u})
)= 0
$$
(recalling again that this is vector-valued tensor divergence),
and with spatially varying material parameters,
(this gets complicated, let's try with Einstein notation)
$$
\begin{aligned}
0 &= \rho \frac{\partial^2 u_i}{\partial t^2} - \frac{\partial \sigma_{ik}}{\partial x_k} \\
\rho \frac{\partial^2 u_i}{\partial t^2} &=
    \frac{\partial}{\partial x_j} (\lambda \delta_{ij} \frac{\partial u_k}{\partial x_k}
    + 2\mu (\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i})) \\
&= \frac{\partial \lambda}{\partial x_j} \delta_{ij} \frac{\partial u_k}{\partial x_k}
    + \lambda \delta_{ij} \frac{\partial}{\partial x_j} \frac{\partial u_k}{\partial x_k}
    + 2\frac{\partial \mu}{\partial x_j} (\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i})
    + 2\mu \frac{\partial}{\partial x_j} (\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i}) \\
&= \frac{\partial \lambda}{\partial x_i} \frac{\partial u_k}{\partial x_k}
    + \lambda \frac{\partial}{\partial x_i} \frac{\partial u_k}{\partial x_k}
    + 2\frac{\partial \mu}{\partial x_j} (\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i})
    + 2\mu \frac{\partial}{\partial x_j} (\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i}) \\
\implies \rho\frac{\partial^2 \mathbf{u}}{\partial t^2} &=
\nabla \lambda (\nabla \cdot \mathbf{u}) + \lambda \nabla (\nabla \cdot \mathbf{u})
+ 2 (\nabla \mu) \cdot \text{...nah, too difficult}
\end{aligned}
$$

End result should look like
$$
\rho \frac{\partial^2 \mathbf{u}}{\partial t^2}
= (\lambda + 2\mu) \nabla (\nabla \cdot \mathbf{u}) + \mu \nabla^2 \mathbf{u} \quad \text{(1)}
$$
(I think this one implies constant material parameters) or
$$
\rho \frac{\partial^2 \mathbf{u}}{\partial t^2}
    - \nabla  (\lambda + 2\mu) (\nabla \cdot \mathbf{u})
    + \nabla \times (\mu \nabla \times \mathbf{u}) = 0 \quad \text{(2)}
$$
The transformation between these two looks like
Landau et al. (1986) page 18;
it's based on the identity $\nabla (\nabla \cdot \mathbf{u}) = \nabla^2 \mathbf{u} + \nabla \times (\nabla \times \mathbf{u})$.

To transform this into a first-order system of equations we can more easily solve,
we can decompose $\mathbf{u}$ into two parts $\mathbf{u} = \mathbf{u}_p + \mathbf{u}_s$ such that
$\nabla \cdot \mathbf{u}_s = 0$ and $\nabla \times \mathbf{u}_p = 0$ (Landau et al. 1986, p. 102).
(this is another way to express the Helmholtz decomposition theorem
$\mathbf{u} = \nabla \Phi + \nabla \times \Psi$: $\mathbf{u}_p = \nabla \Phi$, $\mathbf{u}_s = \nabla \times \Psi$)
Substituting into (1) and taking the divergence eliminates $\mathbf{u}_s$,
and then the fact that $\nabla \times \mathbf{u}_s = 0$ gives a vector-valued [[wave equation]]
$$
\frac{\partial^2 \mathbf{u}_p}{\partial t^2} - c_p^2 \nabla^2 \mathbf{u}_p = 0
$$
similarly with curl first and then divergence we can eliminate $\mathbf{u}_p$ and get
$$
\frac{\partial^2 \mathbf{u}_s}{\partial t^2} - c_s^2 \nabla^2 \mathbf{u}_s = 0.
$$

Ok, this still doesn't directly lead to the equations I'm using;
here's a helpful idea from Randall (1989):
instead of displacement, express the _velocity_ $\mathbf{v} = \frac{\partial \mathbf{u}}{\partial t}$
in terms of the Helmholtz decomposition,
$\mathbf{v} = \mathbf{v}_p + \mathbf{v}_s = \nabla \Phi + \nabla \times \Psi$.
These potentials again satisfy scalar wave equations:
$$
\frac{\partial^2 \Phi}{\partial t^2} = c_p^2 \nabla^2 \Phi = c_p^2 \nabla \cdot \mathbf{v}
$$
and with the additional assumption $\nabla \cdot \Psi = 0$,
$$
\frac{\partial^2 \Psi}{\partial t^2} = c_s^2 \nabla^2 \Psi
= -c_s^2 \nabla \times \nabla \times \Psi = -c_s^2 \nabla \times \mathbf{v}.
$$
Each of these wave equations can be transformed into a first-order system
by introducing variables as the time derivatives of these potentials
$p = \frac{\partial \Phi}{\partial t}$, $w = \frac{\partial \Psi}{\partial t}$, giving
$$
\begin{aligned}
\rho\frac{\partial p}{\partial t} - (\lambda + 2\mu) \nabla \cdot \mathbf{v} &= 0 \\
\rho\frac{\partial w}{\partial t} + \mu \nabla \times \mathbf{v} &= 0 \\
\end{aligned}
$$
(where we used $c_p^2 = \frac{\lambda + 2\mu}{\rho}$ and $c_s^2 = \frac{\mu}{\rho}$)

These are the update equations for pressure and shear potential
from Räbinä et al. (2018)
but with opposite signs for some reason?
Actual equations that were found to work in code suggest
that the signs are actually wrong in the paper and I have them right here

Now how do we get the third equation in the system?
That one pops out when we differentiate $\mathbf{v}$ with respect to time:
$$
\frac{\partial \mathbf{v}}{\partial t}
= \frac{\partial}{\partial t}(\mathbf{v}_p + \mathbf{v}_s)
= \frac{\partial}{\partial t}\nabla \Phi + \frac{\partial}{\partial t} \nabla \times \Psi
$$
Schwartz's theorem allows us to change the order of differentiation
(assuming derivatives are continuous), ending up with
$$
\frac{\partial \mathbf{v}}{\partial t}
= \nabla \frac{\partial \Phi}{\partial t} + \nabla \times \frac{\partial \Psi}{\partial t}
= \frac{1}{\rho}(\nabla p + \nabla \times w)
$$

## DEC discretization

In terms of [[differential form]]s $\overset{0}{p}$, $\overset{1}{v}$, $\overset{2}{w}$,
where $\overset{0}{p}$ and $\overset{2}{w}$ are scaled by the density
$\overset{0}{p} = \rho \frac{\partial \Phi}{\partial t}$, $\overset{2}{w} = \rho \frac{\partial \Psi}{\partial t}$,
the previously presented equations are
$$
\begin{cases}
  \frac{\partial p}{\partial t} = (\lambda + 2\mu) \star d \star v \\
  \frac{\partial w}{\partial t} = -\mu dv \\
  \frac{\partial v}{\partial t} = \frac{1}{\rho}(dp + \star d \star w) \\
\end{cases}
$$
or in terms of flux $\overset{1}{q} = \star v$
(this is in 2D; remember $\star \star = -1$ for 1-form star),
$$
\begin{cases}
  \frac{\partial p}{\partial t} = (\lambda + 2\mu) \star d q \\
  \frac{\partial w}{\partial t} = \mu d \star q \\
  \frac{\partial q}{\partial t} = \frac{1}{\rho}(\star dp - d \star w) \\
\end{cases}
$$

Space discretization with DEC, time discretization with first-order leapfrog
such that $p$, $w$ are synchronized and $v$ / $q$ is at a half dt.
With velocity:
$$
\begin{cases}
  P^{n+1} = P^n + \Delta t (\lambda + 2\mu) \star_0^{-1} \mathbf{d}_0^T \star_1 V^{n+\frac{1}{2}} \\
  W^{n+1} = W^n - \Delta t \mu \mathbf{d}_1 V^{n+\frac{1}{2}} \\
  V^{n+\frac{1}{2}} = V^{n-\frac{1}{2}} + \frac{\Delta t}{\rho}(\mathbf{d}_0 P^n + \star_1^{-1} \mathbf{d}_1^T \star_2 W^n) \\
\end{cases}
$$
$V$ is a primal 1-cochain, $P$ is a primal 0-cochain, $W$ is a primal 2-cochain.

With flux:
$$
\begin{cases}
  P^{n+1} = P^n + \Delta t (\lambda + 2\mu) \star_2 \mathbf{d}_1 Q^{n+\frac{1}{2}} \\
  W^{n+1} = W^n + \Delta t \mu \mathbf{d}_0^T \star_1 Q^{n+\frac{1}{2}} \\
  Q^{n+\frac{1}{2}} = Q^{n-\frac{1}{2}} + \frac{\Delta t}{\rho}(\star_1^{-1} \mathbf{d}_1^T P^n - \mathbf{d}_0 \star_0^{-1} W^n) \\
\end{cases}
$$
$Q$ is a primal 1-cochain, $P$ is a dual 0-cochain, $W$ is a dual 2-cochain
(in 2D $w$ is a scalar!
This corresponds to a vector in the z-direction
if you imagine the plane embedded in $\mathbb{R}^3$)

### Boundary conditions

First-order Engquist-Majda (1979) in original notation:
$$
\begin{cases}
  \frac{\partial v_1}{\partial x} + \frac{1}{\sqrt{d_1}}\frac{\partial v_1}{\partial t} \Big|_{x=a} = 0 \\
  \frac{\partial v_2}{\partial x} + \frac{1}{\sqrt{d_2}}\frac{\partial v_2}{\partial t} \Big|_{x=a} = 0 \\
\end{cases}
$$
This is assuming a boundary along the y-axis at $x=a$.
$(v_1, v_2)$ are the longitudinal and transverse components of displacement (not velocity!)
and $\sqrt{d_1}, \sqrt{d_2} = c_p, c_s$ are the phase velocities of the respective wave types.

More generally for boundaries with normal $\mathbf{n}$
(changing to $\mathbf{u}$ for displacement like before),
$$
\begin{cases}
  \mathbf{n} \cdot \nabla \mathbf{u}_p + \frac{1}{c_p}\frac{\partial \mathbf{u}_p}{\partial t} = 0 \\
  \mathbf{n} \cdot \nabla \mathbf{u}_s + \frac{1}{c_s}\frac{\partial \mathbf{u}_s}{\partial t} = 0 \\
\end{cases}
$$
If we instead apply this condition to the scalar wave potentials $\Phi, \Psi$
(it's not clear to me if this is actually equivalent,
but I know from experiment that it works for the pressure wave at least),
$$
\begin{cases}
  \mathbf{n} \cdot \nabla \Phi + \frac{1}{c_p}\frac{\partial \Phi}{\partial t}
  = \mathbf{n} \cdot \mathbf{v}_p + \frac{1}{c_p} p = 0 \\
  \mathbf{n} \cdot \nabla \Psi + \frac{1}{c_s}\frac{\partial \Psi}{\partial t}
  = \mathbf{n} \cdot (??) + \frac{1}{c_s} w = 0 \\
\end{cases}
$$
The first one of these is just the absorbing boundary condition for acoustic waves
which I've already shown to work.
$\mathbf{n} \cdot \mathbf{v}_p$ is the pressure wave component
of the flux $q$ over an edge.
To discretize this we relate the flux on each edge
to the pressure on the nearest dual vertex by assuming constant pressure over the edge,
$$
Q_i + \frac{1}{c_p} |e_i| P_{e_i} = 0
$$
where $|e_i|$ is the length of the $i$th edge
and $P_{e_i}$ is the pressure value on the adjacent dual vertex.

![[images/pressure_boundary.svg]]

Now, how do we do the do this for the shear wave?
Each edge has two adjacent vertices,
and the shear potential $W$ is stored on the corresponding dual faces:

![[images/shear_boundary.svg]]

We need to approximate the equation
$$
\mathbf{n} \cdot \nabla \Psi + \frac{1}{c_s}\frac{\partial \Psi}{\partial t}
= \mathbf{n} \cdot (??) + \frac{1}{c_s} w = 0 \\
$$
where the velocity component we're dealing with is $\mathbf{v}_s = \nabla \times \Psi$,
but that doesn't show up in the equation when expressed like this 🤔
I'm not sure if $\Psi$ is even the right variable though..

Here's what I tried to do in code,
by analogy with the pressure boundary condition:
Assume constant $W$ in each dual face $f_i^*$.
For each point in the left half of $e_i$, the curl of $W_{f_1^*}$ points upwards
(away from the normal direction), contributing negatively to the flux over the edge,
and in the right half, the curl of $W_{f_2^*}$ points in the normal direction.
The sum total of these should balance out with the flux over the surface
analogously to the pressure condition,
$$
Q_i + \frac{1}{c_s}\Big(\frac{1}{2} |e_i| \frac{W_2}{|f_2^*|} - \frac{1}{2} |e_i| \frac{W_1}{|f_1^*|}\Big) = 0
$$
(where we take the average over the dual faces $\frac{W_k}{|f_k^*|}$
because $W_k$ is a 2-form integrated over the face)

It's unclear if this is doing what it should;
energy does leave the system over time
but shear waves at normal incidence are not absorbed at all,
possibly because these waves always have zero velocity in the normal direction,
and this boundary condition only applies to normal velocity.

Now let's get back to the original continuous equation and try to see if this matches.
$$
\mathbf{n} \cdot \nabla \Psi + \frac{1}{c_s}\frac{\partial \Psi}{\partial t} = 0
$$
The problem is that the shear component of $Q$
is $\mathbf{n} \cdot (\nabla \times \Psi)$, not $\mathbf{n} \cdot \nabla \Psi$.
What's the relationship between these?
Let's work them out in coordinates
(remember $\Psi$ is a scalar / "vector in the z direction"):
$$
\begin{aligned}
\nabla \Psi &= (\partial_x \Psi, \partial_y \Psi) \\
\mathbf{n} \cdot \nabla \Psi &= n_x \partial_x \Psi + n_y \partial_y \Psi \\
\nabla \times \Psi &= (\partial_y \Psi, -\partial_x \Psi) \\
\mathbf{n} \cdot (\nabla \times \Psi) &= n_x \partial_y \Psi - n_y \partial_x \Psi 
= (-n_y, n_x) \cdot \nabla \Psi \\
\end{aligned}
$$
I guess we can get to $\mathbf{n} \cdot \nabla \Psi$ by integrating velocity
in the edge tangent direction instead of the normal direction,
so we could get to this value if we stored this component of velocity
as tangential velocity instead of flux.
So then we'd have four different variables, $P, Q, W, V$
where $P, Q$ are completely decoupled from $W, V$.

Then $W$ would be a primal 2-cochain instead of a dual one,
thus stored on triangles.
Then we could take its $\star$ to get the average value on the dual vertex
and relate this value to $V$ the same way we did with pressure,
$$
V_i + \frac{1}{c_s} |e_i| \frac{W_{f_i^*}}{|f_i^*|} = 0
$$
(Note: all of this has ignored the fact that our actual variables are
scaled by density, $P = \rho p$, $W = \rho w$,
so actual implementation needs also a division by $\rho$)

Now the timestep equations are
$$
\begin{cases}
  W^{n+1} = W^n + \Delta t \mu \star_2 \mathbf{d}_1 V^{n+\frac{1}{2}} \\
  V^{n+\frac{1}{2}} = V^{n-\frac{1}{2}} + \frac{\Delta t}{\rho}(\star_1^{-1} \mathbf{d}_1^T W^n) \\
  P^{n+1} = P^n + \Delta t (\lambda + 2\mu) \star_2 \mathbf{d}_1 Q^{n+\frac{1}{2}} \\
  Q^{n+\frac{1}{2}} = Q^{n-\frac{1}{2}} + \frac{\Delta t}{\rho}(\star_1^{-1} \mathbf{d}_1^T P^n) \\
\end{cases}
$$
where $W$ was chosen to be a dual 0-cochain
(had some trouble doing it with $W$ as a primal 2-cochain;
copied an earlier velocity-based implementation that was known to work.
Not sure what went wrong there, probably my mistake).

This way there's no possible way for a pressure wave to turn into a shear wave
because the variables for each are completely decoupled.
This might be a problem? Landau et al. (1986)
says (p. 103) that a reflected or refracted wave
can change from pressure to shear and vice versa.
Probably $V$ and $Q$ should be summed somehow in the update equations for $P$ and $W$.

Let's see. What if we just sum both update equations for $P$ and $W$?
$$
\begin{cases}
  W^{n+1} = W^n + \Delta t \mu (\star_2 \mathbf{d}_1 V^{n+\frac{1}{2}}
    + \mathbf{d} \star Q^{n+\frac{1}{2}}) \\
  P^{n+1} = P^n + \Delta t (\lambda + 2\mu) (\star_2 \mathbf{d}_1 Q^{n+\frac{1}{2}}
    + \star \mathbf{d} \star V^{n+\frac{1}{2}}) \\
\end{cases}
$$
There's a primal-dual mismatch here; unclear how to work around this..
How about the other two update equations?
$$
\begin{cases}
  V^{n+\frac{1}{2}} = V^{n-\frac{1}{2}} + \frac{\Delta t}{\rho}(\star_1^{-1} \mathbf{d}_1^T W^n + \mathbf{d}P^n) \\
  Q^{n+\frac{1}{2}} = Q^{n-\frac{1}{2}} + \frac{\Delta t}{\rho}(\star_1^{-1} \mathbf{d}_1^T P^n + \mathbf{d}W^n) \\
\end{cases}
$$
again the same issue: here we would need the value of $P^n$ and $Q^n$ on primal vertices
but they're dual 0-cochains.
This could be accomplished by averaging,
but let's analyze the situation a little bit.

The longitudinal and transverse waves are fully decoupled everywhere
except at boundaries where reflections/refractions occur
(material parameters change).
Generally the P-wave component of velocity has zero curl
and the S-wave one has zero divergence
which implies that the update equations for $P$ and $W$ are fine without the terms added here
as they should be.
If there's a gradient in material parameters, though, what happens?

I guess it's really a discontinuity in material parameters in our case,
in which case we need boundary conditions there.
We want continuity of displacement (and consequently stress):
$\mathbf{u}_- = \mathbf{u}_+$ at a boundary between regions $+$ and $-$.
If this is the case at time 0, it is maintained as long as $\mathbf{v}_- = \mathbf{v}_+$,
which seems like it's trivially true in our simulation
since there's only one velocity value for each boundary edge.

Got something working by using interpolated values for $\mathbf{d}P^n$ and $\mathbf{d}W^n$
in the latter two modified update equations!
Still should probably work through the math for a plane wave reflection/refraction
to make sure this is a sensible model.

### Computing energy

[wikipedia: sound energy](https://en.wikipedia.org/wiki/Sound_energy)
[wikipedia: sound energy density](https://en.wikipedia.org/wiki/Sound_energy_density)
These formulas look somewhat different; how are they related?

Thorne & Blandford (2017) (p. 640) gives a formula for wave energy
$$
U = \frac{1}{2} \rho v^2 + \frac{1}{2}K\Theta^2 + \mu \Sigma_{ij}\Sigma_{ij}
$$
The first term here is the kinetic energy,
$\Theta$ is the expansion and $\Sigma$ the shear tensor.
The latter two relate to the pressure and shear potentials,
but I think we can get away with just measuring time-averaged kinetic energy
because (also from the same source)
time-averaged kinetic energy is equal to time-averaged potential energy.

The kinetic energy for each wave type is then
$$
U_p + U_s = \frac{1}{2}\rho q^2 + \frac{1}{2}\rho v^2
$$
($q^2 + v^2 = |\mathbf{v}|^2$) since $q$ and $v$ are orthogonal components
of the full vector-valued velocity).

Since $q$ and $v$ are already integrated over edges,
we can simply multiply these values by the local density $\rho$
and sum over a measurement set of edges to get the integral of energy over it.
Then take the energies over the past wave period
(the period may be different for pressure and shear waves though!
If we allow it to be that is - maybe we don't have to)
and compute the average.

## Sources

- Landau et al. (1986). Theory of Elasticity
- Mönkölä, S. (2011). Numerical Simulation of Fluid-Structure Interaction Between Acoustic and Elastic Waves
- Randall, C. J. (1989). Absorbing boundary condition for the elastic wave equation: Velocity-stress formulation
- Räbinä et al. (2018). Generalized wave propagation problems and discrete exterior calculus
- Engquist, B. & Majda, A. (1979). Radiation boundary conditions for acoustic and elastic wave calculations
- Thorne, K. & Blandford, R. (2017). Modern classical physics: optics, fluids, plasmas, elasticity, relativity, and statistical physics