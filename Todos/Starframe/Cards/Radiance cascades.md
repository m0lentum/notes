TODO:

- [x] clear cascade texture between frames (no need actually, that was a sync bug)
- [x] volumetrics
- [x] mip chain for the light texture for higher quality downsampling
   (might need volumetrics to work good since this would introduce transparency)
   - alternative idea: mip chain as quadtree to accelerate raymarching.
     what if far cascades never look as far down the tree as near ones?
- [x] refactor to not use RW storage textures so we can run on web
- [x] try interpolating nearest probes (direction-first ordering would be nice)
- [x] check the cascade count (seems there's one too few)
- [x] try generating SDF to accelerate raymarching
   (could this speed up enough to not need the mip chain?
     OTOH, do we want the mip chain to smooth things out?)
- [x] environment map
- [x] user-configurable parameter scaling
  - maybe also an alternative renderer with lower hardware requirements
- [x] ~~shadow casters should receive light themselves~~
  - this turned out really hard and can be alleviated by translucent materials
- [x] way to express directional lights and constant ambient light
  - directional lights could be baked into an environment map,
     ambient as a uniform to the mesh renderer
- [x] set up a profiler
- [x] try 2x ray count scaling instead of 4x
  - didn't work, although I might have done it wrong
- [ ] extend light texture a bit offscreen to make pop-in less abrupt
  - this should be configurable because need for it varies by scene
- [ ] anything clever we could do with the rgb values of the light texture mip chain?
- [x] raymarching only at mip level `cascade/2` seems to have very high quality, investigate
- [ ] bilinear / parallax fix (how do those work?) to alleviate haloing
- [x] dithering and/or tonemapping (?) to get rid of banding
  - turns out just a higher precision float texture does the trick
- [x] investigate removing cascade 0 and instead raymarching in the mesh shader
  - wouldn't save much time if at all since c0 is pretty cheap,
     but would save a good amount of memory and improve quality somewhat
  - turns out this actually saves time because it allows
     reducing probe spacing without a major loss in quality
- [ ] change light response depending on z coordinate
- [ ] far-field shader using only directional lights
- [x] try converting to a pixel shader
  - pretty big gains it turns out, especially since this enables hardware interpolation
- [ ] try computing only some of the cascades per frame
  for perf on low end hardware at the cost of lights only updating once every n frames
  - this would require storing all cascades separately
- [ ] indirect diffuse lighting by rendering lighting results as light sources?
  - this is probably difficult with my particular setup,
     definitely requiring some kind of translucent lights
	  (otherwise everything lit would become an opaque light source the next frame),
	 but would be really really cool
- [ ] volumetric lights?
  - this might be required to give fire a realistic range of color
  - would need two separate textures, one for lights one for occluders,
     but maybe that would also enable raymarching at higher mips only?
	 (since that way we could use transparency in the mips
	 like with volumetric occluders)
  - would potentially enable the previous bullet point (indirect light)
- [x] option to skip cascade 0 raymarching
  - this might be more effective at improving perf vs. quality
     after a point than increasing grid spacing