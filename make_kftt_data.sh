#!/bin/bash
# Fri Nov 29 13:34:09 2019 by Masaaki Nagata
# modified Thu Nov 26 19:07:45 2020 by Masaaki Nagata

KFTT_ALIGN_DIR=./data/datasets/kftt-alignments
ALIGN=$KFTT_ALIGN_DIR/data
ORIG=$KFTT_ALIGN_DIR/original

for i in {1..15};
do
    id=$(printf "%03d" $i)
    echo $id
    paste $ALIGN/japanese-$id.txt $ALIGN/english-$id.txt $ALIGN/align-$id.txt \
	  $ORIG/japanese-$id.txt $ORIG/english-$id.txt \
	  > ./kftt-$id.txt
done

mkdir ./data/pre_processed_data/kftt_training



cat ./kftt-00[1-8].txt > ./data/pre_processed_data/kftt_training/kftt_dev.txt
cat ./kftt-009.txt ./kftt-01[0-2].txt > ./data/pre_processed_data/kftt_training/kftt_devtest.txt
cat ./kftt-01[3-5].txt > ./data/pre_processed_data/kftt_training/kftt_test.txt

rm ./kftt-0*.txt