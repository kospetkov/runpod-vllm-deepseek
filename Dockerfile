FROM runpod/worker-vllm:1.1.0preview-cuda12.1.0

# Установим последний vLLM с фиксами
RUN pip install --upgrade vllm transformers

# Переопределим entrypoint для поддержки trust-remote-code
ENV PYTHONUNBUFFERED=1

# Создадим wrapper скрипт
COPY start_vllm.sh /start_vllm.sh
RUN chmod +x /start_vllm.sh

CMD ["/start_vllm.sh"]