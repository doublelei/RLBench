source /mnt/home/v_wangweiyao/anaconda3/etc/profile.d/conda.sh
conda activate peract

module load xvfb
Xvfb :111 -screen 0 1024x768x24 +extension GLX +render -noreset & export DISPLAY=:111

# PERACT_ROOT="/mnt/data/yutian/peract/"
PERACT_ROOT="/mnt/data/v_wangweiyao/hive"

python dataset_generator.py --tasks=put_item_in_drawer \
                            --save_path=$PERACT_ROOT/train_demos \
                            --image_size=128,128 \
                            --renderer=opengl \
                            --episodes_per_task=1 \
                            --processes=1 \
                            --variations=1 \