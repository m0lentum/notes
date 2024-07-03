Widespread transparency would be cool
to allow for a more roughly painted look with soft edges,
as well as antialiasing baked directly into textures without postprocessing.
Deferred shading can't do this.
A forward+ renderer ([paper](https://takahiroharada.wordpress.com/wp-content/uploads/2015/04/forward_plus.pdf), [example implementation](https://github.com/bcrusco/Forward-Plus-Renderer)) could.
Steps needed:
- skinning as a separate GPU step saving results to buffers
  (because more than one pass needs skinned vertex positions)
- light binning
  (compute shader)
- depth prepass
  (this should be ordered front to back for efficiency)
- forward rendering
  (this **has to** be ordered back to front for transparency,
  which is tricky when it comes to self-overlapping meshes)
- HDR lighting (optional but increases flexibility a lot)

(update: done all except HDR, moving that to a separate card for later.
outdated notes below)

The number of texture reads needed may be a concern
since we need textures for both the depth pass and forward pass.
However, many of the duplicate reads will be depth-tested out
(as long as we don't adjust depth in the fragment shader).
Probably won't be a major issue, but the profiler will tell.

Maybe the hardest problem is self-overlapping meshes
in the case of drawing everything with alpha blending.
Maybe look into order-independent transparency algorithms?
Oh actually it might be sufficient to sort triangles in z order,
let's try that first.. Yup, works!

One more hard thing though:
can we do instancing if we also need depth sorting?
Probably not?
But with GPU skinning we could put all the vertices into a big buffer
and do vertex pulling, maybe that would also perform nicely.
Also it's unclear how much instancing will actually be used,
maybe it's fine to just not do it