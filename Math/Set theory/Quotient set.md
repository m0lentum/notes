Let $X$ be a set and $\sim$ an [[equivalence relation]].
The _quotient set_ of $X$ by $\sim$
is $X/{\sim} := \{[x] : x \in X\}$.

The quotient set can be equipped with [[Co-induced topology#Quotient topology|quotient topology]],
in which case it's called a _quotient space_.

## Canonical projection

The map from a set to its quotient $p : X \rightarrow X/{\sim}$ defined by
$p(x) = [x]$ is called the _canonical projection_
from $X$ to $X/{\sim}$.

## Compatible maps

$X, Y$ nonempty sets, $\sim$ an equivalence relation on $X$, $f : X \rightarrow Y$.
$f$ is said to be _compatible_ with $\sim$
if $x \sim y \implies f(x) = f(y)$.
Then we can define $f_{\sim} : X/{\sim} \rightarrow Y$ as $f_{\sim}([x]) = f(x)$.

## Examples

Quotient sets of $[0, 1]^2 \subset \mathbb{R}^2$:
- Möbius strip: $(x, 0) \sim (1-x, 1) \,\forall\, x \in [0, 1]$
  (connect one edge to the opposite but with flipped orientation)
- Torus: 
  $(x, 0) \sim (x, 1) \,\forall\, x \in [0, 1]$,
  $(0, y) \sim (1, y) \,\forall\, y \in [0, 1]$
  (connect both edges to the opposite with matching orientation)
- Klein bottle:
  $(x, 0) \sim (x, 1) \,\forall\, x \in [0, 1]$,
  $(0, y) \sim (1, 1-y) \,\forall\, y \in [0, 1]$
  (same as torus but flip the connection along one edge)

