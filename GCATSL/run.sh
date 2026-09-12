#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="gcatsl-repo"
PLATFORM="linux/amd64"

mkdir -p output

docker build --platform "$PLATFORM" -t "$IMAGE_NAME" .

docker run --platform "$PLATFORM" -it \
  -v "$(pwd)/output:/app/output" \
  "$IMAGE_NAME" \
  python source/main.py \
  --n_epoch 600 \
  --n_head 2 \
  --n_fold 5 \
  --n_node 6375 \
  --n_feature 3 \
  --learning_rate 0.005 \
  --weight_decay 0.0001 \
  --dropout 0.7 \
  --input_dir data/toy_examples/ \
  --output_dir output/ \
  --log_dir output/