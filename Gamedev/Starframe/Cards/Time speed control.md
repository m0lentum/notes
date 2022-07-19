Slow-motion and speed-up effects.

There are two parameters that can be used to affect this: `dt` and `substeps`.
Changing `dt` too much might have a significant effect
on stiffness, causing ropes and other complex systems of constraints
to behave differently. The ideal solution would thus probably adjust substeps
first and foremost, though if speeding up significantly,
only doing it with more steps might become too big a performance hit.
For now, though, I only have plans to use slowdowns, so focus on those.
