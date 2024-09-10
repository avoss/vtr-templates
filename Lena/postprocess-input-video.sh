#!/bin/bash

# remove copyright music from begin and end of Lena's videos

intro=4.5
outro=11.7

if test -f video.mp4 && test -f video-orig.mp4 ; then
  echo files already exist
  exit 0
fi

if ! test -f video-orig.mp4 ; then
  mv video.mp4 video-orig.mp4 
fi &&
echo "removing copyright music ..." &&
duration=$(ffprobe -v warning -select_streams v:0 -show_entries format=duration -of csv=p=0 video-orig.mp4) &&
echo ffmpeg -y -loglevel warning -ss $intro -i video-orig.mp4 -t $(awk "BEGIN {print $duration - $intro - $outro}") -c copy video.mp4 &&
ffmpeg -y -loglevel warning -ss $intro -i video-orig.mp4 -t $(awk "BEGIN {print $duration - $intro - $outro}") -c copy video.mp4 &&
echo "done."




