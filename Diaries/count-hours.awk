BEGIN { h = 0 }
/^## .+ \(.+h\)/ {
  gsub(/[\(\)h]/, "", $3);
  h += $3;
}
END { print h }
