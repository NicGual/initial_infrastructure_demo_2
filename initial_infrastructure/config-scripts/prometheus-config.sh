#!/bin/bash
cat <<EOF > /home/ubuntu/prometheus/prometheus.yml
global:
  scrape_interval:     15s 
  evaluation_interval: 15s 

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
    - targets: ['10.0.1.207:9090']
    
EOF