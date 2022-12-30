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