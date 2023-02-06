
# scCARE-seq: a single-cell multimodal omics method for simultaneously detecting chromatin architecture and mRNA expression by sequencing

Three-dimensional (3D) chromatin structure plays a crucial role in development and diseases, and these biological processes are associated with transcription. However, heterogeneity was exhibited in both single-cell chromatin architecture and transcription, thus the regulatory relationship between 3D chromatin structure and gene expression is difficult to interpret based on population methods. Here we developed a single-cell multimodal omics method for simultaneously detecting chromatin architecture and mRNA expression by sequencing (scCARE-seq). Applying scCARE-seq to examine chromatin architecture and transcriptome from naïve to primed single mouse embryonic stem cells (mESCs), we observed the coactivation between 3D chromatin structure and expression in the cell fate transition. In addition, we defined cell cycle phase of each cell through chromatin architecture, and found that 3D chromatin structure periodic changes were in parallel with transcription during the cell cycle. These findings indicate that scCARE-seq enables comprehensive analysis of chromatin architecture and transcription in the same single cell.

--------------------------

![figs/overview.jpg](https://github.com/jsun9003/scCARE-seq/blob/main/figs/overview.jpg)

# Preprocessing of scCARE-seq datasets

#### Please have the following softwares installed first:
- bowtie2, http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
- samtools, http://www.htslib.org/
   samtools version >= 1.3.1 is required.
- Trim_galore, https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/
- STAR, https://github.com/alexdobin/STAR
- sci-CAR, https://github.com/JunyueC/sci-CAR_analysis
- HiC-Pro, https://github.com/nservant/HiC-Pro
- Higashi, https://github.com/ma-compbio/Higashi
- DeepLoop, https://github.com/JinLabBioinfo/DeepLoop
- Optional: FastQC, https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
-           HiCExplorer, https://hicexplorer.readthedocs.io/en/latest/

# Additional Tutorial
- [Higashi-analysis for HiC (Zhang et al. Nature biotechnology, 2022)](https://github.com/ma-compbio/Higashi)
- [Loop-analysis for HiC (Zhang et al. Nature Genetics, 2022)](https://github.com/JinLabBioinfo/DeepLoop)
- [sci-CAR_analysis for RNA (Cao et al. Science, 2018)](https://github.com/JunyueC/sci-CAR_analysis)

# Analysis of scCARE-seq datasets include the following steps:

## 1. Single cell HiC analysis for the HiC partion
### TrimGalore
`mkdir QualityControl`

`cd QualityControl`

`trim_galore.py -i ../rawdata/*.gz 1>Hi-C.txt 2>Hi-C.log -o Clean &`

### Prepare for HiC-Pro
`cd ../`

`mkdir data`

`cd data`

#e.g. serum_H_132

`mkdir serum_H_132`

`ln -s ../../QualityControl/Clean/ValReads/serum_H_132.1.fq.gz serum_H_132/serum_H_132_R1.fastq.gz`

`ln -s ../../QualityControl/Clean/ValReads/serum_H_132.2.fq.gz serum_H_132/serum_H_132_R2.fastq.gz`

`cd ../`

`mkdir HiC-Pro_mm10`

`cd HiC-Pro_mm10`

`HiC-Pro -i ../data/ -o HiC-Pro-Test -c /data1/jlqu/mboi-mm10-config-scCARE-seq.txt 1>Hi-C-pro-test.txt 2>Hi-C-pro-test.log`

#result summary of HiC-pro

`perl Processing_Hi-C/hicpro_summary_trans.pl HiC-Pro-Test > serum_H_132_summary.txt`

## 2. Single cell RNA-seq analysis for the RNA partion

`sh Processing_RNA/record_scRNA_seq_pipeline.sh`

# Cite

Cite our paper by

```
@article {Qu2022multiscale,
	author = {Jiale Qu and Jun Sun},
	title = {Simultaneous profiling of chromatin architecture and transcription in single cells},
	year={2022},
	publisher = {Nature Publishing Group},
	journal = {Under Submited}
}
```



# Contact

Please contact o.sj@live.com or raise an issue in the github repo with any questions about installation or usage. 
