Given a metric space $(X, d)$ and a set $A \subset X$, any point $\mathbf{x} \in X$
can be placed in one of three categories:

**Interior points** (fi: sisäpiste):
There exists $r > 0$ for which $B(\mathbf{x}, r)$
(i.e. the ball with radius $r$ centered at $\mathbf{x}$)
is a subset of $A$.
The set of these is denoted $\text{int }A$.

**Boundary points** (fi: reunapiste):
For all $r > 0$,
$B(\mathbf{x}, r) \cup A \neq \emptyset$
and $B(\mathbf{x}, r) \setminus A \neq \emptyset$,
i.e. any ball contains both points in $A$ and out of $A$.
Denoted $\partial A$.

**Exterior points** (fi: ulkopiste):
There exists $r > 0$ for which
and $B(\mathbf{x}, r) \cap A \neq \emptyset$.
Denoted $\text{ext }A$.

A set $A$ is _open_ if $\partial A \cap A = \emptyset$,
i.e. contains none of its boundary,
and _closed_ if $\partial A \subset A$,
i.e. contains all of its boundary.
More generally, a set is _open_
if for any $x \in A$ there is $r > 0$ for which $B(x, r) \subset A$
and _closed_ if its complement $X \setminus A$ is open.

Notably, $\emptyset$ and $\mathbb{R}^n$ are simultaneously both closed and open
because their boundaries are empty sets.

Some facts I can't be bothered to write down proofs for:
- A set $F \subset \mathbb{R}^n$ is closed if and only if
  its complement $\complement F = \mathbb{R}^n \setminus F$ is open
- The union of any number of open sets is open
- The intersection of a finite number of open sets is open
- The union of any number of closed sets is closed
- The intersection of a finite number of closed sets is closed
- All boundary sets are closed

The [[closure]] $\bar{A}$ of a set $A$ is the smallest closed set containing it.
A set $E \subset (X, d)$ is called _dense_ if $\bar{E} = X$.
The containing space $X$ is called _separable_
if it has a _numerable_ dense subset
(i.e. each element can be assigned an integer index).
Example: $\mathbb{R}$ is separable because $\mathbb{Q}$ is numerable,
$\mathbb{Q} \subset \mathbb{R}$ and $\bar{\mathbb{Q}} = \mathbb{R}$.

The collection of all open sets in a metric space $(X, d)$
is called its [[topology]].
## Sequential compactness

If (and only if) a set $K$ is closed and _bounded_ (fi: rajoitettu)
(i.e. there is some $M > 0$ for which $||x|| \leq M$ for all $x \in K$),
every sequence $x_m \in K$ has a subsequence that converges
to a point in $K$.
This property of a set is called _sequential compactness_
(fi: jonokompaktius).
Sequential compactness is preserved by continuous maps
(see [[Continuity]]).
