A map between [[metric]] spaces $f : (X_1, d_1) \rightarrow (X_2, d_2)$
is _continuous at a point_ $x_0 \in X_1$ along the set $A$
if for every $x \in X_1$ and $\varepsilon > 0$ there is a $\delta > 0$ such that
$$
d(f(x), f(x_0)) < \varepsilon
\text{ when } 0 < d(x, x_0) < \delta.
$$
In other words,
$$
\forall\, \varepsilon > 0
\quad \exists\, \delta > 0 : f(B_{d_1}(x_0, \delta)) \subset B_{d_2}(f(x_0), \varepsilon)
$$

$f$ is _continuous_ if it is continuous at every point $x \in X_1$.

When the metric spaces are $(A \subset \mathbb{R}^n, d_E)$ and $(B \subset \mathbb{R}^m, d_E)$,
$f$ is continuous at a point if and only if
all its coordinate functions $f_j : A \rightarrow \mathbb{R}$ are continuous at that point.

For intuition, consider the case
where a function of a single variable
is discontinuous at a point $x_0$ (there's a gap).
At this point, for any $\varepsilon$ smaller than the gap,
the only $\delta$ for which all values of $f(x)$, $x \in ]x_0 - \delta, x_0 + \delta[$
are within $\varepsilon$ is $\delta = 0$ because anything else
will contain values from across the gap.

Counterintuitively, given a set with isolated points
(a set that is, in a way, discontinuous; see [[Closure]]),
**all** maps are continuous at the isolated points.
This is because by definition of an isolated point,
there is a $\delta > 0$ for which $\{ x : d(x, x_0) < \delta \} = \{x_0\}$,
and thus you can always pick a $\delta$ for which
$d(f(x), f(x_0)) = 0$ for the one point in $A$ in that range.

At an accumulation point $x_0$ (see [[Closure]] again),
$f$ is continuous if
$$
\lim_{\substack{x \rightarrow x_0 \\ x \in A}} f(x) = f(x_0).
$$

## Theorem: Characterizing continuity via open and closed sets

Let $X$ and $Y$ be metric spaces and $f : X \rightarrow Y$.
1. $f$ is continuous $\iff$ $f^{-1}(U) \subset X$ is [[Open and closed sets|open]] for all open $U \subset Y$
2. $f$ is continuous $\iff$ $f^{-1}(F) \subset X$ is closed for all closed $F \subset Y$
3. $f$ is continuous $\iff$ $f(\bar{A}) \subset \overline{f(A)}$ for all $A \subset X$

Proof of 1.:
	"$\implies$":
	Let $x \in f^{-1}(U)$, $y = f(x) \in U$.
	Because $U$ is open, there is some $\varepsilon > 0$ for which
	$B(y, \varepsilon) \subset U \implies f^{-1}(B(y, \varepsilon)) \subset f^{-1}(U)$.
	Because $f$ is continuous, there is $\delta > 0$ for which
	$$
	f(B(x, \delta)) \subset B(y, \varepsilon) \implies B(x, \delta) \subset f^{-1}(B(y, \varepsilon)) \subset f^{-1}(U).
	$$
	Therefore, $f^{-1}(U)$ is open.
	"$\impliedby$":
	If $U \subset Y$ is open,
	then for any point $x \in f^{-1}(U)$ there is $\varepsilon > 0$
	such that $B(f(x), \varepsilon) \subset U$.
	The preimage of $B(f(x), \varepsilon)$ is also open due to the starting assumption.
	Therefore there is $\delta > 0$ such that 
	$$
	B(x, \delta) \subset f^{-1}(B(f(x), \varepsilon))
	\implies f(B(x, \delta)) \subset B(f(x), \varepsilon)
	$$
	and thus $f$ is continuous.

### Example

Let $(X, \delta)$ be a metric space with the discrete metric (see [[metric]]).
Then all $A \subset X$ are open because $\{x\}$ is open for all $x \in X$
and $A = \cup_{x \in A} \{x\}$. Thus for any $f : X \rightarrow Y$, $B \subset Y$,
$f^{-1}(B)$ is always open because all sets in $X$ are open.
Therefore all maps from $X$ to any other space are continuous.

On the other hand for maps from another space to the discrete space,
$f : Y \rightarrow X$, the condition 1. requires that
for every singleton $\{x\} : x \in X$, $f^{-1}(\{x\})$ is open.
Pick $y$ such that $f(y) = x \implies y \in f^{-1}(\{x\})$.
For $f^{-1}(\{x\})$ to be open, there must be $r > 0$
such that $B_Y(y, r) \subset f^{-1}(\{x\})$
which implies that the restricted metric $d_Y|_{B(x,r)}$ is constant.
Thus only _locally constant_ maps are continuous.

## Theorem: existence of minima and maxima

If a set $K \subset \mathbb{R}^n$ is closed and bounded (see [[Open and closed sets#Sequential compactness]])
and a function $f : K \rightarrow \mathbb{R}$ is continuous,
then $f$ reaches its minimum and maximum values in $K$, 
i.e. there are points $x_0, z_0 \in K$ for which
$f(x_0) = \max_{x \in K} f(x)$ and $f(z_0) = \min_{x \in K} f(x)$.

Proof:
	If $K$ is sequentially compact and $f$ is continuous,
	then $f$ is bounded (proof for this not written here).
	Therefore max and min exist.
	Then we can select a sequence $x_m \in K$
	for which $f(x_m) \rightarrow \sup_{x \in K} f(x)$.
	Because $K$ is sequentially compact,
	this sequence has a subsequence $x_{m_j}$
	which converges to a point $x \in K$.
	Because $x_m$ converges to a point, all its subsequences also converge to this point.
	And finally, because $f$ is continuous
	and thus the limit of a sequence's image
	equals the image of that sequence's limit,
	$$
	f(x) = \lim_{j \rightarrow \infty} f(x_{m_j}) = \max_{x \in K} f(x).
	$$
	Same procedure for proving the minimum's existence.
