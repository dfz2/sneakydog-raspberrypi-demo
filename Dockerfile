FROM --platform=arm64 python:3.12

WORKDIR /usr/local/app

# Install the application dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy in the source code
COPY dist/*.whl ./app.whl

RUN pip install ./app.whl

EXPOSE 5000

# Setup an app user so the container doesn't run as the root user
RUN useradd app
USER app

ENV FLASK_APP="sneakydog_raspberrypi_demo"
ENV FLASK_PORT=5000
ENV FLASK_HOST=0.0.0.0

CMD ["flask", "run"]