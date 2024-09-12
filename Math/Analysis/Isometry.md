Let $(X, d_X)$ and $(Y, d_Y)$ be [[Metric|metric spaces]] and $f : X \rightarrow Y$ a map.
$f$ is a _distance-preserving map_ or _isometric embedding_
if $d_Y(f(x_1), f(x_2)) = d_X(x_1, x_2)$ for all $x_1, x_2 \in X$,
i.e. the map preserves distances between all points.
If $f$ is also a bijection, it is called an _isometry_.

An isometric embedding is always an injection.

Examples:
- a shift $f : V \rightarrow V, \quad f(x) = x + v$ for some $v \in V$
	(where $V$ is a vector space) is an isometry
- $f : \mathbb{R} \rightarrow \mathbb{R}^2, \quad f(x) = (x, 0)$ is an isometric embedding but not a bijection