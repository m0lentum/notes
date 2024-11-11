---

kanban-plugin: basic

---

## Core

- [x] Replace `ComposedOperator` type parameters with input and output type
- [x] Sorting to optimize subsimplex generation
- [x] Write a README #mvp
- [x] Swap inverse star's sign depending on dimension
- [x] Wave propagation example
- [x] Cite references in README
- [x] wasm build
- [x] [[Custom element groups]]
- [x] Integrate only a subset of a cochain
- [x] [[Numerical integration]] (1d and 0d)
- [ ] Named physical groups from gmsh<br>- this requires upstream changes to mshio
- [ ] Hodge-optimized triangulations
- [ ] Time-harmonic operators from master's thesis?
- [ ] Numerical integration for higher dimensions
- [ ] Parallelism (rayon? simd? cubecl? wgsl compute?)
- [ ] Store and playback a non-realtime simulation


## Visuals

- [x] Keep aspect ratio constant
- [x] [[Line rendering]]
- [x] Coordinate axes<br>- done for 2D (minus text), no 3D yet
- [x] 1-cochains as arrows
- [x] Frame timing control
- [x] Interpolated rendering
- [x] Wireframe using line renderer
- [x] 2-cochains as flat triangles
- [x] Migrate away from storage buffers for webgl compatibility
- [ ] [[Sharing of render passes]] #optimization
- [ ] Cacheable lines #optimization
- [ ] 3D camera
- [ ] Camera controls
- [ ] Text rendering
- [ ] 3D animation for membrane<br>- this could be an easy starting point for 3D camera development
- [ ] More color maps
- [ ] Use `naga_oil` to share shader code
- [ ] Plots
- [ ] Split views (e.g. mesh on one side, plot on the other)
- [ ] Draw still image instead of animation
- [ ] Draw to image (/video?)




%% kanban:settings
```
{"kanban-plugin":"basic","show-checkboxes":true,"lane-width":350,"new-note-folder":"Todos/Dexterior/Cards"}
```
%%