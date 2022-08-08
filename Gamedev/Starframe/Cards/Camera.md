First of all, current camera trait thingy is unnecessary,
would prefer a separate camera controller that moves the camera
since the logic for what the Camera trait does is the same for everything.

Once that's done, we need a camera that can follow objects in the world
(with configurable dead zones), snap onto areas of the world, etc.