Instanced line rendering as per [this blog post](https://wwwtyro.net/2019/11/18/instanced-lines.html).
TODOs:
- [ ] circle joins should have adaptable resolution
- [x] arrow caps
	- note: the line segment needs to be shortened
	    to have the arrow tip land at the end point
- [x] configure type of cap (including none)
- [x] flat colors
- [ ] colormapped colors
- [ ] cacheable buffers for drawing the same thing every frame

This could also be used to render a somewhat nicer wireframe