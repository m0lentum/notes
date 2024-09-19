Let $f : (X_1, d_1) \rightarrow (X_2, d_2)$ be a map between [[metric]] spaces and $L \geq 0$.
$f$ is _$L$-Lipschitz_ if $d_2(f(x), f(y)) \leq Ld(x, y)$.
$f$ is _Lipschitz_ if it is $L$-Lipschitz for some $L$.
$f$ is _locally Lipschitz_ if for all $x_0 \in X_1$
there is a neighborhood $U \ni x_0$ such that
$f|_U : (U, d|_U) \rightarrow (X_2, d_2)$ is Lipschitz.

If $f$ is a bijection and $f^{-1}$ is Lipschitz, $f$ is _bi-Lipschitz_.
This corresponds to the condition
$$
\frac{1}{K} d_1(x,y) \leq d_2(f(x), f(y)) \leq Kd_1(x,y).
$$
If $f$ fulfills this condition without being a bijection,
it is a _bi-Lipschitz embedding_ (fi: bi-Lipschitz upotus).

All Lipschitz functions are [[Continuity|continuous]].
Every [[isometry]] is 1-bi-Lipschitz.
Every bi-Lipschitz function is a [[Homeomorphism]].