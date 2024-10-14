#!/bin/bash

# remove copyright music from the end of Danny's videos

intro=0
outro=63

echo "Removing Copyright Music ..."

rm -f video-orig.mp4 &&
mv video.mp4 video-orig.mp4 &&
duration=$(ffprobe -v warning -select_streams v:0 -show_entries format=duration -of csv=p=0 video-orig.mp4) &&
echo ffmpeg -y -loglevel warning -ss $intro -i video-orig.mp4 -t $(awk "BEGIN {print $duration - $intro - $outro}") -c copy video.mp4 &&
ffmpeg -y -loglevel warning -ss $intro -i video-orig.mp4 -t $(awk "BEGIN {print $duration - $intro - $outro}") -c copy video.mp4 &&
echo "done."




