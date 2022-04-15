Steps I have in mind:

1. separating axis depth test for just the inner polygons,
   ignoring for now the possible axis from a circular corner
   (add sum of swept circles to depth)
2. Get the closest edges to the axis of closest separation,
   expanded out to the actual outer edge, and clip them
   (or if one of the shapes is a circle, skip to 5.)
3. If clip found a two-point contact, stop there
4. From the **inner** polygon, get the endpoint of the incident edge
   and the closest point to that on the owning edge
5. If the edges didn't intersect, do a circle-circle collision
   check between them and return the result
6. If the edges did intersect (will happen when neither shape
   has a circle component or in rare cases otherwise),
   get the endpoint of the incident edge plus r \* axis

This works! Couple of todos:

- [x] moments of inertia
- [ ] spherecasts (need work on spatial index traversal,
      shape query itself is almost trivial)

Deriving polar second moment of area around origin,
using Green's formula to compute it as a line integral

$$
J_{xy} = \iint_{D}(x^2 + y^2) =
\frac{1}{3}\oint_{\partial D}(-y^3dx + x^3dy)\,dt
$$

Circle caps:
For each cap $C_k$, $k = 1,\dots,n$, $n$ = number of points,

$$
(x, y) = C_k(t) = (x_k + r\cos(t), y_k + r\sin(t)),\quad t\in[\alpha_k, \alpha_{k+1}]
$$

$$
(dx, dy) = C_k'(t) = (-r\sin(t), r\cos(t))
$$

$$
J_x = \frac{1}{3}\oint_{C_k} (-y^3dx + x^3dy)\,dt
= \frac{1}{3}\int_{\alpha_k}^{\alpha_{k+1}} r\sin(t)(y_k + r\sin(t))^3
+ r\cos(t)(x_k + r\cos(t))^3
$$

Let's just do the first expression, this gets real messy but I think
there will be some cancellation when going over the full circle.

$$
\begin{align*}
J_k &= \frac{1}{3}\int_{\alpha_k}^{\alpha_{k+1}} r\sin(t)(y_k + r\sin(t))^3 \\
&= \frac{1}{3} \Big[
\frac{3r^4t}{8} - \frac{1}{4}r^4\sin(2t) + \frac{1}{32}r^4\sin(4t) \\
&\qquad- \frac{9}{4}r^3y_k\cos(t) + \frac{1}{4}r^3y_k\cos(3t) + \frac{3}{2}r^2ty_k^2
- \frac{3}{4}r^2y_k^2 \sin(2t) - ry^3\cos(t)
\Big]_{t=\alpha_k}^{t=\alpha_{k+1}} \\
\end{align*}
$$

First three terms will disappear going around the full circle.
Rest of the terms will occur with several different combinations
of $\alpha$ and $y$, e.g.

$$
\frac{1}{4}r^3\Big(
y_{k-1}(\cos(3\alpha_k) - \cos(3\alpha_{k-1}))
+ y_k(\cos(3\alpha_{k+1}) - \cos(3\alpha_k))
+ y_{k+1}(\cos(3\alpha_{k+2}) - \cos(3\alpha_{k+1}))\Big)
$$

Expressing this and the other terms as a sum over all circle segments:

$$
\begin{align*}
\frac{1}{3}\sum_{k=1}^n &\Big(
-\frac{9}{4}r^3y_k(\cos(\alpha_{k+1}) - \cos(\alpha_k)) \\
&+ \frac{1}{4}r^3y_k(\cos(3\alpha_{k+1}) - \cos(3\alpha_k)) \\
&+ \frac{3}{2}r^2y_k^2 (\alpha_{k+1} - \alpha_k) \\
&- \frac{3}{4}r^2y_k^2 (\sin(\alpha_{k+1}) - \sin(\alpha_k)) \\
&- ry_k^3(\cos(\alpha_{k+1}) - \cos(\alpha_k))
\Big)
\end{align*}
$$

Now let's do the same for the second sum term in the integral
and see if this will simplify any further.

$$
\begin{align*}
\frac{1}{3}\sum_{k=1}^n &\Big(
\frac{9}{4}r^3x_k(\sin(\alpha_{k+1}) - \sin(\alpha_k)) \\
&+ \frac{1}{4}r^3x_k(\sin(3\alpha_{k+1}) - \sin(3\alpha_k)) \\
&+ \frac{3}{2}r^2x_k^2 (\alpha_{k+1} - \alpha_k) \\
&+ \frac{3}{4}r^2x_k^2 (\sin(2\alpha_{k+1}) - \sin(2\alpha_k)) \\
&+ rx_k^3(\sin(\alpha_{k+1}) - \sin(\alpha_k))
\Big)
\end{align*}
$$

Both combined to the full formula (with $\frac{1}{3}$ multiplied in):

$$
\begin{align*}
\sum_{k=1}^n &\Big(
\frac{3}{4}r^3(x_k(\sin(\alpha_{k+1}) - \sin(\alpha_k)) - y_k(\cos(\alpha_{k+1}) - \cos(\alpha_k))) \\
&+ \frac{1}{12}r^3(x_k(\sin(3\alpha_{k+1}) - \sin(3\alpha_k)) + y_k(\cos(3\alpha_{k+1}) - \cos(3\alpha_k))) \\
&+ \frac{1}{2}r^2(x_k^2 + y_k^2)(\alpha_{k+1} - \alpha_k) \\
&+ \frac{1}{4}r^2(x_k^2(\sin(2\alpha_{k+1}) - \sin(2\alpha_k)) - y_k^2(\sin(\alpha_{k+1}) - \sin(\alpha_k))) \\
&+ \frac{1}{3}r(x_k^3(\sin(\alpha_{k+1}) - \sin(\alpha_k))) - y_k^3(\cos(\alpha_{k+1}) - \cos(\alpha_k)))
\Big)
\end{align*}
$$

If we use double-/triple-angle formulae to simplify to sins and cos's of single
$\alpha$s, we can use edge normals without computing any angles 🤔 This
shouldn't be done for polygons where the angles are known in advance because we
can set all the angle terms as constants, but maybe useful for irregular
polygons whenever I implement those 🤔

That's the part of the integral for the circle caps.
For edges $E_k$ with starting point $(x_k, y_k)$, direction $(dx_k, dy_k)$ and
length $l_k$ (there are $n$ of them, same as amount of points):

$$
\begin{align*}
&\oint_{E_k} (-\frac{1}{3}y^3dx_k + \frac{1}{3}x^3dy_k)\,dt \\
&= \frac{1}{3} \int_0^{l_k} (-(y_k + tdy_k)^3dx_k + (x_k + tdx_k)^3dy_k)\,dt \\
&\text{If $dx_k, dy_k \neq 0$:} \\
&= \frac{1}{3}\Big[-\frac{dx_k}{4dy_k}(y_k + tdy_k)^4 + \frac{dy_k}{4dx_k}(x_k + tdx_k)^4\Big]_{t=0}^{t=l_k} \\
&= \frac{1}{12}\Big(\frac{dx_k}{dy_k}(y_k^4 - (y_k + l_kdy_k)^4)
+ \frac{dy_k}{dx_k}((x_k + l_kdx_k)^4 - x_k^4)\Big)
\end{align*}
$$

If $dx_k = 0$ or $dy_k = 0$, the term where $t$ is multiplied by it turns into
just $-\frac{1}{3}y_k^3 dx_k$ or $\frac{1}{3}x_k^3 dy_k$ (dx or dy is either 1 or -1)
and the integral for that edge is that times $l_k$.

Remember that $x_k, y_k$ here aren't the same as $x_k, y_k$ on the circle caps,
these are now on the outer edge.

If $r = 0$ (just a polygon), this should simplify to the formula on
[wikipedia](https://en.wikipedia.org/wiki/Second_moment_of_area#Any_polygon),

$$
J_{xy} = \frac{1}{24}\sum_{i=1}^n (x_iy_{i+1} - x_{i+1}y_i)
(x_iy_{i+1} + 2x_iy_i + 2x_{i+1}y_{i+1} + x_{i+1}y_i)
$$

It's a bit hard to verify this since this doesn't use direction at all
and mine does, but at least the degree of the polynomial checks out.
