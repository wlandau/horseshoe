#PBS -o out.txt
#PBS -e err.txt
#PBS -lnodes=1:ppn=16:gpu,walltime=72:00:00
# qsub -vs=script.R run.sh

cd $PBS_O_WORKDIR
echo $PBS_O_WORKDIR
make -j 2
