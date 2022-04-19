# TIES581 Numerical linear algebra

Self study course administered by Raino Mäkinen. [Materials](http://users.jyu.fi/~rainom/numlin/)

This is a learning diary documenting my study sessions and what I learned each time.

## 2022-01-28 (1h)

Started reading the first chapter of Iterative Methods for Sparse Linear
Systems (henceforth called the linear systems book). It glosses over some
details and operates in complex vector spaces which I don't really understand,
but for the most part I know enough about real matrix math to follow.

The part linking QR factorization and the process of orthonormalization
(Gram-Schmidt / Householder algorithms) made QR factorization click for me. I
never really intuited when and why it exists and what its geometric meaning is
before.

## 2022-02-01 (4h)

Setting up note-taking with Obsidian and writing down a lot of basic
information about [[Matrices|matrices]], using the first chapter of the linear
systems book as primary source. I'm only just getting started with this note
collection so I'm writing a lot about things I already knew before, but having
this information written down is going to come in handy in years to come.

I'm going through all the types of [[Matrices#Descriptors|special matrices]]
like diagonal, triangular, orthogonal etc., writing down their definitions and
thinking about their effects as linear transformations.

## 2022-02-02 (3h)

Continuing what I did yesterday, adding more words to my [[Glossary]]
and revising the basics.

## 2022-02-03 (3h)

Read the rest of chapter 1 of the linear systems book. A lot of interesting
theorems, but unclear at this point how useful they will be on this course. I
would need to brush up on my eigenvalue knowledge and learn complex numbers to
fully understand all of this, but that doesn't seem worth doing right now.

## 2022-02-05 (2h)

Skimmed through chapter 2 of the linear systems book (even though it's not part
of the course) because I'm interested in PDEs. Very similar content to the PDE
solvers course here at JYU. Also skimmed through the graph representations and
permutations part of chapter 3. Graph theory is very interesting, but for now
I'm skipping the details to try and get an overview of all the materials quickly.

## 2022-04-13 (1h)

I've been away for a while, for many reasons. I now really appreciate having
this diary, as it made it easy to check back on what I had learned at the
start of the year.

Finished chapter 3 of the linear systems book, particularly the part about
data structures for memory-efficient sparse matrix representations.
I recall the coordinate form from earlier courses, but the others were new.
Some interesting similarities to general compression methods, such as using
pointers to addresses of matrix rows, which feels a lot like run-length
encoding.

I don't quite understand the orderings related to direct solution methods,
but I'll come back to this later if I feel it's important.

## 2022-04-14 (1h)

Skimmed through chapter 4 of the linear systems book for a quick refresher on
iterative methods. Jacobi, Gauss-Seidel, Successive Over-Relaxation.
Also started ch. 5 and got the basic gist of what a projection method is.

## 2022-04-19 (2h)

Reading chapter 5 in more detail since I'm pretty sure this will be relevant
when getting into Krylov subspaces, which are the most important topic
on the course as far as I understand. Some of the error analysis is a little
over my head, but I understand the basic idea of considering how projectors
act on the residual.

Cool insight that helped me understand a proof: if a matrix is unitarily
similar to a diagonal matrix, $A = Q^TDQ$, then the elements of $D$ are the
eigenvalues of $A$. (Recalling from chapter 1 that similarity means
eigenvalues are preserved in the transformation.)