#!/bin/bash

# create thumbnail from 30-th frame

ffmpeg -y -i video.mp4 -vf "select=eq(n\,30),scale=1280:720" -vsync vfr -frames:v 1 thumbnail.png




