#!/bin/bash

set -x       

ffmpeg -follow_mouse 50 -show_region 1 -video_size 350x640 -f 30 -f x11grab -i :0.0  \
       -f alsa -ac 2 -i default  \
       -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -crf 0 -threads 0 \
       -acodec pcm_s16le -y \
       "./Out-$(date '+%Y-%m-%d_%H.%M.%S').mkv" 

       
# Note: The audio codec pcm_s16le only work for mkv
       
# Based on:
# FFmpeg video screen capture, recording, casting A- 2020
# https://www.bogotobogo.com/FFMpeg/ffmpeg_video_screencasting_screen_recording_capture.php
# Lossless recording
# The resolution is set to 1366x768 with framerate at 25 and the command looks like this:
# $ ffmpeg -f alsa -ac 2 -i pulse -f x11grab -r 25 -s 1366x768 -i :0.0 \
# -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -crf 0 -threads 0 \
# -acodec pcm_s16le -y output.mkv
# In the command, -i :0.0 means to capture the primary screen (0.0). We're using libx264 video codec. To support some of the media players that does YUV planar color space with 4:2:0 chroma subsampling for H.264 vide, we can use -pix_fmt yuv420p, if no pixel format is specified, yuv444p for H.264 encoding will be used by default.

# Investigated by Washington Indacochea Delgado, 2022
# wachin.id@gmail.com
# [Screencast] Grabar pantalla con FFmpeg 4.2 + seguir cursor + mostrar cursor + grabar rectangulo de 480p
# https://facilitarelsoftwarelibre.blogspot.com/2021/03/screencast-ffmpeg-follow-mouse-linux.html
# God Bless You


