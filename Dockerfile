FROM python:slim

WORKDIR /usr/src/app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install build
RUN python -m build
RUN pip install ./dist/*.whl

EXPOSE 5000

ENV FLASK_HOST=0.0.0.0
ENV FLASK_DEBUG=0
ENV FLASK_APP=sneakydog_raspberrypi_demo

CMD ["flask", "run"]