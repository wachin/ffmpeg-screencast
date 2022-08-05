#!/bin/bash

# Investigated by Washington Indacochea Delgado, 2022
# wachin.id@gmail.com
# [Screencast] Grabar pantalla con FFmpeg 4.2 + seguir cursor + mostrar cursor + grabar rectangulo de 480p
# https://facilitarelsoftwarelibre.blogspot.com/2021/03/screencast-ffmpeg-follow-mouse-linux.html
# God Bless

for f in *.mp4; do echo "file '$f'" >> milista.txt; done 

ffmpeg -f concat -safe 0 -i milista.txt -c copy ./recorded-videos/"Rec-$(date '+%Y-%m-%d_%H.%M.%S').mp4"

rm milista.txt 

dirname recorded-videos 

## Moving the videos to the Old folder
mv Out-*.mp4 ./Old

echo "..........[ DONE ]"

echo "Job Completed."
