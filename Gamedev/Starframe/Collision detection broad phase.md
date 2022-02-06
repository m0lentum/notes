Research possible alternatives and implement one. Remember to expand bounding
volumes to account for movement during XPBD substeps. XPBD uses AABB trees, but
I feel like a hierarchical grid might be the best thing for 2D. Originally I
wanted to implement many options and allow user choice, but that might be
overkill.

Edit: basics of hgrid implemented, todos:

- [x] cache AABBs
- [x] test: select grid level based on smaller extent of AABB
- [ ] test: first insert all and then get pairs
      (can skip smaller grid levels than current object is at)
- [ ] test: mark in grid whether lower levels have stuff in them, iterate in
      reverse order (maybe not useful for collision detection, definitely not with
      the previous bullet point in place, but good for raycasting)
- [ ] retain static objects between frames? maybe only worth if we also have #45
      and can retain those as well
- [x] visualize the grid for user adjustment
- [x] document the grid creation params
- [ ] improve bitset comparison efficiency as per RTCD page 293
  - actually this is pretty hard to do with dynamic bitset size. would probably
    need to do something wild with const generics and trait objects. think
    about it
- [x] check collision layer before AABB check in spatial index