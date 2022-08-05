#!/bin/bash

set -x       

ffmpeg -follow_mouse 50 -show_region 1 -video_size 350x640 -f 30 -f x11grab -i :0.0  \
       -f alsa -ac 2 -i default \
       -c:v libx264 -crf 0 -preset ultrafast \
       -acodec libmp3lame -async 1 \
       "./Out-$(date '+%Y-%m-%d_%H.%M.%S').mp4" 
       
#ffmpeg -follow_mouse 50 -show_region 1 -video_size 854x480 -f 30 -f x11grab -i :0.0  \
#       -f alsa -ac 2 -i default  \
#       -c:v libx264rgb -crf 0 -preset ultrafast \
#       "./Out-$(date '+%Y-%m-%d_%H.%M.%S').mp4" 

# Based on:
# How to make a screencast using ffmpeg | From Linux
# https://blog.desdelinux.net/en/how-to-make-a-screencast-using-ffmpeg/
# . . . ffmpeg -f alsa -i hw: 0 -f x11grab -r 25 -s $ WIN_GEO -i: 0.0 + $ WIN_XY -acodec libmp3lame -async 1 -vcodec libx264 -preset ultrafast - crf 0 -threads 0 save.mp4
# 1) If you use OSS, replace -f alsa -i hw: 0 with -f oss -i / dev / dsp
# 2) If you use only ALSA, you have to use the parameters that come in the script (-f alsa -i hw: 0). To determine the number after hw: you can run aplay -l and choose the number of the appropriate sound card.
# 3) If you use Pulse Audio (Ubuntu and derivatives use this), use the parameters -f alsa -ac 1 -i pulse.
# FPS
# -r 25 indicates the fps (frames per second or frames per second) you want to record at. 25 is a good option.
# Audio, video and sync codec
# -acodec libmp3lame is the audio codec. I chose to record it in mp3. You can use any other.
# -async 1 allows synchronization of audio with video.
# -vcodec libx264 -preset ultrafast -crf 0 -threads 0, tells ffmpeg that the video codec to use is x264 and that the preset is ultrafast (there is fast, slow, etc), otherwise it will not record correctly at the desired amount of fps. The -crf 0 parameter indicates the compression level (the lower the compression, the lower the compression). Finally, threads 0 indicates the number of threads to use, when passing 0 ffmpeg calculates it automatically. As with the audio settings, you can choose other options.
# All these settings were the ones that gave me the best results: a relatively small file, a good video quality, with synchronized audio and no lags. However, I recommend you dive into the ffmpeg documentation to discover others.

# Investigated by Washington Indacochea Delgado, 2022
# wachin.id@gmail.com
# [Screencast] Grabar pantalla con FFmpeg 4.2 + seguir cursor + mostrar cursor + grabar rectangulo de 480p
# https://facilitarelsoftwarelibre.blogspot.com/2021/03/screencast-ffmpeg-follow-mouse-linux.html
# God Bless You

