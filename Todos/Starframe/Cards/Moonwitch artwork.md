Particle effects for this artwork will be done with Starframe.
What we need:

- [x] point lights
- [x] line renderer (port from dexterior)
- [x] 3D poses not strictly necessary but helpful
- [ ] sRGB albedo texture to reduce banding?
	- doesn't seem to do much of anything
- [x] unlit version of the shading pass
- [x] offset light volumes to the edge of the radius
- [x] fix the line renderer gap bug
- [ ] remove the dark edge of the clouds somehow (alpha threshold from material?)
- [ ] add specular component to lighting?
	- prefer full PBR since its parameters are easy to get from gltf
- [x] texture for the lines
- [x] make particles smaller as they orbit the staff
- [ ] reduce texture resolution