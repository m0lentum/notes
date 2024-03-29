Work is well underway on getting assets into one controlled place.
Prerequisite to [[Blender as a level editor]].

Thoughts:

Is there a "default animation" we could play automatically for animated meshes?
It's a hassle to remember to start the animation
for meshes that have just one that loops forever.
Maybe just the first one encountered?
OTOH then we'll have to override default animations that we don't want..
Maybe a default animation could be set as a custom property in Blender
once we get around to full level editor stuff, 
probably not worth thinking about right now

Might be nice to prune animators pointing to the same target
so that the user doesn't need to be super careful
about playing the same thing many times

How should garbage collection work?
Maybe just allow marking some assets as persistent
and unload everything else on command?

If an asset is added with the same name as another,
what should happen?
Currently nothing special is done,
meaning the old one still exists but can't be accessed by name anymore,
which is more or less ok but would suck with hot reloading.
For hot reloading we could instead replace the arena slot,
keeping old mesh ids valid but pointing them to a new thing

Speaking of which, how about hot reloading?
Seems like it shouldn't take very much work and would kick ass