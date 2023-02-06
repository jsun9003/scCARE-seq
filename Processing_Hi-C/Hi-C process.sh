##############################################################################################################
#TrimGalore
##############################################################################################################
mkdir QualityControl
cd QualityControl
trim_galore.py -i ../rawdata/*.gz 1>Hi-C.txt 2>Hi-C.log -o Clean &


##############################################################################################################
#Prepare for HiC-Pro
##############################################################################################################
cd ../
mkdir data
cd data
#e.g. serum_H_132
mkdir serum_H_132
ln -s ../../QualityControl/Clean/ValReads/serum_H_132.1.fq.gz serum_H_132/serum_H_132_R1.fastq.gz
ln -s ../../QualityControl/Clean/ValReads/serum_H_132.2.fq.gz serum_H_132/serum_H_132_R2.fastq.gz


##############################################################################################################
#HiC-Pro MboI
##############################################################################################################
cd ../
#mm10
mkdir HiC-Pro_mm10
cd HiC-Pro_mm10

HiC-Pro -i ../data/ -o HiC-Pro-Test -c /data1/jlqu/mboi-mm10-config-scCARE-seq.txt 1>Hi-C-pro-test.txt 2>Hi-C-pro-test.log
