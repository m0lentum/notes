This can probably be done the exact same way I do it in Krita, by drawing the texture over top with soft light blending and low opacity.

Krita soft light blend function:
```cpp
template<class T>

inline T cfSoftLightSvg(T src, T dst) {

  using namespace Arithmetic;

  qreal fsrc = scale<qreal>(src);
  qreal fdst = scale<qreal>(dst);

  if(fsrc > 0.5) {
    qreal D = (fdst > 0.25) ? sqrt(fdst) : ((16.0*fdst - 12.0)*fdst + 4.0)*fdst;
	return scale<T>(fdst + (2.0*fsrc - 1.0) * (D - fdst));
  }

  return scale<T>(fdst - (1.0 - 2.0 * fsrc) * fdst * (1.0 - fdst));
}
```