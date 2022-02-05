# Glossary

## Vector operations

| name | notation | intuition | Finnish |
| - | - | - | - |
| Inner product / dot product | $\mathbf{a} \cdot \mathbf{b}$, $\langle \mathbf{a}, \mathbf{b} \rangle$, $\mathbf{a}^T\mathbf{b}$ | How much two vectors point in the same direction | Sisätulo / pistetulo |
| Outer product | $\mathbf{a}\mathbf{b}^T$ | | Ulkotulo |
| Cross product | $\mathbf{a} \times \mathbf{b}$ | 3D vector perpendicular to both $\mathbf{a}$ and $\mathbf{b}$ with length equal to the parallelogram they define | Ristitulo |
| Norm | $\|\mathbf{a}\|$ | Some measure of length/magnitude | Normi |
| Euclidean norm / $l_2$ norm | $\sqrt{\mathbf{a} \cdot \mathbf{a}}$ | Conventional length | Euklidinen normi |
| Normalization | $\hat{\mathbf{a}} = \frac{1}{\|\mathbf{a}\|}\mathbf{a}$ | Make $\mathbf{a}$ unit length | Normalisointi |
| Projection (onto) | $\text{proj}_b(\mathbf{a}) = (\mathbf{a} \cdot \hat{\mathbf{b}})\hat{\mathbf{b}} = \frac{\mathbf{a} \cdot \mathbf{b}}{\mathbf{b} \cdot \mathbf{b}}\mathbf{b}$ | Closest point to $\mathbf{a}$ on the line defined by $\mathbf{b}$ | Projektio |

## Vector descriptors

| name | notation | intuition | Finnish |
| - | - | - | - |
| Orthogonal (to) | $\mathbf{a} \perp \mathbf{b}$ | Perpendicular (but more general); zero dot product | Ortogonaalinen |
| Parallel (with) | $\mathbf{a} \parallel \mathbf{b}$ | Both define the same line | Yhdensuuntainen |
| Unit length / Unit- | $\hat{\mathbf{a}}$ | Norm is one | Yksikkö- |
| Column- | $A_{*j}$, $\mathbf{a}$ (assumed by default for vectors) | Is a column of a matrix | Sarake- |
| Row- | $A_{i*}$, $\mathbf{a}^T$ | Is a row of a matrix | Rivi- |

## Vector spaces 

| term | intuition | Finnish |
| - | - | - |
| Linear combination | Sum of vectors multiplied by scalars, $x_1\mathbf{v}_1 + x_2\mathbf{v}_2 + \dots$ | Lineaarikombinaatio |
| Linear span | Set of all linear combinations of a set of vectors | Lineaarinen verho |
| Linearly independent (LI) set | Set where no vector is a linear combination of others | Lineaarisesti riippumaton joukko |
| Vector space | | Vektoriavaruus |
| Subspace | Lines, planes etc (through the origin); set of vectors that contains all linear combinations of vectors in it | Aliavaruus |
| Basis | Set of LI vectors that span a subspace | Kanta |
| Orthonormal basis | Basis where all vectors are unit length and orthogonal to all other vectors | Ortonormaali kanta |
| Dimension | Number of vectors in a basis of a subspace | Dimensio |
| Orthogonal complement | Notation $S^{\perp}$; subspace of vectors orthogonal to every vector in subspace $S$ | Ortogonaalikomplementti |

## Matrix operations & properties

| name | notation | intuition | Finnish |
| - | - | - | - |
| [[Matrices#Multiplication\|Multiplication]] | $AB$ | Composed transformation $B \rightarrow A$ | Kertolasku |
| [[Matrices#Inverse\|Inverse]] | $A^{-1}$ | Transformation that reverts $A$ | Käänteismatriisi |
| [[Matrices#Transpose\|Transpose]] | $A^T$ | Turns columns to rows | Transpoosi |
| Conjugate transpose | $A^H$, $A^*$ | Transpose + take the complex conjugate | |
| [[Matrices#Determinant\|Determinant]] | $\det(A)$ | How much the transformation scales volumes | Determinantti |
| [[Matrices#Trace\|Trace]] | $\text{tr}(A)$ | Sum of main diagonal entries | |
| [[Matrices#Spectral radius\|Spectral radius]] | $\rho(A)$ | Largest eigenvalue | |
| Range | $\text{Ran}(A)$ | Space of vectors reachable by multiplying with $A$; span of column vectors | |
| Rank | $\text{rank}(A)$ | Dimension of range; number of linearly independent column vectors | Aste |
| Kernel / Null space | $\text{Ker}(A)$, $\text{Null}(A)$ | Space of vectors mapped to zero by $A$ | |
| Eigenvector | | Vector that is only scaled by the matrix | Ominaisvektori |
| Eigenvalue | $\lambda_i$ | Scaling factor on the corresponding eigenvector | Ominaisarvo |
| Singular value | $\sigma_i$ | Square root of an eigenvalue of $AA^T$, exists for non-square matrices | Singulaariarvo |
| Norm | $\|\mathbf{a}\|$ | Some measure of how much the matrix scales vectors | Normi |

## Matrix descriptors

| name | intuition | Finnish |
| - | - | - |
| Square | As many columns as rows | Neliö- |
| Singular | Does not have an inverse, determinant is 0 | |
| Symmetric | Mirror symmetry wrt main diagonal; $A = A^T$ | Symmetrinen |
| Hermitian | Complex matrix that behaves like a symmetric real matrix; $A = A^H$ | |
| [[Matrices#Identity\|Identity]] | Multiplication doesn't change anything | Identiteetti- |
| [[Matrices#Diagonal\|Diagonal]] | Nonzero only on main diagonal | Diagonaali- |
| [[Matrices#Block diagonal\|Block diagonal]] | Diagonal, but entries are matrices | Lohkodiagonaali- |
| [[Matrices#Tri- Pentadiagonal\|Tri-/Pentadiagonal]] | Nonzero only on main and immediate side diagonals on both sides | Tri-/pentadiagonaali- |
| [[Matrices#Upper lower bidiagonal\|Upper/lower bidiagonal]] | Nonzero only on main and one side diagonal | Ylä-/alabidiagonaali- |
| [[Matrices#Upper lower triangular\|Upper/lower triangular]] | Nonzero only on main diagonal and above/below it | Ylä-/alakolmio- |
| [[Matrices#Orthogonal orthonormal\|Orthogonal / orthonormal]] | Column vectors are orthogonal and unit length | Ortogonaali- |
| Unitary | Orthogonal, but for complex matrices | |
| Normal | Eigenvectors form an orthonormal basis | Normaali |
| Positive/negative definite | Any transformed vector is turned less than (pos.) / more than (neg.) 90° | Positiivi/negatiividefiniitti |
| Positive/negative semidefinite | Like pos./neg. definite, but can turn exactly 90° | Positiivi/negatiivisemidefiniitti |
| Similar (to $B$) | Has the same eigenvalues as $B$, $A = XBX^{-1}$ ($X$ any nonsingular matrix) | Similaari |
| Unitarily similar | Similar + $X$ is unitary; eigenvectors' length doesn't change | |
| Projector | Maps vectors to some subspace and does nothing to vectors already in that subspace | |
| Permutation | Changes the order of rows or columns without touching values | Permutaatio |
| Sparse | Mostly zeroes; benefits from special numerical methods for sparse matrices | Harva |
| Dense | Not sparse | Tiheä |

## Linear transformations

| name | intuition | Finnish |
| - | - | - |
| Scaling | Self-explanatory, represented by diagonal matrix | Skaalaus |
| Uniform scaling | Self-explanatory, can be represented by scalar | |
| Rotation | | Kierto |
| Reflection | | Heijastus |
| Isometry | Preserves distances - e.g. rotations, reflections, permutations | |
| Similarity | Preserves proportions between distances (i.e. eigenvalues) - isometry + uniform scaling | |


## Matrix decompositions

| name | definition | intuition | Finnish |
| - | - | - | - |
| Diagonalization | $A = XDX^{-1}$, $D$ diagonal | Change basis, scale, change basis back | Diagonalisointi |
| LU decomposition | $A = LU$, $L$ lower diag., $U$ upper diag. | Lets you do single-pass Gaussian elimination on a linear system | LU-hajotelma |
| Cholesky decomposition | $A = LL^T$, $L$ lower diag. | Special case of LU decomposition for symmetric positive definite matrices | Choleskyn hajotelma |
| QR decomposition | $A = QR$, $Q$ orthogonal, $R$ upper triangular | Maps from an arbitrary basis to an orthonormal one | QR-hajotelma |
| Singular value decomposition (SVD) | | | Singulaariarvohajotelma |
| Jordan canonical form | $X^{-1}AX = J$, $J$ block diagonal | | |
| Schur canonical form | $Q^HAQ = R$, $Q$ unitary, $R$ upper triangular | Same idea as QR decomposition, but exists for all square matrices | |
