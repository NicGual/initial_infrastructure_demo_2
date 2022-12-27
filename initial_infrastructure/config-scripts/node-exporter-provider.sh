#!/bin/bash
cat <<EOF > /home/ubuntu/node/node-compose.yml
version: "3.7"

services:
  node_exporter:
      image: quay.io/prometheus/node-exporter:latest
      container_name: node_exporter
      restart: unless-stopped
      ports:
      - 9100:9100
      command:
      - '--path.rootfs=/host'
      pid: host
      volumes:
      - '/:/host:ro,rslave' 
EOF
docker compose -f /home/ubuntu/node-exporter/node-compose.yml up -d