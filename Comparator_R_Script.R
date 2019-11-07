library(ape)
library(pegas)
library(seqinr)

#Xe_and_Xp
#setwd("/Users/julius/Desktop/test_gene_split/Genes")

#Xe only
setwd("/Users/julius/Desktop/Xe_Only_Comparator/Genes")

#Xp LH3 only
setwd("/Users/julius/Desktop/Xp_LH3_Comparator/Genes")

#XP 91-118 only
setwd("/Users/julius/Desktop/Xp_91-118_Comparator/Genes")

#-----------------------------------------------------
### Testing A Single Gene
#-----------------------------------------------------
gene_name = "IS_RS14265.aln"
x = read.alignment(file =(gene_name), format = "clustal")
x = as.DNAbin.alignment(x)

Results = tajima.test(x)
Result_df = as.data.frame(Results)
Results_df = rbind(Results_df,Result_df)

#-----------------------------------------------------
### All Genes
#-----------------------------------------------------

#Create Empty Dataframe to append new rows
Results_df = data.frame(D = numeric(0), Pval.normal = numeric(0), Pval.beta = numeric(0), gene = character(0) )

#Loop through each file, calculate Tajima's D, append gene name, transform to df, append to Results_df
filenames = dir(pattern = "*.aln")

for (f in filenames) {
  cat("Currently Processing: ", f, "\n")
  x = read.alignment(file =(f), format = "clustal")
  x = as.DNAbin.alignment(x)

  Results = tajima.test(x) 
  Results [["gene"]] = f
  
  Result_df = as.data.frame(Results)
  Results_df = rbind(Results_df,Result_df)
}

write.csv(Results_df,"test_results.csv", row.names = F)

