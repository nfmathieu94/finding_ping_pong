#!/bin/bash -l
#SBATCH -p batch -c 8 --mem 30gb --out test_relocate.log
#SBATCH --mail-user=nmath020@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="find_ping"
#relocate=$current_dir/scripts/relocaTE2.py

CPU=8
# In preparation for turning this into an array job
#if [ $SLURM_CPUS_ON_NODE ]; then
#  CPU=$SLURM_CPUS_ON_NODE
#fi
#N=${SLURM_ARRAY_TASK_ID}
#if [ -z $N ]; then
#  N=$1
#fi
#if [ -z $N ]; then
#  echo "cannot run without a number provided either cmdline or --array in sbatch"
#  exit
#fi

module load relocate2 #Possibly need to make a different virtual environment
SAMPFILE=samples.csv
input=$(realpath repeat_RIL1) #Testing with data from just RIL1 to see if it will work
mkdir -p results
OUTDIR=$(realpath results)


scripts/PickPing.py --input $input --output $results


# WIP to use csv/tsv file to be used as an array job
#IFS=,
#tail -n +2 $SAMPFILE | sed -n ${N}p | while read RILNAME FILEBASE
#do
#  LEFT=$(ls $FASTQFOLDER/$FILEBASE | sed -n 1p)
#  RIGHT=$(ls $FASTQFOLDER/$FILEBASE | sed -n 2p)
#  echo "$LEFT $RIGHT for $FASTQFOLDER/$FILEBASE"
#  scripts/PickPing.py -1 $LEFT -2 $RIGHT --input $input --output $results/$RILNAME
#done
