---

kanban-plugin: basic

---

## Physics

- [x] [[Generic collision detection for polygon-circle Minkowski sums]]
- [x] Compound colliders
- [x] Point queries don't work on the first body spawned if it's sleeping #bug
- [x] Spherecasts
- [x] [[Collision detection broad phase]] #wip
- [x] [[Time speed control]]
- [ ] [[Block solver for two-point contacts]]
- [ ] [[Anisotropic friction]] #bug
- [ ] Physics::query_point_body is extremely ugly, refactor it somehow
- [ ] Explore SIMD for collision detection


## Graphics

- [ ] [[Camera]]
- [ ] [[Colors]]
- [ ] GUI
- [ ] Immediate mode debug drawing of arbitrary shapes


## Entitygraph

- [ ] Stripped down Debug impl for NodeRefs
- [ ] [[Try using a min heap instead of deque for vacant slots]]
- [ ] [[Pooling]]
- [ ] Benchmark


## Misc

- [x] Consider re-exporting most or all types from the top level for qualified usage like `sf::Arst`
- [ ] Tiled integration for sandbox
- [ ] [[Game loop lag resilience]]
- [ ] Gamepad support
- [ ] [[Tweening]]




%% kanban:settings
```
{"kanban-plugin":"basic","new-note-folder":"Gamedev/Starframe/Cards","show-checkboxes":true,"lane-width":350}
```
%%