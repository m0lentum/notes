Treat two-point contacts as a single matrix equation
instead of solving each separately.
This should make stacks of boxes even smoother
and possibly help with [[Anisotropic friction]].

Look at Box2D for an example implementation (adapt to PBD ofc).
The Box2D paper has a chapter on this IIRC.