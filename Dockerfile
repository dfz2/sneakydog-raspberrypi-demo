FROM python:3.12-slim-bullseye

RUN apt install -y python3-picamera2 --no-install-recommends

WORKDIR /user/src/app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install build && python -m build
RUN pip install ./dist/*.whl

EXPOSE 5000

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_DEBUG=0
ENV FLASK_APP=sneakydog_raspberrypi_demo

CMD ["flask", "run"]
