TODO:

- [ ] clear cascade texture between frames
- [ ] volumetrics
- [ ] mip chain for the light texture for higher quality raymarching
   (might need volumetrics to work good)
- [ ] refactor to not use storage textures so we can run on web
- [ ] try interpolating nearest probes (direction-first ordering needed)
- [ ] check the cascade count (seems there's one too few)
- [ ] try generating SDF to accelerate raymarching
   (could this speed up enough to not need the mip chain?
     OTOH, do we want the mip chain to smooth things out?)
- [ ] environment map