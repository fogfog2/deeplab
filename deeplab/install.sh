set -e

wget -nd -r -N ftp://192.168.0.51/tfrecord_coco_/ --user usera -P ./datasets/pascal_voc_seg/tfrecord_coco_/
wget -nd -r -N ftp://192.168.0.51/tfrecord/ --user usera -P ./datasets/pascal_voc_seg/tfrecord/
wget -nd -r -N ftp://192.168.0.51/init_models/mobilenet_v2_1.0_224/ --user usera -P ./datasets/pascal_voc_seg/init_models/mobilenet_v2_1.0_224/
wget -nd -r -N ftp://192.168.0.51/init_models/deeplabv3_mnv2_pascal_train_aug/ --user usera -P ./datasets/pascal_voc_seg/init_models/deeplabv3_mnv2_pascal_train_aug/





