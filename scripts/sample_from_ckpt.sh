#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <CKPT_PATH> <MODEL_NAME> <TAG> [CFG_SCALE] [SAMPLING_STEPS] [VAE]"
  echo "Example: $0 /path/to/0500000.pt DiT-L/2 l2_step50k 4.0 250 mse"
  exit 1
fi

CKPT_PATH="$1"
MODEL_NAME="$2"
TAG="$3"
CFG_SCALE="${4:-4.0}"
SAMPLING_STEPS="${5:-250}"
VAE="${6:-mse}"
GPU="${GPU:-0}"

OUTDIR="${OUTDIR:-outputs}"
mkdir -p "$OUTDIR"

echo "[INFO] Sampling checkpoint=$CKPT_PATH model=$MODEL_NAME cfg=$CFG_SCALE steps=$SAMPLING_STEPS vae=$VAE gpu=$GPU"

CUDA_VISIBLE_DEVICES="$GPU" python sample.py \
  --model "$MODEL_NAME" \
  --image-size 256 \
  --num-classes 1000 \
  --ckpt "$CKPT_PATH" \
  --cfg-scale "$CFG_SCALE" \
  --num-sampling-steps "$SAMPLING_STEPS" \
  --vae "$VAE" \
  --seed 0

mv -f sample.png "$OUTDIR/${TAG}_sample.png"
echo "[INFO] Wrote $OUTDIR/${TAG}_sample.png"
