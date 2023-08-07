A lot of properties should have simple interpolating animations
with different options for easing functions.
The big one is effects on UI when changing state, which
I won't have for a while, but also smoothing slow-mo effects,
camera trajectories, maybe even moving objects in the world
(kinematic objects specifically, it wouldn't really work for
things that need to be interruptable by collisions or constraints).

Idea: a top-level manager struct that lives inside `Game` and handles
keeping track of time automatically. Individual tween operations
are pushed to a slotmap, giving keys that can be used to query the current
value of the tween.

The alternative to keys and manual queries would be giving the tweening system
some way to mutate state on its own, which would actually be totally possible
if it lives inside `Game` :thinking: I don't think there's any way
to make this approach very efficient with things that are in the component graph
because it would need to re-lock layers for every tween,
but maybe this won't be used heavily enough to make that a problem.

The big issue with the previous idea is requiring the user to specify the
full "path" to the thing being tweened from the state "root".
The only real alternative if automatic application is desired is wrapping
the tweened thing in an `Arc<Mutex>`, which might be ok in some cases but comes
with the major annoyance of having to change the type of the thing being tweened.
Maybe have an option for auto-apply using that pattern and also give out handles
that can be used to apply manually.

This ties into the wider problem of animation, but I think there would be
a lot of value in a simpler system like this that you can just dump any kind of
tween into at any time. Possibly a more fully featured animation system
with multiple keyframes, different states with different animations, looping,
blending and such could be implemented on top of the tweening system.