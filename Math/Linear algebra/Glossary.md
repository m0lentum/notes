# Glossary

## Vector operations

| name | notation | intuition | Finnish |
| - | - | - | - |
| Inner product / dot product | $\mathbf{a} \cdot \mathbf{b}$, $\langle \mathbf{a}, \mathbf{b} \rangle$, $\mathbf{a}^T\mathbf{b}$ | How much two vectors point in the same direction | Sisätulo / pistetulo |
| Outer product | | | Ulkotulo |
| Cross product | $\mathbf{a} \times \mathbf{b}$ | 3D vector perpendicular to both $\mathbf{a}$ and $\mathbf{b}$ with length equal to the parallelogram they define | Ristitulo |

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
| Kernel / Null space | $\text{Ker}(A)$, $\text{Null}(A)$ | Space of vectors mapped to zero by $A$ | |

## Matrix descriptors

| name | intuition | Finnish |
| - | - | - |
| Square | As many columns as rows | Neliö- |
| [[Matrices#Identity\|Identity]] | Multiplication doesn't change anything | Identiteetti- |
| [[Matrices#Diagonal\|Diagonal]] | Nonzero only on main diagonal | Diagonaali- |
| [[Matrices#Block diagonal\|Block diagonal]] | Diagonal, but entries are matrices | Lohkodiagonaali- |
| [[Matrices#Tri- Pentadiagonal\|Tri-/Pentadiagonal]] | Nonzero only on main and immediate side diagonals on both sides | Tri-/pentadiagonaali- |
| [[Matrices#Upper lower bidiagonal\|Upper/lower bidiagonal]] | Nonzero only on main and one side diagonal | Ylä-/alabidiagonaali- |
| [[Matrices#Upper lower triangular\|Upper/lower triangular]] | Nonzero only on main diagonal and above/below it | Ylä-/alakolmio- |
| [[Matrices#Orthogonal orthonormal\|Orthogonal / orthonormal]] | Column vectors are orthogonal and unit length | Ortogonaali- |
| Positive/negative definite | | Positiivi/negatiividefiniitti |
| Positive/negative semidefinite | | Positiivi/negatiivisemidefiniitti |

## Linear transformations

| name | intuition | Finnish |
| - | - | - |
| Scaling | Self-explanatory, represented by diagonal matrix | Skaalaus |
| Uniform scaling | Self-explanatory, can be represented by scalar | |
| Rotation | | Kierto |
| Isometry | Preserves distances - rotations, reflections, permutations | |
| Similarity | | |


## Matrix decompositions

| name | intuition | Finnish |
| - | - | - |
| Diagonalization | | Diagonalisointi |
| QR decomposition | Represents mapping from an arbitrary basis to an orthonormal one | QR-hajotelma |
| Singular value decomposition (SVD) | | Singulaariarvohajotelma |