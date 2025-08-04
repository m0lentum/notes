The direct sum (aka direct product) of two [[group]]s $G,H$,
denoted $G \oplus H$ for sum or $G \times H$ for product,
is the set of ordered pairs $\{(g,h) : g \in G, h \in H\}$
(cartesian product of the two sets)
with group operation $(g,h)(g',h') = (gg',hh')$,
identity $(1,1)$
and inverse $(g,h)^{-1} = (g^{-1},h^{-1})$.

Intuitively speaking, it's like two
unrelated things happening at the same time,
only conceptually joined together -
the two elements in the pair have no effect on each other
(unlike, say, the group of complex numbers with complex multiplication).

We can also take a direct sum of [[representation]]s in a similar manner: 
with two representations of group $G$ on two different vector spaces,
$\rho : G \rightarrow GL(V), \rho' : G \rightarrow GL(V')$,
the direct sum $\rho \oplus \rho' : G \rightarrow GL(V \oplus V')$
is given by $(\rho \oplus \rho')(g)(v, v') = (\rho(g)v, \rho'(g)v')$.
