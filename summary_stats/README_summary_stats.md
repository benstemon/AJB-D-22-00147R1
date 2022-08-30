## Summary stats on vcf files
This directory contains a single script, which was used to produce summary stats for vcf files.
* `vcf_sumstats.py`. Output from this script was used to generate Appendix S2.

Usage:

``
python3 vcf_sumstats.py infile.vcf

#will output total samples, total RADtags, total SNPs, SNPs/sample, missing SNP proportion, and biallelic SNPs for a given vcf file.
``