##############################################################################################################
#Generate single cell .cool file
##############################################################################################################
mkdir sc-cool
cd sc-cool
echo '#!/bin/bash' >sc-cool.sh
for i in {1..192};do echo "hicConvertFormat -m /data1/jlqu/project/CARE-seq/20210601-CARE-seq-sc/all_data/sc/HiC/HiC-Pro_mm10/HiC-Pro-Test/hic_results/matrix/2i_H_${i}/raw/500000/2i_H_${i}_500000.matrix --bedFileHicpro /data1/jlqu/project/CARE-seq/20210601-CARE-seq-sc/all_data/sc/HiC/HiC-Pro_mm10/HiC-Pro-Test/hic_results/matrix/2i_H_${i}/raw/500000/2i_H_${i}_500000_abs.bed --inputFormat hicpro --outputFormat cool -o 2i_H_${i}_500K.cool &" >> sc-cool.sh;done;

for i in {1..192};do echo "hicConvertFormat -m /data1/jlqu/project/CARE-seq/20210601-CARE-seq-sc/all_data/sc/HiC/HiC-Pro_mm10/HiC-Pro-Test/hic_results/matrix/serum_H_${i}/raw/500000/serum_H_${i}_500000.matrix --bedFileHicpro /data1/jlqu/project/CARE-seq/20210601-CARE-seq-sc/all_data/sc/HiC/HiC-Pro_mm10/HiC-Pro-Test/hic_results/matrix/serum_H_${i}/raw/500000/serum_H_${i}_500000_abs.bed --inputFormat hicpro --outputFormat cool -o serum_H_${i}_500K.cool &" >> sc-cool.sh;done;

bash sc-cool.sh


##############################################################################################################
#Single cell .cool for normalization VC
##############################################################################################################
mkdir VCNorm
echo '#!/bin/bash' >sc-VC-cool.sh
for i in {1..192};do echo "hicConvertFormat -m 2i_H_${i}_500K.cool --inputFormat cool --outputFormat cool -o ./VCNorm/2i_H_${i}_500K_VC.cool --correction_name VC &" >> sc-VC-cool.sh;done;
for i in {1..192};do echo "hicConvertFormat -m serum_H_${i}_500K.cool --inputFormat cool --outputFormat cool -o ./VCNorm/serum_H_${i}_500K_VC.cool --correction_name VC &" >> sc-VC-cool.sh;done;

bash sc-VC-cool.sh



