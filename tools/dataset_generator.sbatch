#!/bin/bash

#SBATCH --partition=2080Ti
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --exclude=asimov-209

source /mnt/home/v_wangweiyao/anaconda3/etc/profile.d/conda.sh
conda activate peract

module load xvfb
Xvfb :1234 -screen 0 1024x768x24 +extension GLX +render -noreset & export DISPLAY=:1234

# PERACT_ROOT="/mnt/data/yutian/peract/"
PERACT_ROOT="/mnt/data/v_wangweiyao/hive"

python dataset_generator.py --tasks=$1 \
                            --save_path=$PERACT_ROOT/train_demos \
                            --image_size=128,128 \
                            --renderer=opengl \
                            --episodes_per_task=100 \
                            --processes=1 \
                            --variations=1