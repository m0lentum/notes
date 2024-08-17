A map $f : A \rightarrow \mathbb{R}^m$
is _continuous at a point_ $x_0 \in A$ along the set $A$
if for every $\varepsilon > 0$ there is a $\delta > 0$ such that
$$
d(f(x), f(x_0)) < \varepsilon
\text{ whenever } x \in A
\text{ and } 0 < d(x, x_0) < \delta.
$$

$f$ is _continuous_ if it is continuous at every point $x \in A$.

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


## Existence of minima and maxima

If a set $K \subset \mathbb{R}^n$ is closed and bounded (see [[Open and closed sets#Sequential compactness]])
and a function $f : K \rightarrow \mathbb{R}$ is continuous,
then $f$ reaches its minimum and maximum values in $K$, 
i.e. there are points $x_0, z_0 \in K$ for which
$f(x_0) = \sup_{x \in K} f(x)$ and $f(z_0) = \inf_{x \in K} f(x)$.

Proof:

If $K$ is sequentially compact and $f$ is continuous,
then $f$ is bounded (proof for this not written here).
Therefore sup and inf exist.
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
f(x) = \lim_{j \rightarrow \infty} f(x_{m_j}) = \sup_{x \in K} f(x).
$$
Same procedure for proving the minimum's existence.