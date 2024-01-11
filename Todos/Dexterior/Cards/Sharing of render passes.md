You generally don't actually need a new render pass
unless you change render targets,
which in the case of `dexterior` (which, at least currently,
always draws to the window swapchain)
means a single render pass should be enough for a whole frame.
Similar sharing should be investigated with `starframe` as well,
though it does change render targets at times.