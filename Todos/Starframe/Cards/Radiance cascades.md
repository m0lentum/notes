Done by 2024-09-28:

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
- [x] anything clever we could do with the rgb values of the light texture mip chain?
	- nah, using the alpha for volumetrics instead
- [x] raymarching only at mip level `cascade/2` seems to have very high quality, investigate
- [x] dithering and/or tonemapping (?) to get rid of banding
  - turns out just a higher precision float texture does the trick
- [x] investigate removing cascade 0 and instead raymarching in the mesh shader
  - wouldn't save much time if at all since c0 is pretty cheap,
     but would save a good amount of memory and improve quality somewhat
  - turns out this actually saves time because it allows
     reducing probe spacing without a major loss in quality
- [x] try converting to a pixel shader
  - pretty big gains it turns out, especially since this enables hardware interpolation
- [x] more realistic volumetrics + emissive translucent materials
  - required (for instance) to give fire a realistic range of color
- [x] option to skip cascade 0 raymarching
  - this might be more effective at improving perf vs. quality
     after a point than increasing grid spacing

Features still needed:

- [ ] texture sources for emission and absorption in materials
- [ ] change light response depending on z coordinate
- [ ] far-field shader using only directional lights
  - maybe also add parallax and fog at the same time with these
	to complete the depth effect
- [ ] better handling of opaque emitters
- [ ] handle materials with black shadows

Nice to have / optimization ideas:

- [ ] try 2x ray count scaling instead of 4x
  - tried and failed but I almost certainly did it wrong,
		worth trying again with a ringing fix implemented
		because the potential perf gains are big
- [ ] extend light texture a bit offscreen to make pop-in less abrupt
  - this should be configurable because need for it varies by scene
- [ ] bilinear / parallax fix (how do those work?) to alleviate haloing
- [ ] try computing only some of the cascades per frame
  - this would require storing all cascades separately
- [ ] indirect diffuse lighting by rendering lighting results as light sources?
- [ ] allow user to modify the attenuation/emission distance scale
- [ ] share shader code with `naga_oil` to reduce duplication between mesh and cascade shaders
- [ ] maybe a spherical harmonic representation of the final cascade could encode direction info better?