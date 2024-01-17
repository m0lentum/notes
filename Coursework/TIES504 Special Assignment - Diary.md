## 2023-09-23 (2h)

Researching linear algebra libraries and setting up a project.

## 2023-09-24 (6h)

Began to implement a `SimplicialMesh` structure.
Took some time to figure out how to express it in a dimension-generic way,
and implemented collection of sub-simplices
from the top-level simplices given in the constructor.

## 2023-09-26 (3h)

Added a test to make sure 3D simplices are generated correctly
and began to sketch information needed for boundary operators.

## 2023-09-27 (2h)

Added deduction of boundary simplices.
Still need their relative orientations for the full boundary operator.

## 2023-09-28 (2h)

Realized I had been thinking about boundary orientations wrong,
looked up how they actually work, and implemented them.

## 2023-09-30 (4h)

Sketched APIs for cochains and operators on them.
Experimenting with the `typenum` crate for compile-time checked dimensions.

## 2023-10-01 (4h)

Implemented the exterior derivative.
The generic APIs are working pretty nicely so far;
if I can get operator composition to work how I envision it,
this will be great.

## 2023-10-03 (2h)

Added a multiplication syntax for operator composition.
Some difficulties were encountered getting generics to work right,
but it seems to work now.

## 2023-10-05 (5h)

Added compile-time range checks on operator and cochain dimensions.
This took some fancy generics magic
including a pivot to a different style of generics overall,
but ended up working pretty nicely.
Error messages could be better but there's not much I can do about that.

## 2023-10-07 (4h)

Wrote some documentation.

## 2023-10-12 (3h)

Finished writing the documentation from last session;
the Cochain & Operator APIs are now pretty thoroughly documented.

## 2023-10-15 (3h)

Created an example acoustics simulation
to figure out what I still need to build.
Made some improvements to the cochain API.

## 2023-10-19 (2h)

Looking into how to compute circumcenters of simplices,
found a good reference in the PyDEC paper.

## 2023-10-21 (2h)

Working on the circumcenter algorithm.

## 2023-10-23 (3h)

Got circumcenter computation working and tested.

## 2023-10-25 (4h)

Implemented computing of primal volumes
and did some research on dual volumes.

## 2023-10-29 (4h)

Started implementing computation of dual volumes.

## 2023-11-01 (2h)

Continuing the implementation of dual volumes.
It's a somewhat tricky recursive algorithm,
but most of the way done now.

## 2023-11-02 (2h)

A bit of refactoring and unit test writing for dual volumes.

## 2023-11-04 (3h)

Finished the unit test to check dual volumes.
A lot of math to do by hand, but worth the effort
to ensure correctness.

## 2023-11-05 (1h)

Research on whether dual volumes need anything special
on the boundary of the mesh. Answer: no.

## 2023-11-06 (3h)

Working on the sign rule for non-well-centered simplices' dual volumes.
Not quite working correctly yet.

## 2023-11-07 (2h)

More work on dual volume signs.
Fixed a couple of bugs and it seems correct now,
but my unit test for this is still missing a bit of work.

## 2023-11-08 (3h)

Finished implementing and testing dual volume computation,
implemented Hodge star using it,
did a bit of refactoring.

## 2023-11-09 (2h)

Started refactoring how boundary data is stored,
with the aim of making it more efficient
to navigate from boundary simplices back up to coboundary simplices
(currently getting to boundary simplices is trivial,
but coboundaries require a full linear search).

## 2023-11-12 (4h)

Finished the aforementioned refactoring and started sketching
how the set of boundary simplices should be expressed
and how to apply it to operators to implement boundary conditions.

## 2023-11-14 (1h)

Implemented and tested the identification of boundary simplices.

## 2023-11-15 (2h)

Started sketching APIs for adding boundary conditions to operators
by excluding some cochain elements from the output.
Had to write some code manipulate CSR matrix structure by hand
since `nalgebra-sparse` isn't very far developed in this regard,
which took pretty much all of this session to get right.

## 2023-11-18 (4h)

Got the API for removing rows from operators working,
added scalar multiplication for operators,
and integrated those features into the example membrane simulation.

## 2023-11-19 (5h)

Implemented construction of cochains with initial values
by integrating a function over mesh elements.
Rudimentary for now (function gets the vertices of a cell
and integration must be implemented manually by the user),
but should work as a nice framework
to add automatic numerical integration schemes to later.
Also some refactoring and work on iterator APIs.

## 2023-11-24 (1h)

Some work on integration over general cells.
Decided I won't finish this now
as I don't need the feature at the moment.

## 2023-11-25 (3h)

Some research and experimentation on generating meshes with `gmsh`
and loading them from `.msh` files.

## 2023-11-26 (4h)

Got gmsh mesh loading working and fixed a couple of bugs.
My membrane simulation's operators match those produced by PyDEC now!

## 2023-11-28 (3h)

Researched possible ways to do plots of scalar data.
Started to sketch windowing and rendering architecture
for real-time visualizations.

## 2023-11-30 (2h)

More graphics programming, managed to open a window
and started thinking about render pipelines.

## 2023-12-04 (3h)

Working on render pipelines for a wireframe view of the mesh.

## 2023-12-05 (3h)

More work on the wireframe renderer,
branching off into ideas about how to color the mesh
based on cochain values.

## 2023-12-06 (7h)

Working on an animation system.
Some difficulties reconciling the style of API I'm thinking about
with the event loop architecture of `winit`,
but managed to come up with something I mostly like
and render my first wireframe.

## 2023-12-07 (3h)

Added a camera system.
Implemented a 2D orthographic projection camera
(without interactive controls for now)
and sketched a perspective variant for 3D.

## 2023-12-13 (2h)

Refactoring the rendering APIs to be easier to use
and internal structures to be able to share resources
between different pipelines
in preparation for a system to draw the mesh
colored based on cochain values.

## 2023-12-15 (5h)

Iterating on various parts of the rendering system.
Going back and forth on whether vertex pulling is beneficial to me;
trying and failing to optimize everything into one render pass;
ultimately got a visualization of a 0-cochain with vertex colors working.

## 2023-12-16 (8h)

Researched how Matplotlib does color mapping for its plots
and implemented my own version of it.

## 2023-12-18 (4h)

Did a bit of refactoring, documented the visualization APIs I have so far
and decided they were good enough to merge to the main branch.

## 2023-12-21 (1h)

Noticed compile times have gotten quite long with the addition
of all the graphics dependencies, having a particularly big effect on doctests,
and decided to factor the visuals into their own crate.
This turned out to be a bit difficult.

## 2023-12-22 (1h)

Thought some more about potential ways to split off the visuals,
ended up following through on yesterday's original design.

## 2023-12-23 (3h)

Set up a Kanban board to keep track of ideas,
reworked the `ComposedOperator` type to be much nicer to use,
and updated the crate documentation.

## 2023-12-27 (5h)

Working on a more efficient algorithm
for generating boundary maps and lower-dimensional simplices,
as described in the PyDEC paper (section 7).
My initial naive algorithm does not scale well enough when mesh size increases.
This turned out to require some pretty finicky changes.

## 2023-12-28 (3h)

Finished the overhaul of the boundary generating algorithm.

## 2023-12-30 (4h)

Started working on a line renderer based on [this blogpost](https://wwwtyro.net/2019/11/18/instanced-lines.html),
intended for a variety of purposes
such as nicer wireframes of the mesh, arrows for visualizing vectors,
and possibly real-time plots of general data in the more distant future.

## 2024-01-02 (4h)

Continuing to work on the line renderer.

## 2024-01-03 (3h)

More work on lines. Fixed an issue where multiple calls in a frame
would overwrite each other's data
and added math to orient them correctly in 3D.

## 2024-01-04 (3h)

Sketched a coordinate axes display using the line renderer.

## 2024-01-05 (1h)

Added a scaling factor to keep the view aspect ratio constant
to the camera transform and did a couple of minor refactorings.

## 2024-01-06 (8h)

Added some parameter controls to the line renderer (width, color)
and made it possible to define the width in screen space pixels
instead of world space units.

## 2024-01-10 (4h)

Added configurable caps and joins for the line renderer,
plus arrow heads as a new cap type.
Requires a bit more work to make arrows properly pointy.

## 2024-01-11 (4h)

Solved the arrow pointiness problem
by simply moving the cap far enough past the line segment's end.
At first tried to do it by adjusting the line segment length instead
but that turned out more trouble than it's worth.
Fleshed out the coordinate axis renderer using the new arrow caps.
Added barycenter computation to the mesh constructor
to prepare for visualizing 1-cochains as arrows interpolated at barycenters.

## 2024-01-14 (5h)

Added computation of barycentric differentials,
needed to construct Whitney interpolants for vector visualization.

## 2024-01-15 (3h)

Added barycentric Whitney interpolation
and arrow visualization using it.

## 2024-01-17 (4h)

Added frame timing control and interpolated rendering
to make simulations with various deltatime values animate smoothly
(in the case of higher dt than framerate)
and not too fast (in the case of lower dt than framerate).