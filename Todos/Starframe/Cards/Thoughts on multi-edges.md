A tinyvec or similar could replace the current linked list
approach to multiple edges from a node to nodes of one type,
probably without a real performance hit in the multiple-edge case.
However, the single-edge case is the default
and should be optimized for.
Memory locality is important for this,
so the multi-edge part of a single node should be as small as possible.
