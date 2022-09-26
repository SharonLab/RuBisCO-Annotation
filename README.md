# RuBisCO Annotation
Thie repository contains the files that were used to annotate the RuBisCO sequences for the RuBisCOlympics project.

## Process
Analysis process consists of the following steps:

### 1. Sequence collection
RuBisCO sequences were collected from the following sources:
- NCBI's nr database, database was downloaded on December 2020 and searched as described in [Davidi et al., 2020](https://www.embopress.org/doi/full/10.15252/embj.2019104081).
- Local assemblies of the 244 samples from the Tara Ocean expedition
- Various assemblies downloaded from [ggkbase](https://ggkbase.berkeley.edu/), from [Wrighton et al., 2012](https://www.science.org/doi/abs/10.1126/science.1224041), [Brown et al., 2015](https://www.nature.com/articles/nature14486) and [Anantharaman et al., 2016](https://www.nature.com/articles/ncomms13219)
- Sequences from [Tabita et al., 2008](https://royalsocietypublishing.org/doi/abs/10.1098/rstb.2008.0023)
- Sequences from [Banda et al., 2020](https://www.nature.com/articles/s41477-020-00762-4)

### 2. Preliminary Sequence processing
1. Only sequences with lengths between 300-700 amino acids were considered
2. Sequences were clustered at 80% identity using usearch (v8.1.1861_i86linux64, parameters -cluster_fast -id 0.8)
3. Cluster representatives were aligned using mafft (v7.475, default parameters), columns with more than 95% gaps were removed using timal (v1.4.rev15, -gt 0.05)
4. Fasttree (v2.1.10, default parameters) was used to construct a tree for the MSA
5. Type I and Type IV RuBisCOs were identified based on annotated sequences. Eukaryotic Type I RuBisCOs were identified based on taxonomy provided with the sequences
6. Separate trees for non-eukaryotic Type I and Type IV RuBisCOs were created, sequences were annotated using sub-type annotations available in the data

This process resulted with the following RuBisCO sequences:
- 51,859 eukaryotic Type-I
- 4,302 non-eularyotic Type-I, most of them annotated to sub-types
- 74 Type II
- 24 Type II-III
- 515 Type III
- 4,659 Type IV, most of them annotated to sub-types
- 10,962 unknown
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

| Form        | # clusters |
| ----------- | ---------- |
| I-A         | 128        |
| I-B         | 20         |
| I-Banda     | 29         |
| I-CD1       | 285        |
| I-CD2       | 490        |
| I-NG1       | 15         |
| II-III      | 61         |
| II          | 258        |
| III         | 704        |
| IV-DeepYkr  | 492        |
| IV-GOS      | 127        |
| IV-NG1      | 67         |
| IV-NG2      | 91         |
| IV-NG3      | 120        |
| IV-NonPhoto | 843        |
| IV-Photo    | 121        |
| IV-Unknown  | 34         |
| IV-Ykr-2    | 211        |
| IV-Ykr      | 37         |
