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
- [ ] Integrate only a subset of a cochain
- [ ] Proper simplex/cell iterators
- [ ] Custom element groups<br>- needed for scattering (and anything else with multiple boundary conditions or local source terms)
- [ ] Quadratures for numerical integration
- [ ] Consider making `SimplexCollection` generic on simplex dimension and using `Any` to store them
- [ ] Hodge-optimized triangulations
- [ ] Time-harmonic operators from master's thesis?
- [ ] wasm build


## Visuals

- [x] Keep aspect ratio constant
- [x] [[Line rendering]]
- [x] Coordinate axes<br>- done for 2D (minus text), no 3D yet
- [x] 1-cochains as arrows
- [x] Frame timing control #mvp
- [x] Interpolated rendering
- [x] Wireframe using line renderer
- [x] 2-cochains as flat triangles
- [ ] [[Sharing of render passes]] #optimization
- [ ] Cacheable lines #optimization
- [ ] 3D camera
- [ ] Camera controls
- [ ] Text rendering
- [ ] 3D animation for membrane<br>- this could be an easy starting point for 3D camera development
- [ ] More color maps
- [ ] Use `naga_oil` to share shader code




%% kanban:settings
```
{"kanban-plugin":"basic","show-checkboxes":true,"lane-width":350,"new-note-folder":"Todos/Dexterior/Cards"}
```
%%