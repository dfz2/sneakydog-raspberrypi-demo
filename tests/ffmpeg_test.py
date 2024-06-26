import ffmpeg

(
    ffmpeg
    .input('/DATA/Gallery/20240616/*.jpg', pattern_type='glob', framerate=25)
    .output('/DATA/Gallery/20240622/movie1.mp4')
    .run()
)
