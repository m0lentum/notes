Currently colors are just `[f32; 4]`s which aren't very nice to use. I'm going to
want to set some colors in code even after I implement a mesh- and
texture-based workflow, so I'll want some nicer way of working with colors.
Probably bolt on an existing library instead of reinventing the wheel on this
one.

Options:
[colstodian](https://fu5ha.github.io/colstodian/colstodian/) (just simple color encodings, would help construct colors),
[palette](https://github.com/Ogeon/palette/) (more color spaces, more complex mixing and gradients etc,
not sure if I need them)