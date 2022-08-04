
# scCARE-seq: a single-cell multimodal omics method for simultaneously detecting chromatin architecture and mRNA expression by sequencing

As a computational framework for scHi-C analysis, Higashi has the following features:

-  Higashi represents the scHi-C dataset as a **hypergraph**
     - Each cell and each genomic bin are represented as the cell node and the genomic bin node.
     - Each non-zero entry in the single-cell contact map is modeled as a hyperedge. 
     - The read count for each chromatin interaction is used as the attribute of the hyperedge. 
- Higashi uses a **hypergraph neural network** to unveil high-order interaction patterns within this constructed hypergraph.
- Higashi can produce the **embeddings** for the scHi-C for downstream analysis.
-  Higashi can **impute single-cell Hi-C contact maps**, enabling detailed characterization of 3D genome features such as **TAD-like domain boundaries** and **A/B compartment scores** at single-cell resolution.

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
