If $F = dA$, where $F$ is a 2-form ([[Differential form]])
(in the context of Baez & Muniain 1994 this is electromagnetic spacetime 2-form)
$A$ is called a _vector potential_ for $F$
(hence $F$ is exact, see [[Closed and exact forms]])
and the [[Maxwell equations]]
$dF = 0$, $\star d \star F = J$ are simplified to $\star d \star d A = J$.
But $A$ plus any closed form $df$ is also a vector potential for $F$:
$d(A + df) = dA = F$.

Adding $df$ to the potential $A$ is called a _gauge transformation_,
and the ability to do this without changing the physical solution
is called _gauge freedom_.
_Gauge theories_ are physical theories (such as the Maxwell equations)
which have some kind of gauge freedom.

There are many different gauge transformations useful in different contexts.
Here's the only example given by Baez & Muniain in this chapter:
## Example: temporal gauge

A solution $A$ to the above equation
in spacetime $\mathbb{R} \times S$ is said to be in _temporal gauge_
if $A(\partial_t) = 0$.
In Minkowski spacetime $\mathbb{R}^4$, $A = A_0dt + A_1dx + A_2dy + A_3dz$,
$A$ is in temporal gauge if $A_0 = 0$.
Then $A$ only measures the spatial part of spacetime vectors,
but can vary in all directions,
so it can be described as a "1-form on $S$ that is a function of time".
This has some simplifying effects on the Maxwell equations
(see Baez & Muniain 1994 for details).