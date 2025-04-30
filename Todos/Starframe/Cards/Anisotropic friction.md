Friction is much stronger in one direction than the other -
this is very visible in Flamegrower when trying to push a block.
Initially thought it was just static friction but the problem
persists with dynamic friction; just less noticeable because
it doesn't completely stop movement.

I suspect this is because of contact processing order
and *might* be resolved by adding a
[[Block solver for two-point contacts]].

2025 edit: this was mostly resolved by the removal of static friction,
but should still be investigated in the context of pushing blocks in Flamegrower
since the above comment suggests it might still be an issue there.