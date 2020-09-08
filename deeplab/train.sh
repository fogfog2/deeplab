
# Exit immediately if a command exits with a non-zero status.
set -e

# Move one-level up to tensorflow/models/research directory.
cd ..

# Update PYTHONPATH.
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

# Set up the working environment.
CURRENT_DIR=$(pwd)
WORK_DIR="./deeplab"

# Go to datasets folder and download PASCAL VOC 2012 segmentation dataset.
DATASET_DIR="datasets"

# Go back to original directory.
cd "${CURRENT_DIR}"

# Set up the working directories.
PASCAL_FOLDER="pascal_voc_seg"
EXP_FOLDER="exp/train_on_trainaug_set"
INIT_FOLDER="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/init_models"



################################################################

PASCAL_DATASET="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/tfrecord_coco"
NUM_ITERATIONS=120000
INIT_CHECKPOINT="${INIT_FOLDER}/rexnet/model.ckpt-4052850" 
TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_c"


python "${WORK_DIR}"/train.py \
  --logtostderr \
  --train_split="train" \
  --model_variant="rexnet" \
  --output_stride=32 \
  --train_crop_size="513,513" \
  --train_batch_size=12 \
  --learning_policy="poly" \
  --base_learning_rate=0.01 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --fine_tune_batch_norm=true \
  --tf_initial_checkpoint="${INIT_CHECKPOINT}" \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}" \
  --bisenet_mode_a="c" \
  --bisenet_depth=256 \
  --use_feature_fusion_module=false


cp -r "${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_c" "${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_c1"
cp -r "${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_c" "${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_c2"



TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_d"
python "${WORK_DIR}"/train.py \
  --logtostderr \
  --train_split="train" \
  --model_variant="rexnet" \
  --output_stride=16 \
  --train_crop_size="513,513" \
  --train_batch_size=12 \
  --learning_policy="poly" \
  --base_learning_rate=0.01 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --fine_tune_batch_norm=true \
  --tf_initial_checkpoint="${INIT_CHECKPOINT}" \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}" \
  --bisenet_mode_a="c" \
  --bisenet_depth=256 \
  --use_feature_fusion_module=true

cp -r "${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_d" "${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_d1"
cp -r "${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_d" "${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_d2"


###########################################################################################################################

PASCAL_DATASET="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/tfrecord"
NUM_ITERATIONS=150000
TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_c1"

python "${WORK_DIR}"/train.py \
  --logtostderr \
  --train_split="train" \
  --model_variant="rexnet" \
  --output_stride=32 \
  --train_crop_size="513,513" \
  --train_batch_size=12 \
  --learning_policy="poly" \
  --base_learning_rate=0.001 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --fine_tune_batch_norm=false \
  --tf_initial_checkpoint="${INIT_CHECKPOINT}" \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}" \
  --bisenet_mode_a="c" \
  --bisenet_depth=256 \
  --use_feature_fusion_module=false


TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_c2"

python "${WORK_DIR}"/train.py \
  --logtostderr \
  --train_split="train" \
  --model_variant="rexnet" \
  --output_stride=32 \
  --train_crop_size="513,513" \
  --train_batch_size=12 \
  --learning_policy="poly" \
  --base_learning_rate=0.005 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --fine_tune_batch_norm=false \
  --tf_initial_checkpoint="${INIT_CHECKPOINT}" \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}" \
  --bisenet_mode_a="c" \
  --bisenet_depth=256 \
  --use_feature_fusion_module=false

###########################################################################################################################

PASCAL_DATASET="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/tfrecord"
NUM_ITERATIONS=150000
TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_d1"

python "${WORK_DIR}"/train.py \
  --logtostderr \
  --train_split="train" \
  --model_variant="rexnet" \
  --output_stride=32 \
  --train_crop_size="513,513" \
  --train_batch_size=12 \
  --learning_policy="poly" \
  --base_learning_rate=0.001 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --fine_tune_batch_norm=false \
  --tf_initial_checkpoint="${INIT_CHECKPOINT}" \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}" \
  --bisenet_mode_a="c" \
  --bisenet_depth=256 \
  --use_feature_fusion_module=true


TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test25_d2"

python "${WORK_DIR}"/train.py \
  --logtostderr \
  --train_split="train" \
  --model_variant="rexnet" \
  --output_stride=32 \
  --train_crop_size="513,513" \
  --train_batch_size=12 \
  --learning_policy="poly" \
  --base_learning_rate=0.005 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --fine_tune_batch_norm=false \
  --tf_initial_checkpoint="${INIT_CHECKPOINT}" \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}" \
  --bisenet_mode_a="c" \
  --bisenet_depth=256 \
  --use_feature_fusion_module=true

