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