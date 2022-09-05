[docs](https://imagemagick.org/script/convert.php)

## Recipes

Crop an image to a 9:16 aspect ratio with an offset of (50, 50) from the center:

```
convert $infile -gravity center -extent 9:16+50+50 $outfile
```
- offset can be omitted and aspect can be replaced with pixel counts
- `-gravity` options are compass directions: `northwest`, `north` etc.
- `-gravity` must come before `-extent`