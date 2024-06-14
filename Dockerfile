FROM --platform=arm64 python:slim

# Setup an app user so the container doesn't run as the root user
RUN useradd appuser
USER appuser

WORKDIR /home/appuser

COPY src ./src
COPY pyproject.toml ./
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["flask", "run"]