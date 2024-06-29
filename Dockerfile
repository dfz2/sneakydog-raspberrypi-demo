FROM debian:bookworm

COPY raspberrypi-archive-stable.gpg /etc/apt/trusted.gpg.d
COPY raspi.list /etc/apt/sources.list.d

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y --no-install-recommends \
    python3-pip \
    python3-picamera2 \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------------------------------------------
# Build and run application
# ------------------------------------------------------------------------------------------------
# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .
COPY ./dist/*.whl .

# Install Python dependencies
# TODO: fix issue with "--break-system-packages" flag
RUN pip install --break-system-packages --no-cache-dir -r requirements.txt
RUN pip install *.whl --break-system-packages

ENV FLASK_APP=sneakydog_raspberrypi_demo
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000
ENV FLASK_DEBUG=0

EXPOSE 5000

# Set the entry point
CMD ["flask", "run"]
