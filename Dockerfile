FROM --platform=arm64 python:slim

WORKDIR /usr/src/app

COPY src ./src
COPY pyproject.toml ./
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["flask", "run"]