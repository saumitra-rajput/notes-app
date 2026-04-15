# docker multi stage

# stage 1 build

FROM python:3.12-slim AS builder

WORKDIR /app

# Install system dependencies required for mysqlclient
# - build-essential → compiler (gcc, make)
# - pkg-config → helps locate MySQL libraries
# - default-libmysqlclient-dev → MySQL headers for Python package
# Clean up apt cache to reduce image size

RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# stage 2 runtime

FROM python:3.12-slim AS prod

WORKDIR /app

COPY --from=builder /app /app

COPY . .

EXPOSE 8000

CMD python /app/manage.py runserver 0.0.0.0:8000
