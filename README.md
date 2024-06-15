sneakydog-raspberrypi-demo

package whl 
```
python -m build
```

config.txt settings
```
camera_auto_detect=0
gpu_mem=128
#display_auto_detect=1
dtoverlay=imx219,cam1
```


Install picamera2
```

sudo apt install -y python3-libcamera python3-kms++
sudo apt install -y python3-prctl libatlas-base-dev ffmpeg libopenjp2-7 python3-pip
pip install numpy --upgrade
pip install picamera2


python -m venv --system-site-packages .venv
source .venv/bin/activate


```
