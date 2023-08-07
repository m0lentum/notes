Retain the structure where every edge exists in both directions,
but add metadata to edges enabling the possibility
of parent/child hierarchies.
These could probably be implemented efficiently as bitflags on the edge
and maybe encode other information as well.
A similar bitflag could be used instead of `Option`
to encode the case of no edge.

This would provide a natural way to implement things like transform hierarchies.
The idea this came from is implementing multibody constraints
like rope bending resistance as graph nodes.
(an alternative for that would be holding constraint bodies in a `tinyvec`).

These could also have implications on how deletion boundaries work.
Deleting a parent would also delete the child,
but not the other way around.
This could replace the clunky way boundaries are currently defined by type.