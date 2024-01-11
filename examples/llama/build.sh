#/!bin/bash

mkdir -p ./tmp/llama/7B/trt_engines/int4_GPTQ/1-gpu/

python3 build.py --model_dir $WORK_DIR/llama-2-7b-chat-hf/ \
                --quant_ckpt_path $WORK_DIR/llama-7b-4bit-gs128.safetensors \
                --dtype float16 \
                --remove_input_padding \
                --use_gpt_attention_plugin float16 \
                --use_gemm_plugin float16 \
                --use_weight_only \
                --weight_only_precision int4_gptq \
                --per_group \
                --enable_context_fmha \
                --output_dir ./tmp/llama/7B/trt_engines/int4_GPTQ/1-gpu/ \
                --visualize \
                --use_rmsnorm_plugin \
		--use_lookup_plugin float16 \
                --log_level verbose
