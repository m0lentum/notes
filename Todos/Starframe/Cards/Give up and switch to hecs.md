I'm not sure if the relatively high amount of boilerplate
necessitated by the entity graph is worth it.
Performance is also _probably_ significantly worse than hecs,
though I need to benchmark it.
What would I need to figure out new solutions for with hecs?

- multiple colliders per body
  (should colliders and bodies be hecs components
  or should they be held inside the physics system
  and only store handles in hecs?
  if in hecs, spatial index would be a bit difficult)
- everything about ropes
  (could these be just multibody constraints?
  those would also need a different expression with hecs)

That's probably it..?
Assets are another thing to think about.
A lot of graphics will be shared between multiple objects,
which could be expressed in the graph,
but may be better off using a different system.
Also consider switching to hecs but implementing
a flecs-style relationship system on top of it.