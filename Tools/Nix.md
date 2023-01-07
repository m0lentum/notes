## Cool resources

- [A tour of Nix](https://nixcloud.io/tour/?id=1): interactive language tutorial
- [Nix package versions](https://lazamar.co.uk/nix-versions/): find which revision of nixpkgs
  has a specific version of a package

## Random tricks I felt like writing down

### Manually patching binaries

When you download a binary that wasn't made for NixOS
and want to try it quickly, first do

```bash
patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" my-binary
```

then check missing libraries with

```bash
ldd my-binary
```

Find packages containing the libraries with `nix-locate`
and patch them into the binary with

```bash
patchelf --add-rpath "$(nix-build --no-out-link '<nixos>' -A pkg)/lib" my-binary
```

Usually the path will look like that, though for some packages you
may need a different path e.g. for fontconfig you need the 
nixpkgs path `-A fontconfig.lib`.

For wgpu/vulkan apps and you also need `vulkan-loader`
and a bunch of libs from `nixpkgs.xorg`, which are linked at runtime
and don't show up in `ldd` but will cause runtime errors.
Instead of manually patching these in you can also grab the nix-shell
from one of my wgpu projects to get these libs.