[docs](https://imagemagick.org/script/convert.php)

## Recipes

Crop an image to a 9:16 aspect ratio with an offset of (50, 50) from the center:
```
convert $infile -gravity center -extent 9:16+50+50 $outfile
```
- offset can be omitted
- `-gravity` options are compass directions: `northwest`, `north` etc.
- `-gravity` must come before `-extent`
- `-extent` can also be a resolution instead of aspect ratio e.g. `1920x1080`,
  but this crops so usually in those cases you want `-resize` instead. See next recipe:

Resize to fit a resolution and crop to its aspect ratio
in one go (must know the aspect ratio):
```
convert $infile -gravity center -extent 1:1 -resize 400x400 $outfile
```

Adjust brightness/contrast and hue/saturation/value (for e.g. printing):
```
convert $infile -brightness-contrast 15x10 -modulate 100,150,100 $outfile
```
- not sure what the brightness/contrast units are,
  but these values usually give decent colors on my printer
- modulate takes a comma-separated list of percentage values h,s,v,
  100 means "do not change this value"