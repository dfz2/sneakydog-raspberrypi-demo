FROM python:3.12-slim-bullseye



WORKDIR /user/src/app


RUN apt install wget -y
RUN wget -o temp.key http://archive.raspberrypi.com/debian/raspberrypi.gpg.key && apt-key add temp.key
COPY raspi.list /etc/apt/sources.list.d
RUN apt update && apt upgrade -y && apt install -y python3-picamera2 --no-install-recommends

COPY . .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install build && python -m build
RUN pip install ./dist/*.whl

EXPOSE 5000

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_DEBUG=0
ENV FLASK_APP=sneakydog_raspberrypi_demo

CMD ["flask", "run"]
