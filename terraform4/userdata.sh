#!/bin/bash
set -euo pipefail

# Install Docker Engine and the Docker Compose v2 plugin
curl -fsSL https://get.docker.com | sh

# Start docker and enable on boot
systemctl enable --now docker

# Allow ssm-user to run docker without sudo
id ssm-user &>/dev/null || useradd -m ssm-user
usermod -aG docker ssm-user

# Ensure compose plugin is available
command -v docker compose >/dev/null 2>&1 || (apt-get update -y && apt-get install -y docker-compose-plugin)

cd /opt

# Fetch the official Rackula docker compose stack (persistent, with API)
curl -fsSL https://raw.githubusercontent.com/RackulaLives/Rackula/main/deploy/docker-compose.persist.yml -o docker-compose.yml

# The stack persists layouts server-side in ./data, owned by uid/gid 1001
mkdir -p data
chown 1001:1001 data

# Bring the stack up on port ${rackula_port}
cd /opt
RACKULA_PORT=${rackula_port} docker compose up -d