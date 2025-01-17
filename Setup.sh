#!/bin/bash
mkdir windows-docker
cd windows-docker
cat <<EOL > compose.yaml
services:
  windows:
    image: dockurr/windows
    container_name: windows
    devices:
      - /dev/kvm
    cap_add:
      - NET_ADMIN
    ports:
      - 8006:8006
      - 3389:3389/tcp
      - 3389:3389/udp
    stop_grace_period: 2m
    restart: on-failure
    environment:
      VERSION: "win11"
      RAM_SIZE: "8G"
      CPU_CORES: "4"
      DISK_SIZE: "256G"
    volumes:
      - ./data:/storage
EOL

# Docker Compose
docker compose up -d
