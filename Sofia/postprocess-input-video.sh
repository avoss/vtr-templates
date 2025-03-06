# extract 1st frame after 5 seconds of video as thumbnail image
ffmpeg -loglevel warning -y -ss 5 -i video.mp4 -vf "scale=1280:720" -frames:v 1 thumbnail.png
