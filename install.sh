#/bin/bash
parent_dir=$(dirname $(pwd))
pip3 uninstall tensorrt-llm
echo "==== ${parent_dir}"
# TensorRT_path=/home/nvcntse/qgai/jingwei_station/TensorRT-8.6.11.4
python3 command_build_install.py 
# #--nccl_root ${parent_dir}/nccl/build --clean --clean --TensorRT_path=${TensorRT_path}
