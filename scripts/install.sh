#!/bin/bash
#$ -l rt_AG.small=1
#$ -l h_rt=1:00:00
#$ -j y
#$ -o outputs/install/
#$ -cwd

# module load
source /etc/profile.d/modules.sh
module load cuda/12.1/12.1.1
module load cudnn/8.9/8.9.5
module load nccl/2.18/2.18.3-1
module load hpcx/2.12

# python virtualenv
source .env/bin/activate

# pip install
pip install --upgrade pip
pip install -r requirements.txt

pip install ninja wheel packaging

# flash-attention install
pip install flash-attn --no-build-isolation
