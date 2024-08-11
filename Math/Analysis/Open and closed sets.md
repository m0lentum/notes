Given a set $A \subset \mathbb{R}^n$, any point $\mathbf{x} \in \mathbf{R}^n$
can be placed in one of three categories:

**Interior points**:
There exists $r > 0$ for which $B(\mathbf{x}, r)$
(i.e. the ball with radius $r$ centered at $\mathbf{x}$)
is a subset of $A$.
The set of these is denoted $\text{int }A$.

**Boundary points**:
For all $r > 0$,
$B(\mathbf{x}, r) \cup A \neq \emptyset$
and $B(\mathbf{x}, r) \setminus A \neq \emptyset$,
i.e. any ball contains both points in $A$ and out of $A$.
Denoted $\partial A$.

**Exterior points**:
There exists $r > 0$ for which
and $B(\mathbf{x}, r) \cap A \neq \emptyset$.
Denoted $\text{ext }A$.

A set $A$ is _open_ if $\partial A \cap A = \emptyset$,
i.e. contains none of its boundary,
and _closed_ if $\partial A \subset A$,
i.e. contains all of its boundary.

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