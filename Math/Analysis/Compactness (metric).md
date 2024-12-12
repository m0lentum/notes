See also [[Compactness (topology)]]

Let $(X, d)$ be a metric space and $A \subset X$.

The collection $\{V_j\}_{j \in J}$ of subsets of $A$
is a _cover_ of $A$ if $A \subset \cup_{j \in J} V_j$.
The cover is _open_ if all $V_j$ are open ([[Open and closed sets]]).
A _subcover_ of $\{V_j\}_{j \in J}$
is a collection $\{V_j\}_{j \in \hat{J}}$, $\hat{J} \subset J$
which is still a cover of $A$.
$\{V_j\}_{j \in J}$ is _finite_ if the index set $J$ is finite.

**Definition**:
The set $A$ is _compact_ if every open cover of $A$ has a finite subcover.

In $\mathbb{R}^n$, this is true if and only if $A$ is closed and bounded.
In general metric spaces, compactness implies closedness and boundedness
but not the other way around.
For example, the half-open interval $]0, 1]$
is closed and bounded in $\mathbb{R} \setminus \{0\}$ but not compact.
###### Proof
**Compactness implies boundedness**:
Let $a_0 \in A$.
The collection $\{B(a_0, n)\}_{n \in \mathbb{N}}$ is a cover of $A$.
Because $A$ is compact, there's a finite subcover $\{B(a_0, n)\}_{n \in J}$, $J \subset \mathbb{N}$.
Select $n_0 = \max J$.
Now $A \subset \cup_{n \in J} B(a_0, n) \subset B(a_0, n_0)$ $\implies$ A is bounded.

**Compactness implies closedness**:
Let $x \in X \setminus A$.
The collection $U_n = X \setminus \overline{B}(x, \frac{1}{n})$ is an open cover of $A$.
A finite subcover $\{U_n\}_{n \in J}$ exists,
along with $n_0 = \max J$.
Now $X \setminus \overline{B}(x, \frac{1}{n}) \subset X \setminus \overline{B}(x, \frac{1}{n_0})$ for all $n \in J$,
$A \subset X \setminus \overline{B}(x, \frac{1}{n_0})$
$\implies B(x, \frac{1}{n_0}) \subset X \setminus A$
$\implies$ $x$ is an interior point of $X \setminus A$
$\implies$ $X \setminus A$ is open $\implies$ $A$ is closed.

**Closed and bounded in $\mathbb{R}^n$ implies compact**
(a.k.a. Heine-Borel theorem):
Let $(x_j)$ be a [[sequence]].
Take a bounding hypercube of $A$,
split it into $2^n$ equally sized subcubes.
There's always at least one cube with an infinite number of $x_j$s.
Take a subsequence of $(x_j)$ containing the points that fit in this cube.
Split this cube again and repeat this procedure.
Create a new sequence as follows:
For the $k$th splitting iteration, take the $k$th element
of the corresponding subsequence of $(x_j)$.
This is a [[Cauchy sequence]] in $A$, and because $A$ is compact and therefore [[Complete space|complete]],
it converges to a point.
Therefore $(x_j)$ has a converging subsequence
$\implies$ $A$ is sequentially compact (see next section).

## Sequential compactness

A set $A$ is _sequentially compact_ if all [[sequence]]s $(x_j) \subset A$
have a subsequence that converges to a point in $A$.

A space is compact if and only if it is sequentially compact.

The proof is long and I can't be bothered to write it down now,
but the hard part of it is a similar splitting procedure
to the Heine-Borel theorem in the previous section (only with balls instead of cubes).

## Properties of compact spaces

If $X$ is compact, it is [[Complete space|complete]]
and _separable_, meaning it has an enumerable dense subset
(subset with at most countably infinite elements
whose closure is the space itself).

If $X$ is compact and $E \subset X$ is closed, then $E$ is compact.

If $K \subset X$ is compact and $E \subset X$ is closed,
then $K \cap E$ is compact.

If $K_1, \dots, K_n \subset X$ are all compact,
then $\cup_{j=1}^{n} is compact.

If $J \neq \emptyset$ and $K_{\alpha}$ is compact with all $\alpha \in J$,
then $\cap_{\alpha \in J} K_{\alpha}$ is compact.

If $X$ and $Y$ are compact, then $X \times Y$ is compact.

Let $X, Y$ be [[Homeomorphism|homeomorphic]] metric spaces.
Then $X$ is compact $\iff$ $Y$ is compact.

If $f : X \rightarrow Y$ is [[Continuity (metric)|continuous]] and $K \subset X$ is compact,
then $f(K)$ is compact.

If $X$ is compact and $f : X \rightarrow Y$ is continuous,
then $f$ is [[Continuity (metric)#Uniform continuity|uniformly continuous]].

Let $X$ be compact and $f : X \rightarrow Y$ continuous.
If $f$ is a bijection, then $f$ is a [[Homeomorphism]].
