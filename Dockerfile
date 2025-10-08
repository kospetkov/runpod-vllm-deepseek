FROM runpod/worker-vllm:stable-cuda12.1.0

ENV PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_DEFAULT_TIMEOUT=100 \
    HF_HUB_ENABLE_HF_TRANSFER=1 \
    PYTHONUNBUFFERED=1

# Обновляем окружение вокруг, но НЕ трогаем vLLM
RUN pip install -U "pip<25" "setuptools<75" wheel \
 && pip install -U "transformers==4.45.2" "accelerate>=0.34" "huggingface_hub>=0.24" "einops>=0.8"

COPY start_vllm.sh /start_vllm.sh
RUN chmod +x /start_vllm.sh

ENTRYPOINT ["/start_vllm.sh"]
