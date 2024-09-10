in generated build.sh 

1. replace

downloadVideo() {
  if ! test -f video.mp4; then
    yt-dlp -f mp4 -o video-orig.mp4 $VIDEO_URL &&
    acquire $GPU_LOCK &&
    ffmpeg -y -i video-orig.mp4 -c:v h264_nvenc -vf "scale=1280:720,fps=30" -c:a aac -b:a 192k -shortest video.mp4 &&
    release $GPU_LOCK
  fi
}

2. replace min_speakers=2


add title and description to review.txt manually

after upload remove from video description:

Translation published with kind permission of Kremlin.

