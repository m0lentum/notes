[wikipedia](https://en.wikipedia.org/wiki/Group_theory)

A group (fi: ryhmä) is a set $G$ together with a binary operation "$\cdot$"
with the following properties:
- the operation is _closed_ in $G$
  (i.e. $a \cdot b \in G$ for all $a, b \in G$)
- the operation is _associative_ 
  (i.e. $(a \cdot b) \cdot c = a \cdot (b \cdot c)$)
- the operation has an _identity element_ 
  (i.e. $I \cdot a = a \cdot I = a$)
- every element of the set has an _inverse element_
  (i.e. $a \cdot a^{-1} = a^{-1} \cdot a = I$)

A structure with the first three properties is called a _monoid_.

Example: $(\mathbb{R}, +)$ is the _additive group_ of $\mathbb{R}$,
and $(\mathbb{R} \setminus \{0\}, \times)$ is the _multiplicative group_ of $\mathbb{R}$.
See the wikipedia page for more examples.

If the group operation is also _commutative_ (i.e. $a \cdot b = b \cdot a$ for all $a, b$),
the group is called an _abelian group_ (fi: Abelin ryhmä).