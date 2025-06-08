A [[Differential form]] $\omega$ is called _closed_ if $d\omega = 0$
and _exact_ if $\omega = d\phi$ for some $(k+1)$-form
(where $\phi$ is called a _potential_ for $\omega$).

The identity $d^2 = 0$ is equivalent to the statement
"all exact forms are closed".
This is always true, but the converse isn't necessarily.
All closed forms are exact in [[Simply connected set|simply connected]] spaces,
but not always in other kinds of spaces.

To illustrate, try to find a potential for 0-form $E$
(context: electric field in Baez & Muniain 1994).
Fix a point $p \in S$ and define $\phi(q) = -\int_{\gamma} E$
where $\gamma : [0, T] \rightarrow S$ is a path from $p$ to $q$
(assume $S$ is [[Connectedness|path-connected]] so that this exists).

Problem: $\phi$ may depend on the choice of $\gamma$.
Solution: define a family of maps $\gamma(s, t)$
such that $\gamma(s, 0) = p, \gamma(s, T) = q$ for all $s$ and $\gamma(s, t)$ varies smoothly with $s$.
If you then differentiate $I_s = \phi(\gamma(s,t)) = -\int_0^T E_{\gamma(s,t)}(\gamma'(s,t))\,dt$ with respect to $s$
(see Baez & Muniain p. 106 or my notebook for steps),
you get that $\partial_s I_s = 0$ and thus $I_s$ doesn't depend on $s$ if $dE = 0$,
which is true because $dE = dd\phi = 0$.
Thus $\phi(q) = -\int_{\gamma}E$ can be defined and therefore $E$ is exact
if all paths from $p$ to $q$ can be smoothly deformed into each other
(they are [[Homotopy|homotopic]]).

A corollary of this is that closed forms have the same integral
over any two homotopic paths,
and therefore you can prove two paths aren't homotopic
by finding a closed form whose integral they don't agree on.
This is the basis of [[deRham cohomology]],
which studies when closed forms are not exact.