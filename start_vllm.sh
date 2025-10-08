#!/bin/bash
set -e

echo "Starting vLLM with trust-remote-code support..."
echo "Model: ${MODEL_NAME}"

python -m vllm.entrypoints.openai.api_server \
    --model "${MODEL_NAME}" \
    --trust-remote-code \
    --max-model-len "${MAX_MODEL_LEN:-32768}" \
    --gpu-memory-utilization "${GPU_MEMORY_UTILIZATION:-0.9}" \
    --host 0.0.0.0 \
    --port 8000


