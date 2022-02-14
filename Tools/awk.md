# awk

## Recipes

Pick out the contents of all `<Name>` tags in an XML file:
```awk
/<Name>/ { match($0, />(.+)</, m); print m[1] }
```
Useful pattern with `match` to pick out things that you can't get
using field separators like `-F |`.

Count hours from notation like `(1.5h)` in Markdown headers:
```awk
/^#/ {
  match($0, /\(([0-9\.]+)h\)/, m);
  h += m[1];
}
END { print h, "h" }
```
Variables that aren't explicitly initialized are zero,
and matches that don't match also return zeroes, so this works
without initializing `h` on `BEGIN` and without explicitly handling
non-matches.