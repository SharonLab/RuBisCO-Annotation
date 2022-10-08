# RuBisCO Annotation
Thie repository contains the files that were used to annotate the RuBisCO sequences for the RuBisCOlympics project.

## Repository contents
- **RuBisCO-annotation.ipynb**: code that was used to create the nwk file in the tree directory and the files in the for-tree and final directories. The process implemented is described in this README file. 
- **data**: files that were used for preliminary annotation of the sequences (see (1) below)
- **final**: the result of the process (see "Process output" below)
- **for-tree**: files generated for the tree construction (see (3) below)
- **tree**: the constructed tree (see (4) below and code in RuBisCO-annotation.ipynb) and the annotations based on the tree. The tree was annotated in [iTOL](https://itol.embl.de/).
- **versions**: software versions for software used in this project
- **preparing-raxml-tree-data.ipynb**: a jupyter notebook with the code for preparing the data for the raxml tree. Output was written to the directory for-raxml-tree.
- **for-raxml-tree**: data for the raxml tree that was prepared from the 0.8 clustering of the RuBisCOs. This is the output of preparing-raxml-tree-data.ipynb
- **raxml-tree**: everything related to the raxml tree of the 0.8 clustering. The file that was used for the iTOL tree is RAxML_bipartitionsBranchLabels.RuBisCO.300-700.0.8.faa.muscle_maxiters_100.aln.trimal_0.05.aln.raxml.nwk.

## Process
Analysis process consists of the following steps:

### 1. Sequence collection
RuBisCO sequences were previously collected from the following sources:
- NCBI's nr database. The database was downloaded on December 2020 and searched as described in [Davidi et al., 2020](https://www.embopress.org/doi/full/10.15252/embj.2019104081).
- In-house assemblies of the 244 samples from the Tara Oceans expedition ([Sunagawa et al., 2015](https://www.science.org/doi/full/10.1126/science.1261359)).
- Various assemblies from [Wrighton et al., 2012](https://www.science.org/doi/abs/10.1126/science.1224041), [Brown et al., 2015](https://www.nature.com/articles/nature14486) and [Anantharaman et al., 2016](https://www.nature.com/articles/ncomms13219).
- Sequences from [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023)
- Sequences from [Banda et al., 2020](https://www.nature.com/articles/s41477-020-00762-4)

### 2. Preliminary sequence processing
1. Only sequences with lengths between 300-700 amino acids were considered
2. Sequences were clustered at 80% identity using usearch (v8.1.1861_i86linux64, parameters -cluster_fast -id 0.8)
3. Cluster representatives were aligned using mafft (v7.475, default parameters), columns with more than 95% gaps were removed using timal (v1.4.rev15, -gt 0.05)
4. Fasttree (v2.1.10, default parameters) was used to construct a tree for the MSA
5. Type I and Type IV RuBisCOs were identified based on annotated sequences from [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) and [Banda et al., 2020](https://www.nature.com/articles/s41477-020-00762-4). Eukaryotic Type I RuBisCOs were identified based on taxonomy provided with the sequences
6. Separate trees for non-eukaryotic Type I and Type IV RuBisCOs were created, sequences were annotated using sub-type annotations available in the data
7. Annotated Type II, II-III and III RuBisCOs from NCBI were identified

This process resulted with the following RuBisCO sequences:
- 51,859 eukaryotic Type-I (in data/Type_I.Eukaryote.list)
- 4,302 non-eularyotic Type-I, most of them annotated to sub-types (in data/Type_I.non-Eukaryote.info.txt)
- 66 Type II (in data/Type_II.list)
- 24 Type II-III (in data/Type_II_III.list)
- 364 Type III (in data/Type_III.list)
- 4,659 Type IV, most of them annotated to sub-types (in data/Type_IV.info.txt)
- 11,121 unknown
Overall, our dataset consists of 72,395 sequences.

### 3. Creating a set of protein representatives for the tree
We used usearch to cluster the sequences into 90% similarity clusters. Each cluster was annotated based on its members. Annotations are either:
- Unknown: none of the members has an annotation
- X/Unknown: some of the clusters members are annotated as X, others are unknown
- X: all members are annotated as X
- Ambiguous: two or more non-unknown annotations

Overall, the process ended with 4,236 clusters:
- Unknown: 1,100 clusters
- X/Unknown: 282
- X: 2,820
- Ambiguous: 34

### 4. Tree construction
Each cluster representative was assigned a name based on its annotation+running index. For example: I-A.1, IV-Ykr-5, etc. 
The sequences were aligned using muscle (v3.8.1551) with parameter -maxiters 2 (as advised in the program's user manual for sets of thousands of sequences).
Next, positions with less than 5% amino acids were removed from the alignment using trimal (version 1.2rev59).
Finally, fasttree (v2.1.11) with default parameters was used to create the tree.

### 5. Assigning annotation to the sequences
The resulting tree was annotated using iTol. Sequences names were used for the annotations.
Resulting sets are

| Form        | # clusters | # sequences | Reference   |
| ----------- | ---------- | ----------- | ----------- |
| I-A         | 128        | 1,332       | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| I-B         | 20         | 584         | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| I-Banda     | 29         | 71          | [Banda et al., 2020](https://www.nature.com/articles/s41477-020-00762-4) |
| I-CD1       | 285        | 48,551      | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| I-CD2       | 490        | 14,499      | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| I-NG1       | 15         | 20          | New to this analysis |
| II-III      | 61         | 148         | [Wrighton et al., 2012](https://www.science.org/doi/abs/10.1126/science.1224041) |
| II          | 258        | 855         | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| III         | 704        | 1,249       | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| IV-DeepYkr  | 492        | 752         | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| IV-GOS      | 127        | 343         | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| IV-NG1      | 67         | 117         | New to this analysis |
| IV-NG2      | 91         | 175         | New to this analysis |
| IV-NG3      | 120        | 193         | New to this analysis |
| IV-NonPhoto | 843        | 2,703       | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| IV-Photo    | 121        | 231         | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| IV-Unknown  | 34         | 39          | New to this analysis |
| IV-Ykr-2    | 211        | 291         | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |
| IV-Ykr      | 37         | 67          | [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023) |

Notes:
- We could not distinguish between I-C and I-D
- I-CD is divided into two groups because the group appeared in two branches on the tree
- IV-Ykr-2 is separated from IV-Ykr because it appeared on a different brance

## Process output
- **final/RuBisCO.300-700.faa**: a fasta file of the 72,395 RuBisCO sequences with their annotation, marked by /RuBisCO_Form= in the sequence descriptions
- **final/RuBisCO.300-700.faa.csv**: information about each sequence:
  + membership: cluster membership in the 90% usearch clustering: S=seed, H=member
  + cluster: cluster ID
  + length: sequence length
  + pidentity: % identity to the seed
  + annotation_preliminary: annotation based on preliminary sequence processing
  + annotation: annotation based on the tree
- **final/RuBisCO.300-700.0.9.faa.csv**: cluster information:
  + size: cluster size
  + seed: cluster seed (marked as S in RuBisCO.300-700.faa.csv)
  + annotation_preliminary: annotation based on preliminary sequence processing and the process described above
  + type_ino: for ambiguous clusters, information about the different types
  + tree_name: name of representative (the seed) in the tree
  + annotation: annotation based on the tree

## Raxml tree
Raxml tree was created based on the 0.8 clustering of the RuBisCOs. 2,255 clusters are represented. The data was prepared using the preparing-raxml-tree-data.ipynb jupyter notebook and its output was written to for-raxml-tree. The tree itself is in the raxml-tree directory, including the code that was used to create it (run.sh) on the Linux server. In iTOL, only groups that are known from the literature were colored (All the NGx groups are our additions for new groups that do not correspond to anything that we found in the literature). Note the I-CD1 is probably form I-B and I-CD2 probably consists of I-C and I-D. 
