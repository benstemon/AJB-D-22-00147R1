import sys
import numpy

infile = sys.argv[1]


#outfile = sys.argv[2]



def extract_cols(line):
    cols = line.replace('\n','').split('\t')
    if len(cols) < 2:
        return 'skip'
    elif cols[0] == '#CHROM':
        return 'skip'
    else:
        return cols


#track TOTAL missing snps
totalmissingsnp = 0
total_snps = 0
biallelic_snp = 0

radtaglist = []

snpdict = {}

with open(infile, 'r') as r_infile:
    for line in r_infile:
        cols = extract_cols(line)
        if cols != 'skip':
            indcols = cols[9:len(cols)]
            if cols[0] not in radtaglist:
                radtaglist.append(cols[0])
                
            if len(cols[3]) > 1 or len(cols[4]) > 1:
                total_snps += 1
                
            else:
                total_snps += 1
                biallelic_snp += 1
                
            for indcount, ind in enumerate(indcols):
                geno = ind.split(':')
                if geno[0] != './.':
                    if indcount in snpdict.keys():
                        snpdict[indcount] += 1
                    else:
                        snpdict[indcount] = 1
                elif geno[0] == './.':
                    totalmissingsnp += 1

totalmiss = totalmissingsnp/(float(len(indcols)) * float(total_snps))
snpmean = numpy.mean(snpdict.values())
stdevsnp = numpy.std(snpdict.values())

print('Total Samples:'+str(len(cols)-9))
print('Total RADtags:'+str(len(radtaglist)))
print('SNPs: '+str(total_snps))
print('SNPs/sample: '+str(snpmean)+' +- '+str(stdevsnp))


print('missing SNP proportion: '+str(totalmiss))
print('biallelic SNPs: '+str(biallelic_snp))



