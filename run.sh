#!/usr/bin/env bash

OUT_DIR1="permutations_of_letters1"
OUT_DIR2="permutations_of_letters_sort"

NUM_REDUCERS=10

hdfs dfs -rm -r -skipTrash ${OUT_DIR1} > /dev/null

yarn jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -D mapred.job.name="permutations_of_letters1" \
    -D mapreduce.job.reduces=$NUM_REDUCERS \
    -files mapper.py,reducer.py \
    -mapper ./mapper.py \
    -reducer ./reducer.py \
    -input /data/wiki/en_articles \
    -output ${OUT_DIR1} > /dev/null

hdfs dfs -rm -r -skipTrash ${OUT_DIR2} > /dev/null

yarn jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -D mapred.job.name="permutations_of_letters_sort" \
    -D mapreduce.job.reduces=1 \
    -D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
    -D stream.num.map.output.key.fields=2 \
    -D mapreduce.partition.keypartitioner.options=-k1nr \
    -D mapreduce.partition.keycomparator.options="-k1,2nr -k1" \
    -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
    -file mapper_sort.py -file reducer_sort.py \
    -mapper ./mapper_sort.py \
    -reducer ./reducer_sort.py \
    -input ${OUT_DIR1} \
    -output ${OUT_DIR2} > /dev/null

hdfs dfs -cat ${OUT_DIR2}/part* | head -n 10