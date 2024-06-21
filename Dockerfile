
FROM debian:bookworm-slim

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# cannot remove LANG even though https://bugs.python.org/issue19846 is fixed
# last attempted removal of LANG broke many users:
# https://github.com/docker-library/python/pull/570
ENV LANG C.UTF-8

RUN groupadd -r appuser && useradd -r -g appuser appuser && \
    mkdir /src && \
    chown -R appuser:appuser /user/src/app

USER appuser

WORKDIR /user/src/app

COPY . .

RUN echo python --version

RUN sudo apt update && sudo apt-get install wget gnupg -y 
RUN cp raspi.list /etc/apt/sources.list.d 
RUN wget -O raspi.key https://archive.raspberrypi.com/debian/raspberrypi.gpg.key
RUN apt-key add raspi.key 
RUN apt update

RUN apt install -y python3-libcamera python3-kms++
RUN apt install -y python3-prctl libatlas-base-dev ffmpeg libopenjp2-7
RUN pip install numpy --upgrade
RUN pip install picamera2


RUN pip install --no-cache-dir -r requirements.txt
RUN pip install build && python -m build
RUN pip install ./dist/*.whl

EXPOSE 5000

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_DEBUG=0
ENV FLASK_APP=sneakydog_raspberrypi_demo

CMD ["flask", "run"]
