#!/bin/bash
cat <<EOF > /home/ubuntu/grafana/grafana-compose.yml
version: "3.7"

volumes:
  grafana-data:

services:
  grafana:
      image: grafana/grafana:latest
      container_name: grafana
      restart: unless-stopped
      volumes:
      - grafana-data:/var/lib/grafana
      ports:
      - 3000:3000
EOF
docker compose -f /home/ubuntu/grafana/grafana-compose.yml up -d