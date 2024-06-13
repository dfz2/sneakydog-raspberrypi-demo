FROM --platform=arm64 python:3.12

WORKDIR /usr/local/app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src ./src

RUN pip install build
RUN python3 -m build
RUN pip install ./dist/*.whl


EXPOSE 5000

# Setup an app user so the container doesn't run as the root user
RUN useradd appuser
USER appuser

ENV FLASK_APP="sneakydog_raspberrypi_demo"
ENV FLASK_PORT=5000
ENV FLASK_HOST=0.0.0.0

CMD ["flask", "run"]