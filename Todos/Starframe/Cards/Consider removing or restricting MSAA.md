If most graphics are going to be textured meshes
where the texture's alpha channel determines the edge,
MSAA won't be doing much.
It would be good to keep it for things like line rendering,
but it could be worth simplifying the deferred renderer
by removing it.
OTOH you can't use a non-multisampled depth buffer
with a multisampled render target,
so that would make interoperating between MSAA and non-MSAA systems difficult.
Maybe we could add some kind of fancier custom AA?