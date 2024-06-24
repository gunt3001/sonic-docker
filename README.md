# sonic-docker

Dockerized version of [Sonic](https://github.com/waywardgeek/sonic), a free software for speeding up or slowing down speech.

The Docker image is built directly from the source code for the command-line application (`main.c`) at the original repository.

## Usage

To use the Docker image, you can run the following command:

```bash
docker run --rm -it \
    -v /path/to/input:/input \
    -v /path/to/output:/output \
    ghcr.io/gunt3001/sonic-docker \
    -s 2.0 \
    /input/input.wav \
    /output/output.wav
```

For reference, the CLI usage of Sonic is as follows:

```
Usage: sonic [OPTION]... infile outfile
    -c         -- Modify pitch by emulating vocal chords vibrating
                  faster or slower.
    -o         -- Override the sample rate of the output.  -o 44200
                  on an input file at 22100 KHz will play twice as fast
                  and have twice the pitch.
    -p pitch   -- Set pitch scaling factor.  1.3 means 30% higher.
    -q         -- Disable speed-up heuristics.  May increase quality.
    -r rate    -- Set playback rate.  2.0 means 2X faster, and 2X pitch.
    -s speed   -- Set speed up factor.  2.0 means 2X faster.
    -v volume  -- Scale volume by a constant factor.
```
