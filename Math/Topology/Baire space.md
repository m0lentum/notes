A [[Topology|topological space]] is a _Baire space_
if the intersection of countably many open [[dense sets]] is dense.

Examples:

$\mathbb{R}$ with standard topology, $U_n := \mathbb{R} \setminus \{q_n\}$
where $\mathbb{Q} = \{q_1, q_2, \dots\}$.
$U_n$ is open and dense, and $\bigcap_{n=1}^{\infty} U_n = \mathbb{R} \setminus \mathbb{Q}$ which is dense.
$\mathbb{R}$ might be a Baire space (but we need the Baire theorem to prove it).

$\mathbb{Q}$ with standard topology, $U_n := \mathbb{Q} \setminus \{q_n\}$.
$U_n$ is open and dense but $\bigcap_{n=1}^{\infty} U_n = \emptyset$
$\implies \mathbb{Q}$ is not a Baire space.

## Proposition: characterization of Baire spaces

Topological space $X$ is a Baire space
$\iff$ if $(F_n)_{n=1}^{\infty}$ is a sequence of closed sets in $X$
with empty interior, then $\text{int }(\bigcup_{n=1}^{\infty} F_n) = \emptyset$.

Proof: this is basically just the complement of the definition:
$\bigcup F_n = \emptyset \iff \bigcap \overline{F_n^C} = X$
(which follows from $X = \text{int }A \sqcup \partial A \sqcup \text{ext }A$ for any $A \subset X$)

## Baire theorem

The _Baire theorem_ states that every [[Complete space|complete]] [[metric]] space
is a Baire space.
###### Proof
Let $(X, d)$ be a complete metric space,
$U_n \subset X$ open and dense for all $n \in \mathbb{N}$.
Let $V \subset X$ be open and nonempty
and check that $V \cap (\bigcap_{n=1}^{\infty} U_n) \neq \emptyset$:
1. $U_1$ is open and dense $\implies U_1 \cap V$ nonempty and open
  $\implies$ can find a closed ball $\overline{B}(x_1, r_1) \subset U_1 \cap V$.
  We can assume $r_1 \leq 1$.
2. $U_2$ is open and dense $\implies U_2 \cap B(x_1, r_1)$ nonempty and open
  $\implies$ can find $\overline{B}(x_2, r_2) \subset U_2 \cap B(x_1, r_1)$.
  We can assume $r_2 \leq \frac{1}{2}$.
n. $U_n$ is open and dense $\implies U_n \cap B(x_{n-1}, r_{n-1})$ is nonempty and open
  $\implies$ can find $\overline{B}(x_n, r_n) \subset U_n \cap B(x_{n-1}, r_{n-1})$.
  Assume $r_n \leq \frac{1}{n}$.
We get a sequence of nested closed balls
$\overline{B}(x_1, r_1) \supset \overline{B}(x_2, r_2) \supset \dots \supset \overline{B}(x_n, r_n)$
and $\text{diam}(\overline{B}(x_n, r_n)) \leq \frac{2}{n} \overset{n \rightarrow \infty}{\longrightarrow} 0$.
Then by Cantor's intersection theorem for complete metric spaces,
$\bigcap_{n=1}^{\infty} \overline{B}(x_n, r_n) = \{x\}$ for some $x \in X$
and $x \in U_n$ for all $n$ $\implies x \in V \cap (\bigcap_{n=1}^{\infty} U_n)$
$\implies \bigcap_{n=1}^{\infty} U_n$ is dense $\implies X$ is Baire.
######

Corollary:
A complete metric space that does not have any isolated points is uncountable.

Applications for the theorem:
- [uniform boundedness principle](https://en.wikipedia.org/wiki/Uniform_boundedness_principle) in functional analysis
- a continuous, nowhere differentiable function $f : [0, 1] \rightarrow \mathbb{R}$ exists
