A [[Topology|topological space]] $(X, \tau)$ is
- _first countable_ ($N_1$) if every $x \in X$ has a countable [[Basis (topology)#Neighborhood basis|neighborhood basis]]
- _second countable_ ($N_2$) is $X$ has a countable [[Basis (topology)|basis]]

All second countable spaces are first countable
and [[Dense sets#Separable spaces|separable]].

## Examples

If $X$ is metrizable, it is first countable
(but not necessarily second countable):
for $x \in X$, $\mathcal{B} = \{B(x, \frac{1}{n}) : n \in \mathbb{N}\}$
is a countable neighborhood basis.

$\mathbb{R}$ with standard topology is second countable:
$\mathcal{B} = \{B(q, \frac{1}{n}) : q \in \mathbb{Q}, n \in \mathbb{N}\}$
is a countable basis of $\mathbb{R}$.

## Lemma: nested neighborhood basis

$X$ is first countable $\implies$ every point $x \in X$
has a neighborhood basis $\{U_n\}_{n=1}^{\infty}$ consisting of nested sets,
$U_{n+1} \subset U_n$ for all $n$.
###### Proof
Fix $x \in X$. By first countability of $X$
exists a countable neighborhood basis ${V_n}_{n=1}^{\infty}$.
Select $U_1 = V_1$, $U_2 = V_1 \cap V_2 = U_1 \cap V_2$, $\dots$, $U_n = V_1 \cap \dots \cap V_n = U_{n-1} \cap V_n$.
Now $U_n$ is open as a finite intersection of open sets,
$U_{n+1} \subset U_n$ and $x \in U_n$ for all $n$,
and $\{U_n\}$ is a neighborhood basis.

## Lemma: closure and convergence in $N_1$ space

Let $X$ be a first countable topological space, $A \subset X$.
Then $a \in \overline{A} \iff \exists (x_n)_{n=1}^{\infty} \subset A$ s.t. $x_n \longrightarrow a$ 
([[Sequence]], [[Convergence (topology)]],  [[Closure]]).
###### Proof
"$\impliedby$" is true in all topological spaces
(not sure if I have the proof in my notes here but it's been proven before on this course).
"$\implies$": Let $a \in \overline{A} \iff$ any neighborhood of $a$ meets $A$.
In particular for neighborhood basis $\{U_n\}_{n=1}^{\infty}$ with $U_{n+1} \subset U_n$ $\forall n$
(which exists per the previous lemma),
we have $U_n \cap A \neq \emptyset$ $\forall n$
$\implies$ we can obtain $(x_n)$ such that $x_n \in U_n \cap A$.
Now due to [[Convergence (topology)#Lemma convergence in terms of neighborhood basis]]
$x_n \longrightarrow a$.

## Lemma: sequential continuity in $N_1$ space

Let $X,Y$ be topological spaces, $X$ first countable, $f : X \rightarrow Y$.
Then $f$ is [[Continuity (topology)|continuous]] $\iff$ $f$ is sequentially continuous
(i.e. $x_n \longrightarrow x \iff f(x_n) \longrightarrow f(x)$).
###### Proof
"$\implies$" is true in all topological spaces.
"$\impliedby$": Let $F \subset Y$ be closed, show that $f^{-1}[F]$ is closed
by showing that $\overline{f^{-1}[F]} \subset f^{-1}[F]$.
Let $x \in \overline{f^{-1}[F]} \implies \exists\,(x_n) \subset f^{-1}[F]$ s.t. $x_n \longrightarrow x$
$f$ is sequentially continuous $\implies f(x_n) \longrightarrow f(x)$.
Note $f(x_n) \in F \implies f(x) \in \overline{F}$.
Also $F$ closed $\implies F = \overline{F} \implies f(x) \in F \implies x \in f^{-1}[F]$.
