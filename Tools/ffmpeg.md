Command line video editing tool.

## Recipes

Cut from start time to end time:
```bash
ffmpeg -i $infile -ss 1:00 -to 2:00 $outfile
```

Save as a reduced-resolution 30fps gif:
```bash
ffmpeg -i $infile -filter:v "scale=720:405" -r 30 out.gif
```

Change the audio volume:
```bash
ffmpeg -i $infile -filter:a 'volume=1.5' $outfile
```

## Useful flags

`-c copy` to skip re-encoding, e.g. if you want to cut a video you already edited

`-an` to remove the audio track
(mnemonic: "no audio" but backwards for some reason)