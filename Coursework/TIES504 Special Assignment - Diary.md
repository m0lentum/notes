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
but ended up working really nicely.