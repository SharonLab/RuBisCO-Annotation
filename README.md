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

### 3. Final sequence processing
