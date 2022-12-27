#!/bin/bash
cat <<EOF > /home/ubuntu/prometheus/prometheus-compose.yml
version: "3.7"

volumes:
  prometheus-data:    

services:

  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    restart: unless-stopped
    volumes:
    - ./prometheus.yml:/etc/prometheus/prometheus.yml
    - prometheus-data:/prometheus
    ports:
    - 9090:9090
    command:
    - '--config.file=/etc/prometheus/prometheus.yml'
    - '--storage.tsdb.path=/prometheus'
    - '--storage.tsdb.retention.time=1y'
    - '--web.enable-lifecycle'
EOF
docker compose -f /home/ubuntu/prometheus/prometheus-compose.yml up -d