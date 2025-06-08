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

Scale down by a percentage:
```bash
ffmpeg -i $infile -filter:v "scale=iw/2:-1" $outfile
```
(requires an even number of width pixels, otherwise subtract 1)

Save one frame as an image:
```bash
ffmpeg -i $infile -ss 1:05 -frames:v 1 $outfile
```

Concatenate several clips into one:
[stackoverflow](https://stackoverflow.com/questions/7333232/how-to-concatenate-two-mp4-files-using-ffmpeg)
```bash
ffmpeg -f concat -i files.txt $outfile
```
where `files.txt` has lines like `file '$filename'`
(ticks needed if it has spaces)
Generate e.g. with the nushell script
```nu
(ls *.mkv).name | each { $"file '($in)'" } | to text | save files.txt
```
Add `-c copy` if saving to the same format to avoid re-encoding
and `-safe 0` if the filenames contain symbols ffmpeg doesn't like for some reason

Simpler concatenate command
which can also do some rudimentary cutting at the same time
(I don't entirely understand where the `-ss`/`-to` arguments'
effects go depending on order given, needs more work to figure out)
```bash
ffmpeg -i $infile1 -i $infile2 -filter_complex "concat=n=2:v=1:a=1" $outfile
```

## Useful flags

`-c copy` to skip re-encoding, e.g. if you want to cut a video you already edited

`-an` to remove the audio track
(mnemonic: "no audio" but backwards for some reason)

`-r` to set the framerate
(set after inputs, before output; otherwise it reinterprets the input framerate
causing playback speed to change)