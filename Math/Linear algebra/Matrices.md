# Matrices

A matrix is, in general, just a 2D array of something.
Usually its elements are numbers (real or complex)
or expressions that evaluate to numbers.

## Notation

Typically matrices are named with capital letters
(sometimes bold to differentiate from scalar values).
Matrix _size_ and element coordinates are given
row first, so an $m \times n$ matrix has $m$ rows and $n$ columns.
$$
A = \begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
\end{bmatrix}
$$

## Operations & properties

### Multiplication

$$
C = AB \iff c_{ij} = a_{i*} \cdot b_{*j}
$$

### Inverse

$$
AA^{-1} = A^{-1}A = I
$$

### Transpose

$$
B = A^T \iff b_{ij} = a_{ji}$
$$

### Determinant

$$
\det(A) = \sum_{j=1}^n (-1)^{j+1} a_{1j}\det(A_{1j})
$$

### Trace

$$
\text{tr}(A) = \sum_{i=1}^n a_{ii}
$$

### Spectral radius

$$
\rho(A) = \max_{\lambda \in \sigma(A)} \lvert \lambda \rvert
$$

## Descriptors

Matrices of certain shapes have special names and properties.
Most of these apply to _square_ matrices (i.e. size $n \times n$)

### By structure

#### Diagonal

$$
D = \begin{bmatrix}
d_{11} & & \\
& d_{22} & \\
& & d_{33} \\
\end{bmatrix}
= \text{diag}(d_{11}, d_{22}, d_{33})
$$
- All elements outside of the main diagonal are zero
	- In other words, $a_{ij} = 0$ for $i \neq j$
- As a transformation, does only scaling
	- Scales by $D_{ii}$ in the $i$th coordinate direction
- Inverse of a diagonal matrix is a diagonal matrix with
  the inverse of each element
$$
D^{-1} = \begin{bmatrix}
\frac{1}{d_{11}} & & \\
& \frac{1}{d_{22}} & \\
& & \frac{1}{d_{33}} \\
\end{bmatrix}
$$

#### Block diagonal

$$
A = \begin{bmatrix}
A_{11} & & \\
& A_{22} & \\
& & A_{33} \\
\end{bmatrix}
= \text{diag}(A_{11}, A_{22}, A_{33})
$$

- as a system of equations, each block represents
  a system independent of all the other blocks

#### Tri-/Pentadiagonal

$$
A = \begin{bmatrix}
1 & 2 & & & \\
2 & 1 & 2 & & \\
& 2 & 1 & 2 & \\
& & 2 & 1 & 2 \\
& & & 2 & 1 \\
\end{bmatrix}
$$
- Only the main diagonals and the two/four adjacent diagonals
  have nonzero entries
	  - $a_{ij} = 0$ for $|j - i| > 1$
- Often seen in linear systems arising from
  finite difference discretization of [[Partial differential equations|PDEs]]

#### Upper/lower bidiagonal

$$
A = \begin{bmatrix}
1 & 2 & & \\
& 1 & 2 & \\
& & 1 & 2 \\
& & & 1 \\
\end{bmatrix}
$$
- $a_{ij} = 0$ if $j \neq i$ and ($j \neq i + 1$ (upper) or $j \neq i - 1$ (lower))

#### Upper/lower triangular

$$
U = \begin{bmatrix}
1 & 2 & 3 & 4 \\
& 1 & 2 & 3 \\
& & 1 & 2 \\
& & & 1 \\
\end{bmatrix}
$$
- All zeroes below/above the main diagonal
	- $a_{ij} = 0$ if $j < i$ (upper) or $j > i$ (lower)
* Often named $L$ for lower and $U$ for upper

#### Upper/lower Hessenberg

$$
U = \begin{bmatrix}
1 & 2 & 3 & 4 \\
2 & 1 & 2 & 3 \\
& 2 & 1 & 2 \\
& & 2 & 1 \\
\end{bmatrix}
$$
- All zeroes below/above the first subdiagonal
	- $a_{ij} = 0$ if $j < i-1$ (upper) or $j > i+1$ (lower)

### By effect

#### Identity
$$
I_{3x3} = \begin{bmatrix}
1 & & \\
& 1 & \\
& & 1 \\
\end{bmatrix}
$$
- $I = \{\delta_{ij}\}_{i,j = 1, \dots, n}$
	- $\delta_{ij}$ is the _Kronecker delta_
- _Multiplicative_ identity, i.e. $IA = AI = A$ for any matrix $A$
- $I^{-1} = I$
- As a transformation, does not move anything

#### Orthogonal / orthonormal

- $Q^TQ = QQ^T = I$
	- alternatively, $Q^T = Q^{-1}$
- columns and rows are orthogonal unit vectors
- represents an [[Isometry|isometry]] transformation
- determinant is always -1 or 1

## Sources

Book: Saad, Y. (2003). Iterative Methods for Sparse Linear Systems.
