#!/usr/bin/env bash
# 执行路径在模型库的根目录下
################################# 安装框架 如:
# install env
wget -c -q --no-proxy ${FLAG_TORCH_WHL_URL}
tar_file_name=$(echo ${FLAG_TORCH_WHL_URL} | awk -F '/' '{print $NF}')
dir_name=$(echo ${tar_file_name} | awk -F '.' '{print $1}')
tar xf ${tar_file_name}
rm -rf ${tar_file_name}
python -m pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple
python -m pip install ${dir_name}/*

python -m pip install -U openmim
mim install mmcv

python -m pip install -r requirement.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
# 下载数据集并解压
rm -rf datasets
wget -nc https://paddleocr.bj.bcebos.com/dygraph_v2.0/test/benchmark_train/datasets.tar
tar xf datasets.tar

export MASTER_ADDR="localhost"
export MASTER_PORT="6006"
