[docs](https://imagemagick.org/script/convert.php)

## Recipes

Crop an image to a 9:16 aspect ratio with an offset of (50, 50) from the center:
```
magick $infile -gravity center -extent 9:16+50+50 $outfile
```
- offset can be omitted
- `-gravity` options are compass directions: `northwest`, `north` etc.
- `-gravity` must come before `-extent`
- `-extent` can also be a resolution instead of aspect ratio e.g. `1920x1080`,
  but this crops so usually in those cases you want `-resize` instead. See next recipe:

Resize to fit resolution 400x400 and crop to aspect ratio 1:1
in one go (must know the aspect ratio):
```
magick $infile -gravity center -extent 1:1 -resize 400x400 $outfile
```

Adjust brightness/contrast and hue/saturation/value (for e.g. printing):
```
magick $infile -brightness-contrast 15x10 -modulate 100,150,100 $outfile
```
- not sure what the brightness/contrast units are,
  but these values usually give decent colors on my printer
- modulate takes a comma-separated list of percentage values h,s,v,
  100 means "do not change this value"

Make a 3x3 grid of square images (useful for e.g. the annual art vs. artist meme):
```bash
magick montage -tile 3x3 -geometry x300 $file1 $file2 ...
```
(the images must already be cropped to square aspect ratio)