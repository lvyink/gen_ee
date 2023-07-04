#!/usr/bin/env bash
set -e 
set -x 
DATA_DIR=data/ace_en
MODEL=constrained-gen
CKPT_NAME=constrained-gen-ACE 


rm -rf checkpoints/${CKPT_NAME}
python train.py --model=${MODEL} --ckpt_name=${CKPT_NAME} \
    --dataset=ACE \
    --tmp_dir=preprocessed_ACE \
    --train_file=${DATA_DIR}/train.jsonl \
    --val_file=${DATA_DIR}/dev.jsonl \
    --test_file=${DATA_DIR}/test.jsonl \
    --train_batch_size=4 \
    --eval_batch_size=4 \
    --learning_rate=3e-5 \
    --accumulate_grad_batches=4 \
    --num_train_epochs=6 \
    --mark_trigger 
