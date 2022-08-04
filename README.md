
# scCARE-seq: a single-cell multimodal omics method for simultaneously detecting chromatin architecture and mRNA expression by sequencing

As a computational framework for scHi-C analysis, Higashi has the following features:

Three-dimensional (3D) chromatin structure plays a crucial role in development and diseases, and these biological processes are associated with transcription. However, heterogeneity was exhibited in both single-cell chromatin architecture and transcription, thus the regulatory relationship between 3D chromatin structure and gene expression is difficult to interpret based on population methods. Here we developed a single-cell multimodal omics method for simultaneously detecting chromatin architecture and mRNA expression by sequencing (scCARE-seq). Applying scCARE-seq to examine chromatin architecture and transcriptome from naïve to primed single mouse embryonic stem cells (mESCs), we observed the coactivation between 3D chromatin structure and expression in the cell fate transition. In addition, we defined cell cycle phase of each cell through chromatin architecture, and found that 3D chromatin structure periodic changes were in parallel with transcription during the cell cycle. These findings indicate that scCARE-seq enables comprehensive analysis of chromatin architecture and transcription in the same single cell.

--------------------------

![figs/overview.jpg](https://github.com/jsun9003/scCARE-seq/blob/main/figs/overview.jpg)

# Installation

We now have Higashi on conda.

`conda install -c ruochiz higashi`

It is recommended to have pytorch installed (with CUDA support when applicable) before installing higashi.

# Documentation
Please see [the wiki](https://github.com/ma-compbio/Higashi/wiki) for extensive documentation and example tutorials.

Higashi is constantly being updated, see [change log](https://github.com/ma-compbio/Higashi/wiki/Change-Log) for the updating history

# Tutorial
- [Higashi-analysis for HiC (Zhang et al.Nature biotechnology, 2022)](https://github.com/ma-compbio/Higashi)
- [sci-CAR_analysis for RNA (Cao et al.Science, 2018)](https://github.com/JunyueC/sci-CAR_analysis)

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

![figs/graphAbstract.jpg](https://github.com/jsun9003/scCARE-seq/blob/main/figs/graphAbstract.jpg)



# Contact

Please contact o.sj@live.com or raise an issue in the github repo with any questions about installation or usage. 
