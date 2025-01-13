# ffmpeg -y -loglevel warning -i video.m4a -i video.webm -vf 'pad=1280:720:0:67,fps=30' -c:a aac -b:a 192k -shortest -c:v h264_nvenc video.mp4
