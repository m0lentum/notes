Collision detection could be speeded up significantly
if we were to cache the colliding/closest features
of each collider pair checked
and only check that pair on subsequent substeps.
This may have poor effects on stacking stability,
but it could be a big performance gain
and shouldn't be super hard to implement.
Try it.

Edit: Tried it by storing reference and incident edge from polygons,
it made things way too stuttery when close to corners.
Could _maybe_ be made to work by storing reference edge
and incident corner instead, but I suspect
that will have the same issue in edge-to-edge contacts.
Performance boost was pretty good
(30%-ish for substeps past the first one)
but I don't think I can make it work well enough to be worth it.

Edit 2: maybe if we stored contact points and normals in local space
instead of worrying about edges at all?
Would that make a difference?
It would certainly be easier to implement

Edit 2025: yes, the above idea turned out to work pretty nicely
as long as we invalidate contacts that have rotated too much.

Edit again: had to reduce the angle limit a lot
because otherwise things would sometimes get stuck oscillating
between point contacts at opposing ends of an edge.
This could probably be improved
by adding a dynamic angle limit that takes into account 
the nearest possible edge-edge contact.