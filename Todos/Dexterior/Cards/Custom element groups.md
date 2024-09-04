Needed for piecewise defined boundary conditions, local source terms and such.

Steps:
- [x] for each node, get the entity corresponding to the node's entity tag and dimension
- [x] get the entity's physical tag if available
- [x] associate nodes with physical tags
- [x] what about edge endpoints? maybe you can group those into the physical group too
- [x] associate nodes with elements in the final mesh
  (these are not in the same order as the file
  except for 0- and N-simplices,
  need to look them up somehow)
- [x] store elements that have nodes associated with each physical tag in bitsets
- [ ] implement named physical groups in mshio

