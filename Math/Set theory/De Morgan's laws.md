[wikipedia](https://en.wikipedia.org/wiki/De_Morgan%27s_laws)

De Morgan's laws expressed in terms of sets
state that "union and intersection interchange under complementation":
$(A \cup B)^C = A^C \cap B^C$,
$(A \cap B)^C = A^C \cup B^C$.
By induction it follows that
$$
\begin{aligned}
(\bigcup_{i \in I} A_i)^C &= \bigcap_{i \in I} A_i^C \\
(\bigcap_{i \in I} A_i)^C &= \bigcup_{i \in I} A_i^C \\
\end{aligned}
$$
with $I$ being an index set.

In Boolean logic the equivalent statements
(in common programming language notation) are
`!(A && B) = !A || !B`,
`!(A || B) = !A && !B`.