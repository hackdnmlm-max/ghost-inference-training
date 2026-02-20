#!/usr/bin/env bash
set -e

echo "👻 GhostGPT Vast bootstrap starting..."

# ---- system deps ----
apt-get update
apt-get install -y git docker.io docker-compose-plugin

# ---- enable docker ----
systemctl enable docker || true
systemctl start docker || true

# ---- clone repo if missing ----
if [ ! -d ghost-inference-training ]; then
  git clone https://github.com/hackdnmlm-max/ghost-inference-training.git
fi

cd ghost-inference-training

echo "🐳 Building containers..."
docker compose up --build -d

echo "✅ GhostGPT stack is live"
echo "👉 Test: curl localhost:8000/health || true"
