#/!bin/bash
# With fp16 inference ENABLE_MULTI_DEVICE=0
NCCL_DEBUG=INFO  python3 run.py --max_output_len=1024 \
               --tokenizer_dir /home/nvcntse/anqliu/tekit_gqq/239_a100/llama-2-7b-chat-hf/ \
               --engine_dir=./tmp/llama/7B/trt_engines/int4_GPTQ/1-gpu/ | tee run.logs