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

TODO: symmetry of the stiffness tensor, isotropic form with Lamè parameters


## Wave equation

Stress in an elastic medium produces a force whose coordinates are
$$
F_i = \sum_k \frac{\partial \sigma_{ik}}{\partial x_k}
$$
which can be expressed as the divergence of the stress tensor
$$
\mathbf{F} = \nabla \cdot \sigma(\mathbf{u})
$$
(this is a vector, not the scalar you get from a vector field's divergence!)

Equating this to mass times acceleration
(where mass at infinitesimal scale becomes density $\rho$) we get 
$$
\rho \frac{\partial^2 \mathbf{u}}{\partial t^2} - \nabla \cdot \sigma(\mathbf{u}) = 0
$$
(where $\mathbf{u}$ is a vector field depending on the spatial coordinate $\mathbf{x}$).


## Sources

- Landau et al. (1986). Theory of Elasticity
- Mönkölä, S. (2011). Numerical Simulation of Fluid-Structure Interaction Between Acoustic and Elastic Waves.
