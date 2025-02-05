# extract 1st frame of video as thumbnail image
ffmpeg -loglevel warning -y -ss 30 -i video.mp4 -vf "scale=1280:720" -frames:v 1 thumbnail.png
