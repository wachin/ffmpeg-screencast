#!/bin/bash

set -x       

cat /dev/zero | pv -B 1 -L 1 -tpe -s 5 -S > /dev/null

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

# cat /dev/zero | pv -B 1 -L 1 -tpe -s 5 -S > /dev/null
# Is there a way to display a countdown or stopwatch timer in a terminal? - Super User
# https://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal
# https://superuser.com/a/1445150/989620
# If you have pv installed, you can use the following one-liner to display a countdown timer and sleep for a minute (or any other amount of time, just change 60 to the desired number of seconds):
# cat /dev/zero | pv -B 1 -L 1 -tpe -s 60 -S > /dev/null
# Explanation:
# Cat /dev/zero produces an infinite amount of ASCII zero (\0) characters. pv displays progress, rate limits the data flowing through it and terminates after 60 characters (details below). Finally, the redirection to /dev/null makes sure that the \0 characters are not sent to the terminal.
# The parameters used for pv are:
# -B 1 sets the buffer size to 1.
# -L 1 rate limits the pipe to 1 character per second.
# -tpe turns on the display of the time, progress and ETA indicators (while -e only shows the latter).
# -s 60 specifies that pv should expect 60 bytes.
# -S tells pv to stop after reaching the specified size even though the input continues (it is infinite).

# Investigated by Washington Indacochea Delgado, 2022
# wachin.id@gmail.com
# [Screencast] Grabar pantalla con FFmpeg 4.2 + seguir cursor + mostrar cursor + grabar rectangulo de 480p
# https://facilitarelsoftwarelibre.blogspot.com/2021/03/screencast-ffmpeg-follow-mouse-linux.html
# God Bless You
