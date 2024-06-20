FROM python:3.12-slim-bullseye

WORKDIR /user/src/app

COPY . .


RUN apt update && apt-get install wget -y && p raspi.list /etc/apt/sources.list.d && wget http://archive.raspberrypi.org/debian/raspberrypi.gpg.key && apt-key add raspberrypi.gpg.key && apt update -y

RUN apt install -y python3-picamera2 --no-install-recommends

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install build && python -m build
RUN pip install ./dist/*.whl

EXPOSE 5000

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_DEBUG=0
ENV FLASK_APP=sneakydog_raspberrypi_demo

CMD ["flask", "run"]
