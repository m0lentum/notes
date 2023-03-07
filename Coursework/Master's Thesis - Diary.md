Started writing this diary a bit late; initially didn't mean to at all
but I felt like I was forgetting things and struggling to stay focused
and thought this might help.

## Summary of September 2020 (20h)

Read Räbinä's PhD thesis on solving the Maxwell equations.
Got a vague intuitive idea of meshes, dual meshes, Hodge operators,
the controllability method etc.

Spent a lot of time browsing the internet trying to understand the
adjoint state method. I get the algebraic proof using the Lagrangian,
but I'm still having trouble getting an intuitive understanding of what
this is doing.

## 2022-10-03 (2h)

Reading some more about the adjoint state method, also took a detour to read
a bit of a more recent paper by Räbinä et al. which didn't turn out to
be very useful for me right now. Starting to get the idea a bit (writing about it
in the [[Scratchpad]] note for now), but still a little hazy.

## 2022-10-04 (1.5h)

Working through the derivation for the adjoint state equation
by writing it down step by step, helped a bit to understand where it comes
from but still struggling to visualize it.
Should move on from this topic for now I think.

## 2022-10-08 (2h)

Reading about weak formulations of PDEs. I have a basic understanding
of what they are now, but didn't get far enough to actually derive
it for our wave equation yet.

## 2022-10-10 (2.5h)

Looked at test problems (problems with known solutions for testing
implementations) a bit, then digressed into reading more about
differential forms. This intro paper on them is very good,
will finish reading it tomorrow and get back to what I was doing.

## 2022-10-11 (2h)

Finished reading the intro paper on differential forms. Learned a lot
about what they are, why they can be used to generate an exact discretization,
what exactly the exterior derivative and Hodge star do, etc.
Will have to return to this another day to finish writing down notes.

## 2022-10-12 (2h)

Got Räbinä's code examples compiling and running on my machine
and spent some time going over documents to talk about at tomorrow's meeting.

## 2022-10-14 (3h)

Started looking into the code example from Jonni and putting together a
vim C++ setup, but quickly got sidetracked into trying out Papis
for bibliography management. Concluded it wasn't as good as Zotero.

## 2022-10-18 (2.5h)

Continuing to look over the example code, more or less understand it now.
I'll try to write some code of my own next time.

## 2022-10-20 (2h)

Started writing an answer to Jonni's exercise, not quite sure how
the Hodge star works w.r.t. vector calculus differential operators
but getting the hang of using the GFD library.

## 2022-10-21 (2h)

Reorganized my work into a different repo outside of gfd
and finished Jonni's exercise.

## 2022-11-05 (3h)

Had to take some time away to focus on the research methods course.
Getting back to this now, looking at numerical integration a bit
and starting to work on the wave problem for the actual thesis.

## 2022-11-06 (5h)

Working on a differential form formulation of the Helmholtz equation.

## 2022-11-08 (4h)

Working through discretization of the equations,
got the spatial part done.

## 2022-11-09 (1.5h)

Time discretization done. Some more detail to go
but I should be able to get coding again in a bit.

## 2022-12-04 (5h)

Some reading about PyDEC, followed by a whole bunch of
wrestling with Nix trying to install it. It's pretty old
and I couldn't get a Nix build to work, probably just
going to use it from a git submodule.

## 2022-12-05 (3h)

Got Joona's PyDEC examples running!

## 2022-12-06 (3h)

Digging around in the example code and PyDEC's sources
to try and figure out what's going on. Had trouble
focusing today and didn't get as much done as I hoped.

## 2022-12-12 (3h)

Refactoring Joona's mesh generating code a bit to figure out
what it does and make it easier to read.
Starting out a basic test case with leapfrog time discretization
and Dirichlet boundary conditions.

## 2022-12-13 (1h)

Wrote down the equations being solved in the first test case.
Bit of a poor focus tonight, didn't get much done.

## 2022-12-21 (4h)

Lots of trouble focusing lately, took a week to get back to
this at all. Getting started with actually coding the
leapfrog-Dirichlet test case, finally making some decent progress now.

## 2022-12-22 (2h)

Sketched out time stepping, some todos left to figure out
but the structure of the code is there now.

## 2022-12-27 (6h)

Fixed a few things, spent some time wrestling with matplotlib,
and got an animated wave that very much looks correct!
Unsure about the physical interpretations of the variables though,
will need to ask advisors about that, but happy I seem to have
gotten my math right.

## 2022-12-28 (6h)

Made an abstraction for animated simulations, added a second vibrating
membrane simulation with different initial conditions, wrote an email.

## 2022-12-30 (5h)

Studying the derivation of the wave equation and its
velocity potential formulation; wrote [[Wave equation]]

## 2022-12-31 (7h)

Working on the theory of test problems, particularly
trying to understand the circular scatterer problem.

## 2023-01-01 (3h)

Reading a bit of the source for the Engquist-Majda boundary condition
and thinking more about the circular scatterer problem.

## 2023-01-06 (6h)

Studied the Mur transition, finished up my notes on the circular
scatterer case (for now), implemented a mesh generator for that case.

## 2023-01-07 (4h)

Begun implementing the circular scatterer case. Setting initial
values for the vector-valued velocity variable is a little tricky
(requires integration), going to take some time.

## 2023-01-08 (2h)

Sketched a full implementation of the circular scatterer
implementation with TODOs where integration for velocity values
and the absorbing boundary conditions would go.

## 2023-01-09 (3h)

Worked out the line integral to compute values of $W$ from the
incoming wave and implemented the boundary condition on the inner edge.

## 2023-01-13 (2h)

Looking into the absorbing boundary condition, having trouble
understanding how the dot product works in the DEC.

## 2023-01-14 (3h)

Spent some time getting confused by the dot product in the
absorbing boundary condition, wrote an email about it,
and then read some papers for a while.

## 2023-01-15 (4h)

Browsing some differential geometry textbooks.

## 2023-01-16 (2h)

Reading a bit more and thinking about the accuracy test case with known solution.

## 2023-01-17 (4h)

Implemented the simulation part of the accuracy test with known solution,
now just need to do the measuring part.

## 2023-01-19 (3h)

Added mesh refinement and error measurement to the accuracy test.

## 2023-01-20 (3h)

Reading a paper that has an example of a boundary condition involving the normal
direction. Didn't quite understand it yet, but the basic idea is to use fluxes across
edges instead of along edges.

## 2023-01-22 (6h)

Read more about the flux idea, sent some emails, found out I need to do
an assignment for the seminar by tomorrow, frantically started doing that.

## 2023-01-25 (3h)

Reading some more about fluxes, flat operators and such.

## 2023-01-26 (2h)

Reading the [SIGGRAPH 2013 course notes on DEC](https://doi.org/10.1145/2504435.2504442).
Extremely good stuff, probably worth reading through the whole thing.

## 2023-01-28 (2.5h)

Watched the first couple hours of the lectures from the aforementioned
SIGGRAPH course and read some more of the notes.

## 2023-01-29 (6h)

Finished the SIGGRAPH course lectures and started working
on formulating the wave equations using fluxes.
Some confusion regarding the relationship between
boundary conditions and the dual mesh.

## 2023-01-30 (5h)

Refactoring code to support visualizing values other than 0-forms,
trying to implement the accuracy test case using fluxes,
having trouble getting it right.

## 2023-01-31 (2h)

Trying to narrow down where the problem is with the flux implementation,
found some errors in my math but it's still not working.

## 2023-02-01 (2h)

Reading about Whitney forms for interpolating 1-forms,
being confused a lot, but I think I kind of get it now.

## 2023-02-02 (6.5h)

Trying to wrap my head around [[Whitney form]] still, mostly
figured them out now but still haven't entirely grokked
what the gradient of a [[Barycentric coordinates]] is.

## 2023-02-03 (5h)

Finished my notes on Whitney forms, then realized PyDEC
implements them so I didn't even need those. Oh well.
Made a velocity visualizer and got back to debugging.

## 2023-02-07 (4.5h)

Intense debugging, found problems with my integration
as well as time stepping and got the accuracy test to work!
TODO: the signs on the matrices don't match my math, why?

## 2023-02-08 (2h)

Worked out why the signs on my math didn't match the signs
in the code. Two different mistakes, one on each equation -
had divergence backwards and an extra minus on the inverse Hodge star
(which already includes a minus sign inside of it).

## 2023-02-11 (5h)

Implemented the circle scatterer case with the flux representation
and added the absorbing boundary condition.

## 2023-02-18 (6h)

Writing a research plan for the seminar and gathering references.
(actually done in many small sessions throughout the week)

## 2023-02-19 (3h)

Looking through sources and talking about them in the research plan.

## 2023-02-23 (4h)

Some emailing, reading method sources, writing more research plan.

## 2023-02-24 (4h)

Finished the research plan.

## 2023-03-06 (3h)

Starting to work out the adjoint state equation for exact controllability.

## 2023-03-07 (3h)

Got a bit carried away messing with vim and tex snippets,
but got some more work done on the adjoint state equation.