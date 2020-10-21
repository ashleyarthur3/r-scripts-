setwd(choose.dir(default = "s:/Groups/LAB-titus004/AshleyArthur/Microscopy/", caption = "Select folder"))
#setwd(choose.dir(default = "Z:/Groups/LAB-titus004/Microscopy/Marianas/2015/Q3", caption = "Select folder"))
exp_name<-basename(getwd())

slices <- list.dirs(path = ".", full.names = FALSE, recursive = FALSE)
df=NULL
for (i in 1:length(slices)){
setwd(slices[i])
df <- rbind(df, read.csv("analysis-results-7.csv", header=T))
setwd("..")
}

write.csv(df, paste0(exp_name, '_compiled.csv'))

# to save into a master directory
#setwd(choose.dir(default = "Z:/Groups/LAB-titus004/AshleyArthur/Microscopy/Image Analysis/20180302_i201_ccpro", caption = "Select folder for saving file"))
#write.csv(df, paste0(exp_name, '_compiled.csv'))
