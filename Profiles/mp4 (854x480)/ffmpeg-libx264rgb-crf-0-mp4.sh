#!/bin/bash

set -x

ffmpeg -follow_mouse 50 -show_region 1 -video_size 854x480 -f 30 -f x11grab -i :0.0  \
       -f alsa -ac 2 -i default  \
       -c:v libx264rgb -crf 0 -preset ultrafast \
       "./Out-$(date '+%Y-%m-%d_%H.%M.%S').mp4" 
       
## Based on:
# Capture/Desktop – FFmpeg
# https://trac.ffmpeg.org/wiki/Capture/Desktop
# Lossless Recording
# If your CPU is not fast enough, the encoding process might take too long. To speed up the encoding process, you can use lossless encoding and disable advanced encoder options, e.g.:
# ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 output.mkv
#-crf 0 tells x264 to encode in lossless mode; -preset ultrafast advises it to do so fast. Note the use of libx264rgb rather than libx264; the latter would do a lossy conversion from RGB to yuv444p (8 bit yuv444p is not enough to preserve 8 bit RGB, 10 bit YCbCr is needed). -color_range 2 is needed because otherwise it will write full range RGB yet will tag it as limited range (this was fixed in 7ca71b79f2b3256a0eef1a099b857ac9e4017e36 and thus is no longer needed).
# The encoder should be fast enough on most modern hardware to record without any framedrop, and even leave enough CPU headroom for other applications.
# If you're going to archive the recording or are concerned about file size, re-encode it losslessly again, but with a slower preset. Note that since the initial recording was lossless, and the re-encode is lossless too, no quality loss is introduced in this process in any way.
# ffmpeg -i output.mkv -c:v libx264rgb -crf 0 -preset veryslow output-smaller.mkv

# Investigated by Washington Indacochea Delgado, 2022
# wachin.id@gmail.com
# [Screencast] Grabar pantalla con FFmpeg 4.2 + seguir cursor + mostrar cursor + grabar rectangulo de 480p
# https://facilitarelsoftwarelibre.blogspot.com/2021/03/screencast-ffmpeg-follow-mouse-linux.html
# God Bless You



