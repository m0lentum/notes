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


### Adjoint state method

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
and I can follow the math but I still don't really get it intuitively.
The adjoint variables relate the partial derivatives of the state equation
over the state variables to the same partial derivatives of the objective function,

$$
\Big(\frac{\partial s}{\partial x}\Big)^T \mathbf{z} = \Big(\frac{\partial J}{\partial x}\Big)^T
$$

but why does this also relate $\frac{\partial J}{\partial e}$ to $\frac{\partial s}{\partial e}$?
~~Too tired to think about this right now.~~
Thinking about it now. From [this tutorial](https://cs.stanford.edu/~ambrad/adjoint_tutorial.pdf),
just writing down the derivation by Lagrangian but using our notation
to force myself to think every detail through.
$u(e)$ is the solution of the state equation $s(e, u(e))$,
$e$ are the initial conditions (the parameters $p$ in the tutorial)
and the energy/objective function is $J(e)$.

Define the Lagrangian $\mathcal{L}(e, \lambda) = J(e) + \lambda^T s(e, u(e))$.
Because $s(e, u) = 0$ by definition, we can select any $\lambda$
and it will be true that $\mathcal{L}(e, \lambda) = J(e)$.
Then, differentiating using the product rule for the $\lambda^Ts$ term,

$$
\begin{aligned}
\frac{dJ}{de} &= \frac{d\mathcal{L}}{de} \\
&= \frac{\partial J}{\partial u} \frac{\partial u}{\partial e}
+ \frac{d\lambda^T}{de}s(e, u(e))
+ \lambda^T(\frac{\partial s}{\partial u} \frac{\partial u}{\partial e} + \frac{\partial s}{\partial e}) \\
&= \frac{\partial J}{\partial u} \frac{\partial u}{\partial e}
+ \lambda^T(\frac{\partial s}{\partial u} \frac{\partial u}{\partial e} + \frac{\partial s}{\partial e})
\text{\quad because $s = 0$}\\
&= (\frac{\partial J}{\partial u} + \lambda^T \frac{\partial s}{\partial u})\frac{\partial u}{\partial e}
+ \lambda^T \frac{\partial s}{\partial e} \\
\end{aligned}
$$

This holds regardless of the choice of $\lambda$, so we get to pick it such that the
parenthesized expression becomes zero and $\frac{\partial u}{\partial e}$ disappears.

So in summary, we construct a derivative that's equal to $\frac{dJ}{de}$
which we're looking for by adding a term with $s$, exploiting the fact
that $s(e, u(e)) = 0$ everywhere, and do some clever algebra to find
a relationship that relates both $\frac{\partial J}{\partial u}$ to $\frac{\partial s}{\partial u}$
and $\frac{\partial s}{\partial e}$ to $\frac{dJ}{de}$.
This relationship exists because of how the chain rule and total derivative works
(come to think of it, I don't actually know the rules of total derivative,
that's another TODO to study :d )

Well, that helps a bit but it still feels like arcane algebra magic
without an intuitive geometric explanation.. I'll be seeing this formula a lot,
maybe it will become clear once I've stared at it enough. Let's not waste any
more time on this for now.


The adjoint state solution gives the gradient, which we still need to use
to solve the optimization problem at hand. For every iteration of optimization,
we need to solve the forward and backward equations again.


### Weak formulations

[intro paper](https://warwick.ac.uk/fac/sci/hetsys/studentinformation/induction/mathsinduction/pde/pde.pdf)

This is necessary because the "strong" form of the PDE as defined above
requires that the solution $u$ is twice differentiable.
Such solutions may not exist in practice, so we come up with a related
but not strictly equivalent formulation that admits more solutions.

Equality of two vectors can be investigated indirectly by comparing
their inner products with other vectors. In finite dimensions,

$$
u = v \in \mathbb{R}^d \iff \forall \varphi \in \mathbb{R}^d
, u \cdot \varphi = v \cdot \varphi \in \mathbb{R}
$$

where $\varphi$ is called a _test vector_ (or test function, if the vectors are functions).

In infinite dimensions this implication only holds from left to right,
and we're looking for $u$ in infinite-dimensional function space.
This is why the solution based on this is weak - satisfying the
inner product equality with all test vectors does not imply actual equality.

To derive the weak form, we first multiply the equation
by an arbitrary test function, then integrate over the solution domain.
Because we just did a multiplication, we can always do integration by parts here
(I think?), giving a formula with an integral over the domain and another
integral over its boundary. Here we can insert boundary conditions to the formula,
which particularly simplifies a lot in the case of the Dirichlet condition $u = 0$.

The integral makes the second-order derivative of $u$ disappear.
The problem is now a first order equation that needs to hold for
every test function, and can thus be formulated as a system of equations
with a row for every test function.

See the derivation done for a Laplace equation in the intro paper linked earlier.
TODO: write down the derivation for the actual wave equation we're dealing with

TODO: Sobolev spaces, work through the definition of weak derivative.
What's a closure of a space?


### Conjugate gradient optimization
related words:

Conjugate: two vectors $x$ and $y$ are $A$-conjugate w.r.t a positive definite
square matrix $A$ when $y^TAx = 0$. As with orthogonal vectors (which could also
be described as $I$-conjugate), this relationship is invariant w.r.t. scaling.
[source](https://math.stackexchange.com/questions/523810/conjugate-vectors)

Relatedly, the $A$-inner product $\langle x, y \rangle_A$ is defined as $\langle Ax, y \rangle = (Ax)^Ty$.
This only works if $A$ is symmetric positive definite because both those properties
are required for the definition of an inner product.
Positive definite means $\langle x, x \rangle > 0$ for all $||x|| \neq 0$
and (conjugate) symmetry means $\langle x, y \rangle$ = $\overline{\langle y, x \rangle}$.



### Differential forms

[intro paper](https://doi.org/10.1016/j.jcp.2013.08.007)

A differential form is, intuitively, whatever comes after the integral sign
in an integral. Depending on the dimension of the thing being integrated over,
they are called 1-forms, 2-forms etc. 1-forms correspond to line integrals
(e.g. $v^1 = \mathbf{v} \cdot d\mathbf{l}$), 2-forms to surface integrals (e.g. $w^2 = \mathbf{w} \cdot d\mathbf{A}$) etc.
There are also 0-forms which are equivalent to simple scalar functions.

"Discrete forms" as used in DEC computations are these forms integrated over
an element of a mesh, i.e. a scalar quantity like $a^3 = \int_{\Omega_i} adV$
on a volume element $\Omega_i$. Because of this connection with integrals,
the solution of a system of discrete forms is exactly the solution to
the corresponding continuous PDE (TODO: check the cited source and understand why).

In 3D, 0-forms and 3-forms are natural choices for representing directionless
(i.e. scalar) quantities on points and volumes respectively,
and 1- and 2-forms similarly best represent values with
direction (i.e. vectors). This is because a lines and surfaces
(which 1- and 2-forms are integrated over) have a well-defined notion
of a direction, but points and volumes don't.
In 2D, there are no forms of higher dimension than 2, and 2-forms represent
area integrals (as they do in 3D, but without a meaningful direction
since they're all in the same plane).