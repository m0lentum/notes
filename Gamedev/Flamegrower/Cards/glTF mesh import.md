This is a lot of initial work, but should provide a lot of flexibility
and a faster workflow compared to spritesheet animations.
Also, procedural animation could be pretty sweet - imagine trees and bushes
swaying in the wind, player character's arms hanging on the vine
with IK, etc.

Format: [[glTF]]. It's supported by `assets_manager`, so should be pretty easy
to get the data into the game.

Parts of the format we need to support:
- [ ] meshes
- [ ] textures, UVs
- [ ] skins
- [ ] animations

Not all meshes need to be skinned or textured. We should also support
simple static meshes with vertex colors. Possibly think about coloring
meshes with some kind of gradient map, so we can change color schemes
on the fly King's Bird style.

A lot of this should probably go on the Starframe side since this is
very likely to be my graphics workflow in future games too.
Loading assets is the game's responsibility, but SF's `Mesh` should
support creating from glTF. This will likely involve some pretty
heavy refactoring that I'll figure out once I get there.