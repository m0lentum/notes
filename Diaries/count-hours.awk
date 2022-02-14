/^#/ {
  match($0, /\(([0-9\.]+)h\)/, m);
  h += m[1];
}
END { print h, "h" }
