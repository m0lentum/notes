This might not be super necessary (especially if
[[Try using a min heap instead of deque for vacant slots]]
works out), but if I get a good idea of how this could be implemented,
I might as well try it.

Old comment from github:

The way nodes are currently reused, things are going to become fragmented over
time as slots are taken by patterns that are different from the original.
Frequently created and destroyed objects should have a way of only allowing
their slots to be used by the same kind of object again.

Also, pools would (well, not necessarily but should) allow to limit how many of
a specific object are in the world and preallocate memory for them so we need
less allocations at runtime.

