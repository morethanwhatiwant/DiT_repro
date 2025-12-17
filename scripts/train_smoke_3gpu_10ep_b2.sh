#!/usr/bin/env bash
set -euo pipefail

DATA_PATH="${DATA_PATH:-/nas/datahub/imagenet}"
RESULTS_ROOT="${RESULTS_ROOT:-/nas/home/${USER}/dit_runs}"

GPUS="${GPUS:-4,5,6}"
NPROC="${NPROC:-3}"
EPOCHS="${EPOCHS:-10}"

MODEL="DiT-B/2"
RUN_NAME="smoke_b2_10ep"
OUT_DIR="${RESULTS_ROOT}/${RUN_NAME}"

echo "[INFO] SMOKE TRAIN $MODEL -> $OUT_DIR"
CUDA_VISIBLE_DEVICES="$GPUS" torchrun --nproc_per_node="$NPROC" train.py \
  --data-path "$DATA_PATH" \
  --results-dir "$OUT_DIR" \
  --model "$MODEL" \
  --image-size 256 \
  --num-classes 1000 \
  --epochs "$EPOCHS"
