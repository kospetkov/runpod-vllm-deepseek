#!/usr/bin/env bash
set -euo pipefail

echo "Starting vLLM with trust-remote-code support..."

# MODEL_ID приоритетнее, затем MODEL_NAME
MODEL="${MODEL_ID:-${MODEL_NAME:-}}"
: "${MODEL:?Set MODEL_ID or MODEL_NAME env var}"

# Приватные/квотируемые репы
if [[ -n "${HF_TOKEN:-}" ]]; then
  export HUGGING_FACE_HUB_TOKEN="$HF_TOKEN"
fi

VLLM_HOST="${VLLM_HOST:-0.0.0.0}"
VLLM_PORT="${VLLM_PORT:-8000}"
MAX_LEN="${MAX_MODEL_LEN:-131072}"
GPU_UTIL="${GPU_MEMORY_UTILIZATION:-0.90}"
EXTRA_ARGS=${VLLM_ARGS:-}

echo "Model: $MODEL"
echo "Host: $VLLM_HOST  Port: $VLLM_PORT  MaxLen: $MAX_LEN  GPU util: $GPU_UTIL"
echo "Extra args: ${EXTRA_ARGS}"

exec python -m vllm.entrypoints.openai.api_server \
  --model "$MODEL" \
  --host "$VLLM_HOST" \
  --port "$VLLM_PORT" \
  --trust-remote-code \
  --max-model-len "$MAX_LEN" \
  --gpu-memory-utilization "$GPU_UTIL" \
  $EXTRA_ARGS
