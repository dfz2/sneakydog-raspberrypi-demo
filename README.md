sneakydog-raspberrypi-demo

package whl 
```
python -m build
```

picamera config.txt settings
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


cp sneakydog-raspberrypi-demo.service  /etc/systemd/system/sneakydog-raspberrypi-demo.service

```


docker-compose.yaml

```
version: "3.8"

services:
  sneakydog_raspberrypi_demo:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - /run/udev:/run/udev:ro
    devices:
      - /dev/video0:/dev/video0
    environment:
      - FLASK_APP=sneakydog_raspberrypi_demo
      - FLASK_RUN_HOST=0.0.0.0
      - FLASK_RUN_PORT=5000
      - FLASK_DEBUG=0
    ports:
      - "5000:5000"
    restart: always
    privileged: true


```