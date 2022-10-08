#!/bin/bash

trimal_threshold=0.05
muscle_maxiters=100
filename=RuBisCO.300-700.0.8.faa
infile=RuBisCO.300-700.0.8.faa
alignment_file=$filename.muscle_maxiters_$muscle_maxiters.aln
trimal_file=$alignment_file.trimal_$trimal_threshold.aln
fasttree_file=$trimal_file.fasttree.nwk
raxmltree_file=$trimal_file.raxml.nwk

date > $alignment_file.stderr
muscle -in $infile -out $alignment_file -maxiters $muscle_maxiters -log $alignment_file.stdout 2>> $alignment_file.stderr
date >> $alignment_file.stderr
trimal -in $alignment_file -out temp.aln -gt 0.05
sed 's/ .*//' temp.aln > $trimal_file

fasttree < $trimal_file > $fasttree_file 2> $fasttree_file.stderr
raxmlHPC-PTHREADS-AVX -f a -m PROTGAMMALG -n $raxmltree_file -s $trimal_file -p 123456 -x 654321 -N 100 -T 80 > $raxmltree_file.stdout 2> $raxmltree_file.stderr

muscle 2>&1 |grep MUSCLE > versions
fasttree 2>&1 | grep "FastTree version" >> versions
trimal | grep Copyright >> versions 
raxmlHPC-PTHREADS-AVX -v | grep RAxML >> versions
