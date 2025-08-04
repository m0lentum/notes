A linear system of equations can be represented as

$$
\mathbf{Ax} = \mathbf{b}
$$

where $\mathbf{A}$ is a $m \times n$ [[Matrix|matrix]], $\mathbf{x}$ is a vector of dimension $n$
and $\mathbf{b}$ is a vector of dimension $m$.
This is equivalent to a set of equations

$$
\begin{cases}
a_{11}x_1 + a_{12}x_2 + \dots + a_{1n}x_n = b_1 \\
a_{21}x_1 + a_{22}x_2 + \dots + a_{2n}x_n = b_2 \\
\quad \vdots \\
a_{m1}x_1 + a_{m2}x_2 + \dots + a_{mn}x_n = b_m \\
\end{cases}
$$

with $n$ unknowns and $m$ equations.

There are many ways to solve such a system.
They can be solved exactly with [[Direct methods]]
or approximately with iterative [[Relaxation methods]] and [[Projection methods]].
(some projection methods are also exact after some number of steps)