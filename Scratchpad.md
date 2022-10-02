Notes I felt like quickly writing down without figuring out a structured place for them.
Hopefully I've moved most things to more appropriate places and this file is close to empty.

## Random words I haven't categorized yet

Involution: a function that is its own inverse, $f(f(x)) = x$

Lagrangian $\mathcal{L}(x, \lambda) = f(x) + \lambda g(x)$: formulation of an optimization problem
$\min f(x) \text{ s.t. } g(x) = 0$ that allows finding the solution of the constrained system
by finding points where $\nabla \mathcal{L}(x, \lambda) = 0$.


## Master's thesis initial note dump

Wave equation / Helmholtz equation, time-dependent form:

$$
\frac{\partial^2 u}{\partial t^2} = c^2 \nabla^2u
$$

where $u$ is displacement / acoustic pressure,
$c$ is a nonnegative constant that affects the propagation speed of the wave
I think c is squared to communicate nonnegativity
and not for any physical reason (?)

Interpretation: displacement accelerates based on curvature.
The more narrow an individual wave, the quicker it starts moving towards
the equilibrium state.


Exact controllability: Instead of fully specifying initial conditions
to get a unique solution, allow initial conditions to vary and select them
by constructing an optimization problem that enforces some property.
In this case we want to enforce time-periodicity, i.e.
$u$ and $\frac{\partial{u}}{\partial{t}}$ are equal at time 0 and after a period T at all points in space.


The adjoint of a matrix is its conjugate transpose (just transpose if it's real).
Adjoint state method involves solving an optimization problem minimizing
some cost/energy function $f(x, p)$ where $x$ is the state (e.g. acoustic pressure
in our wave equation) and $p$ is some set of parameters, subject to a constraint
$g(x, p) = 0$ where $g$ is a PDE. Because $x$ depends on $p$, computing $\frac{\partial f}{\partial p}$
with finite differences involves solving the PDE for every sample point.
The adjoint state equation gives the gradient $\frac{\partial f}{\partial p}$
with only two PDE solves, one for the "forward" state equation
and one for the "backward" adjoint equation.

TODO: why does this work? Here's [a stackexchange question](https://math.stackexchange.com/questions/3853504/understanding-the-adjoint-state-method-existence-and-uniqueness-of-the-adjoin)
that explains the idea well and links to a more detailed tutorial,
and I can follow the math but I still don't really get it intuitively


The adjoint state solution gives the gradient, which we still need to use
to solve the optimization problem at hand. For every iteration of optimization,
we need to solve the forward and backward equations again.


TODO: revise what weak formulations are


Conjugate gradient optimization -related words:

Conjugate: two vectors $x$ and $y$ are $A$-conjugate w.r.t a positive definite
square matrix $A$ when $y^TAx = 0$. As with orthogonal vectors (which could also
be described as $I$-conjugate), this relationship is invariant w.r.t. scaling.
[source](https://math.stackexchange.com/questions/523810/conjugate-vectors)

Relatedly, the $A$-inner product $\langle x, y \rangle_A$ is defined as $\langle Ax, y \rangle = (Ax)^Ty$.
This only works if $A$ is symmetric positive definite because both those properties
are required for the definition of an inner product.
Positive definite means $\langle x, x \rangle > 0$ for all $||x|| \neq 0$
and (conjugate) symmetry means $\langle x, y \rangle$ = $\overline{\langle y, x \rangle}$.

