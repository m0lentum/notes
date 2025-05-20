Game loop should handle sudden lag spikes better, and also make sure
constant low performance is as smooth as it feasibly can.
Tune the maximum frame time accumulator to make fewer updates in one go
when a long delay suddenly happens. Check what Tyler Glaiel said about
frame time averaging (or something like that), and if it would be useful here.
For testing this you could add buttons that do some amount of thread::sleep,
e.g. set amount per frame, random amount per frame,
set really big amount in one shot.

The `pacy` crate (is that done yet? haven't heard anything in a while)
might also be useful here.