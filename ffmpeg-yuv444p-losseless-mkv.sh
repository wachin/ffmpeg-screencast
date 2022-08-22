#!/bin/bash

set -x       

for i in `seq 5 -1 1` ; do echo -ne "\r$i " ; sleep 1 ; done

ffmpeg -follow_mouse 50 -show_region 1 -video_size 854x480 -f 30 -f x11grab -i :0.0  \
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

# Is there a way to display a countdown or stopwatch timer in a terminal? - Super User
# https://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal
# https://superuser.com/a/1445150/989620
# Explanation:
# I know there are a lot of answers, but I just want to post something very close to OP's question, that personally I would accept as indeed "oneliner countdown in terminal". My goals were:
# One liner.
#   Countdown.
#    Easy to remember and type in console (no functions and heavy logic, bash only).
#    Does not require additional software to install (can be used on any server I go via ssh, even if I do not have root there).
# How it works:
# seq prints numbers from 60 to 1.
# echo -ne "\r$i " returns caret to beginning of the string and prints current $i value. Space after it is required to overwrite previous value, if it was longer by characters than current $i (10 -> 9).


# Investigated by Washington Indacochea Delgado, 2022
# wachin.id@gmail.com
# [Screencast] Grabar pantalla con FFmpeg 4.2 + seguir cursor + mostrar cursor + grabar rectangulo de 480p
# https://facilitarelsoftwarelibre.blogspot.com/2021/03/screencast-ffmpeg-follow-mouse-linux.html
# God Bless You
