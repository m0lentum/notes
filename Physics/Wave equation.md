[Wikipedia: Wave equation](https://en.wikipedia.org/wiki/Wave_equation)  
[Wikipedia: Acoustic wave equation](https://en.wikipedia.org/wiki/Acoustic_wave_equation)

$$
\frac{\partial^2 u}{\partial t^2} = c^2 \nabla^2u
$$

The unknown function $u$ here can represent many things,
typically displacement from an equilibrium state, but also
acoustic pressure (usually denoted $p$) or velocity potential $\phi$.
The nonnegative constant $c$ is the propagation speed of the wave
(the speed of sound when dealing with acoustics).

Interpretation: Consider a vibrating string where $u$ is displacement
from the rest state. This displacement accelerates based on curvature.
The more narrow an individual wave, the quicker it starts moving towards
the equilibrium state. When displacement reaches zero there is still velocity
(at least in the case of a standing wave),
which causes it to overshoot and keep vibrating.

[Lecture notes deriving the equation from conservation of energy and mass](http://jontalle.web.engr.illinois.edu/uploads/473.F18/Lectures/Chapter_5a.pdf)
TODO: write the steps down here to understand them better

## Velocity potential

The particle velocity $u$ is _irrotational_ meaning $\nabla \times u = 0$
(see the lecture notes linked above), and as such can be expressed
as the gradient of a scalar field. This field is called the velocity
potential $\phi$ and has no real-world measurement associated with it,
but it's useful in that both acoustic pressure and particle velocity
can be computed from it: $p = \frac{\partial \phi}{\partial t}$
and (by definition) $\mathbf{u} = \nabla \phi$.

Acoustic pressure here means deviation from the ambient pressure $\rho_0$.

If velocity potential fulfills the wave equation, then so does
velocity $\nabla\phi$ and acoustic pressure $\frac{\partial\phi}{\partial t}$. Proof for velocity:

$$
\begin{aligned}
\frac{\partial^2 (\nabla \phi)}{\partial t^2} - c^2\nabla^2(\nabla\phi) &= 0 \\
\nabla\frac{\partial^2 \phi}{\partial t^2} - \nabla (c^2\nabla^2\phi) &= 0 \\
\nabla(\frac{\partial^2 \phi}{\partial t^2} - c^2\nabla^2\phi) &= 0 \\
\nabla 0 &= 0 \quad \square \\
\end{aligned}
$$

(see [Wikipedia: Vector calculus identities](https://en.wikipedia.org/wiki/Vector_calculus_identities))
The same steps also work if you replace gradient
with the time derivative, proving the same for pressure.

Thus from the velocity potential's wave equation we can derive
a first-order system of equations that solves both
velocity and acoustic pressure:

$$
\frac{\partial^2 \phi}{\partial t^2} - c^2 \nabla^2\phi = 0 \implies
\begin{cases}
\partial_t p - c^2\nabla \cdot \mathbf{u} = 0 \\
\partial_t \mathbf{u} - \nabla p = 0 \\
\end{cases}
$$

The second equation here follows from the assumption that $\phi$ is second-order
smooth (i.e. all second-order partial derivatives are continuous),
in which case order of differentiation doesn't matter and

$$
\nabla \frac{\partial\phi}{\partial t} = \frac{\partial}{\partial t} \nabla\phi
\iff \nabla p = \partial_t \mathbf{u}
$$
