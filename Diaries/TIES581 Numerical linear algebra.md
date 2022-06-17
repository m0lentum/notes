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
when getting into Krylov subspaces, which I believe are the most important
topic on the course. Some of the error analysis is a little over my head,
but I understand the basic idea of considering how projectors act on the residual.

Cool insight that helped me understand a proof: if a matrix is unitarily
similar to a diagonal matrix, $A = Q^TDQ$, then the diagonal elements of $D$ are the
eigenvalues of $A$. (Recalling from chapter 1 that similarity means
eigenvalues are preserved in the transformation.)

## 2022-04-20 (1h)

Finished chapter 5. While I don't remember the theory of projectors
(maybe I should re-read chapter 1 later) well enough to understand why e.g.
$P_i = AV_i((AV_i)^TAV_i)^{-1}(AV_i)^T$ is an orthogonal projector (this is just given as a fact),
the comparison to the Jacobi method which I already understand was very helpful.
I feel like I have a decent grasp of what projection methods do.

## 2022-05-01 (2h)

Looking into Krylov subspaces (chapter 6). I understand what a Krylov
subspace is, but haven't yet quite grokked what the Arnoldi method
does with the orthonormal basis it generates. Too tired to figure it out now.

## 2022-05-12 (1.5h)

Reading some more about Krylov subspaces, trying to get some intuition.
I now understand the connection to polynomials ([[Systems of equations#Krylov subspace methods|notes]])
which feels like it will be important to analyzing the performance of these methods.

For the project work, I should probably implement and compare the different variants
of the Arnoldi method using different orthonormalization techniques.
I don't quite understand the Householder method, will have to look back into
chapter 1 to figure that one out.

## 2022-05-16 (2h)

Made it to the Full Orthogonalization Method and read through it many times
to try and figure out how it works intuitively/geometrically.
Also wrote down a bunch of notes (link under previous diary entry)
trying to explain to myself what each matrix involved represents.
Still a bit hazy on some details, but I figured out a lot today.

## 2022-05-17 (1h)

Read about the different variants of FOM (restarted, incomplete) and
the Generalized Minimum Residual method (GMRES). Bit of a tired day
and I didn't get all the details, but I understand the basic gist
and the advantages and drawbacks of each variant.

## 2022-05-18 (1h)

Skimming ahead to see how many methods the book covers
and thinking about what to do for project work.
I'll probably do a Jupyter notebook, since that lets me
put a bunch of implementations and analyses in one place.

## 2022-05-19 (3h)

Took a quick detour into [IHaskell](https://github.com/IHaskell/IHaskell)
to see if I could use it as a Jupyter Notebook variant with a more pleasant
language. Decided I should use Python for easier comparison with NumPy
and easier evaluation by the teacher, and set up a notebook.
Spent a bunch more time fiddling with a Vim integration for sane editing.

## 2022-05-23 (1.5h)

Sketching the beginnings of the project, starting with a basic implementation
of FOM. Revising basics of NumPy.

## 2022-05-29 (5h)

Looked for matrices to test with, found [Matrix Market](https://math.nist.gov/MatrixMarket/).
Got FOM more or less working. Got annoyed with NumPy a bunch along the way.

## 2022-06-04 (3h)

Mostly a Python programming exercise today - wrote a little test runner
and pretty-printer for analyzing results. Also implemented restarting
for FOM and found that it doesn't currently work correctly.
Next session will be debugging that.

## 2022-06-06 (2h)

Debugging FOM, got it working. The main problem was accidentally taking a row
of a vector where I should have taken a column at the end of the loop.
Also came across a couple of degenerate cases, one where the Krylov subspace
is larger than the original matrix and one where the algorithm diverges to
infinity, and added handling for those. Now it runs all my test cases without
crashing, and is able to solve all but one of them successfully.

## 2022-06-07 (1h)

Reading up on DIOM. I'm having trouble understanding why the LU factorization
of the Hessenberg matrix behaves the way it does. Too tired to figure it out tonight.

## 2022-06-12 (1.5h)

Back to figuring out DIOM, with some digressions into Wikipedia matrix articles
along the way. I was confused by the formula for the vector $z_m$, but
eventually realized it's simply the solution of  $L_mz_m = \beta e_1$
using forward substitution. I now think I understand every part except how to
produce the LU factorization of $H_m$ (line 5 of algorithm 6.8 in Saad 2003).

## 2022-06-13 (3h)

Wrote a bit about FOM and started implementing DIOM.
Nothing much to report this time.

## 2022-06-14 (3h)

Sketched all of DIOM except the part where the LU factorization is updated.
I don't know how to do that yet; will need to do some research next time.
Found out Python has a built-in `deque` construct which is nice for this.

## 2022-06-15 (2.5h)

Derived the LU factorization part of DIOM with the help of Wikipedia.
Not entirely working yet, I'm dividing by zero somewhere.
More debugging next time.

## 2022-06-17 (3h)

Debugging DIOM. Found some issues with the first iteration being wrong
and some indices being a bit off. Most importantly, realized I had overlooked
some elements in the LU factorization. Didn't quite get it working yet,
too tired to keep staring at all these indices right now.