import subprocess

model = "llama_7b"
mode = "plugin"
log_level = "info"

engine_dir = '../../examples/llama/tmp/llama/7B/trt_engines/int4_GPTQ/1-gpu/'

dir_name = "llama7b_int4_gptq"
import os
if not os.path.exists(dir_name):
    os.makedirs(dir_name)
    print("The bench result folder has been created.")
else:
    print("The bench result folder already exists.")
enable_cuda_graph = True

batch_sizes = "1;4;8"
input_output_lens = [
    "128,128",
    "128,512",
    "512,512",
]

for input_output_len in input_output_lens:
    for batch_size in batch_sizes.split(';'):
        command = f"python3 benchmark.py \
            --model {model} \
            --mode {mode} \
            --batch_size \"{batch_size}\" \
            --input_output_len \"{input_output_len}\" \
            --log_level \"{log_level}\" \
            --engine_dir {engine_dir} \
            {'--enable_cuda_graph' if enable_cuda_graph else ''}"
        #print(command)

        log_file = dir_name+ f"_{batch_size}_{input_output_len.replace(',', '_')}.log"
        log_file_dir = os.path.join(dir_name,log_file)
        print('The log will be saved in', log_file_dir)
        subprocess.call(f"{command} > {log_file_dir} 2>&1", shell=True)