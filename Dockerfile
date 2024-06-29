FROM debian:bookworm

#RUN apt update && apt install -y --no-install-recommends gnupg wget

RUN apt-get update && apt-get install apt-utils -y

COPY raspberrypi-archive-stable.gpg /etc/apt/trusted.gpg.d

RUN echo "deb http://archive.raspberrypi.com/debian/ bookworm main" > /etc/apt/sources.list.d/raspi.list

#RUN wget -O temp.key http://archive.raspberrypi.com/debian/raspberrypi.gpg.key && apt-key add temp.key && rm temp.key

RUN apt-get update && apt-get -y upgrade

RUN apt-get update && apt-get install -y --no-install-recommends \
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
COPY . .

# Install Python dependencies
# TODO: fix issue with "--break-system-packages" flag
RUN pip install --break-system-packages --no-cache-dir -r requirements.txt
RUN pip install build && python3 -m build
RUN pip install ./dist/*.whl

EXPOSE 5000

# Set the entry point
CMD ["flask", "run"]
