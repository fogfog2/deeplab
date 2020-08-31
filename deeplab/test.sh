
set -e
cd ..
CURRENT_DIR=$(pwd)
WORK_DIR="${CURRENT_DIR}/deeplab"

cd "${CURRENT_DIR}"
DATASET_DIR="datasets"
# Set up the working directories.
PASCAL_FOLDER="pascal_voc_seg"
#EXP_FOLDER="exp/train_on_trainaug_set"
EXP_FOLDER="exp/train_on_trainaug_set"

TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train_test23d_"
EVAL_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/eval"
VIS_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/vis"
EXPORT_DIR="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/export"


PASCAL_DATASET="${WORK_DIR}/${DATASET_DIR}/${PASCAL_FOLDER}/tfrecord"


python "${WORK_DIR}"/eval.py \
  --logtostderr \
  --eval_split="val" \
  --model_variant="mobilenet_v2" \
  --output_stride=16 \
  --eval_crop_size="513,513" \
  --checkpoint_dir="${TRAIN_LOGDIR}" \
  --eval_logdir="${EVAL_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}" \
  --max_number_of_evaluations=1

