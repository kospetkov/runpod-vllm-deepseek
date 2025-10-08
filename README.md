# vLLM Worker для DeepSeek-Coder с Trust Remote Code

Docker образ для RunPod Serverless с поддержкой `trust-remote-code`.

## Использование на RunPod

**Container Image:**
ghcr.io/kospetkov/runpod-vllm-deepseek:latest

**Environment Variables:**
```bash
MODEL_NAME=deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct
MAX_MODEL_LEN=32768
GPU_MEMORY_UTILIZATION=0.90
HF_HOME=/runpod-volume/huggingface
Поддерживаемые модели

deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct
Qwen/Qwen2.5-Coder-32B-Instruct-AWQ
Qwen/Qwen2.5-Coder-7B-Instruct

Локальный тест
bashdocker build -t vllm-deepseek .
docker run --gpus all -p 8000:8000 \
  -e MODEL_NAME=deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct \
  vllm-deepseek# runpod-vllm-deepseek
# runpod-vllm-deepseek
