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