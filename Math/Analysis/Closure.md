The _closure_ (fi: sulkeuma) $\bar{A}$ of a set $A$
is the set of all _adherent points_ (fi: kosketuspiste)
of that set, i.e. points for which
$B(\mathbf{x}, r) \cap A \neq \emptyset$ for all $r > 0$.
It is a closed set equal to
$$
\bar{A} = A \cup \partial A
= \text{int }A \cup \partial A
= \mathbb{R}^n \setminus \text{ext }A.
$$
It can also be interpreted as the smallest closed set containing $A$.
(see [[Open and closed sets]])

Any adherent point is either an _accumulation point_ (fi: kasautumispiste)
(a.k.a. _limit point_, _cluster point_)
or an _isolated point_ (fi: erakkopiste).
An accumulation point of set $A$ is a point $\mathbf{x}_0$ for which there exists
$$
\mathbf{a} : \mathbf{a} \in A \cap B(\mathbf{x}_0, r), \mathbf{a} \neq \mathbf{x}_0,
$$
for all $r > 0$, in other words there are an infinite number of points
getting arbitrarily close to $\mathbf{a}$.
Conversely, for an isolated point, there exists $r > 0$ for which
$A \cap B(\mathbf{x}_0, r) = \{\mathbf{x}_0\}$.

For any accumulation point $x_0$ of $A$, there is a sequence
$x_m \in A$ which converges to it - $x_m \neq x_0$ and $x_m \rightarrow x_0$.