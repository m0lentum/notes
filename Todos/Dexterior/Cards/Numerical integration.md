What do we need to do this in a general way?

0-cochains are obvious, just evaluate the function at a point.

For 1-cochains we can use [Gaussian quadratures](https://en.wikipedia.org/wiki/Gaussian_quadrature).
We could provide a few different orders
so the user can pick whatever is accurate enough for their use case.

What about surfaces and volumes?
Dual cells can be expressed as a sum of simplices,
so it would suffice to get a formula for an $n$-simplex,
but does such a thing exist in any general sense?
Seems they do exist, but more research needed