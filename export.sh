#/bin/bash
parent_dir=$(dirname $(pwd))
echo "parent_dir is ${parent_dir}"
sudo apt-get install python3-pip
sudo apt install git
# TensorRT_path=/home/nvcntse/qgai/jingwei_station/TensorRT-8.6.11.4 ${TensorRT_path}/bin: ${TensorRT_path}/lib:
export PATH=/home/$USER/.cargo/bin:${parent_dir}/cmake-4.28.1-linux-aarch64/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/bin
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/lib/
export CPATH=/usr/local/cuda/targets/aarch64-linux/include:$CPATH