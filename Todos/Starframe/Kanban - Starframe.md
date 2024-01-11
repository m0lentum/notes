---

kanban-plugin: basic

---

## Physics

- [x] [[Generic collision detection for polygon-circle Minkowski sums]]
- [x] Compound colliders
- [x] Point queries don't work on the first body spawned if it's sleeping #bug
- [x] Spherecasts
- [x] [[Collision detection broad phase]]
- [x] [[Time speed control]]
- [x] ~~[[Temporal coherence in collision detection]]~~
- [ ] [[Block solver for two-point contacts]]
- [ ] [[Anisotropic friction]] #bug
- [ ] Explore SIMD for collision detection
- [ ] General multibody constraints instead of specialized ropes
- [ ] Abstract specific constraint implementation out of solver.rs
- [ ] [[Rope construction with a generic  samplable curve  type]]
- [ ] Split as many methods as possible to fields of `PhysicsWorld` for better split borrows
- [ ] [[See if any bounds checks can be optimized out]]


## Graphics

- [ ] [[Camera]]
- [ ] [[Colors]]
- [ ] GUI
- [ ] Immediate mode debug drawing of arbitrary shapes
- [ ] Replace ad-hoc gpu types with [encase](https://docs.rs/encase)
- [ ] Non-panicking error handling for glTF import
- [ ] Optimize joint matrices by removing the fourth row
- [ ] GPU skinning?


## Misc

- [x] Consider re-exporting most or all types from the top level for qualified usage like `sf::Arst`
- [ ] Tiled integration for sandbox
- [ ] [[Game loop lag resilience]]
- [ ] Gamepad support
- [ ] [[Tweening]]
- [ ] Simplify re-exports: only do them at the lib top level


***

## Archive

- [x] 2023-08-19 19:46 [[Give up and switch to hecs]]
- [ ] 2023-08-19 19:46 Stripped down Debug impl for NodeRefs
- [ ] 2023-08-19 19:46 [[Try using a min heap instead of deque for vacant slots]]
- [ ] 2023-08-19 19:46 [[Pooling]]
- [ ] 2023-08-19 19:46 Benchmark
- [ ] 2023-08-19 19:46 [[Directional edges]]
- [ ] 2023-08-19 19:46 [[Thoughts on multi-edges]]

%% kanban:settings
```
{"kanban-plugin":"basic","show-checkboxes":true,"lane-width":350,"new-note-folder":"Todos/Starframe/Cards"}
```
%%