setwd(choose.dir(default = setwd("Z:/Groups/LAB-titus004/AnnikaSchroder/Analysis/191122- chemotaxis G120 G121"), caption = "Select folder with StimResults files"))
rm(list=ls())
library(data.table)
library(tidyr)



all_folders<-list.dirs(path = ".", full.names = TRUE, recursive = FALSE)
dir.create("Tidy_data")

for (folder in all_folders){

  setwd(folder)
  setwd("./Output")
  
#save the names of the files you want to import
file_name <- list.files(path = ".", pattern="csv",full.names = FALSE, recursive = FALSE) #where you have your files
keep <- c("ID", "X.origin","Y.origin") #columns we want to keep

  temp <- read.csv(file_name) # read in files
  temp <- temp[keep] # save only the columns we want (defined above)
  temp <-na.omit(temp) # remove NAs
  keys <- colnames(temp)[!grepl("Y.origin",colnames(temp))] # save colnames of key columns, aka not It.Norm
  X <- as.data.table(temp)
  # if there is a duplicate cell for each time point, find the average
  temp2 <- X[,list(Y.origin=Y.origin),keys]
  temp3 <- spread(temp2,ID,Y.origin)
  protein <-unlist(strsplit(file_name[1],split = "_"))[1]
  expt <- unlist(strsplit(folder,split = "./"))[2]
 
} 

write.csv(temp3,paste0("Tidy_data/",protein,"_",expt,"forplot.csv"))
