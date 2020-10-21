setwd(choose.dir(default = "S:/Groups/LAB-titus004/AshleyArthur/Microscopy", caption = "Select folder"))

#setwd(choose.dir(default = "S:/Groups/LAB-titus004/Microscopy/Marianas/2015/Q3", caption = "Select folder"))
exp_name<-basename(getwd())

#list sliced directories
slices <- list.files(path = ".", full.names = FALSE, recursive = FALSE)

#check that all files have same dimensions and exclude slices that are too small
#dims <- NULL
#for (i in 1:length(slices)){
  #setwd(slices[i])
  #dims[i] <- ncol(read.csv("analysis-results-7.csv", header=T))
 # setwd("..")
#}

#bind together output files

df2=NULL
df2<-c("file", "filo count", "density", "area", "intensity")
for (i in 1:length(slices)){
df=NULL
df <- rbind(df, read.csv(slices[i], header=T))
filo_count<-nrow(df)-1
area<-df[1,2]
density_count<- (filo_count/area)*1000
intensity<-df[1,3]

data<-c(slices[i], filo_count, density_count, area, intensity)
df2<-rbind(df2, data)
}

write.csv(df2, paste0(exp_name, '_calculated.csv'), row.names=FALSE)


# to save into a master directory
#setwd(choose.dir(default = "S:/Groups/LAB-titus004/LiviaSongster/Analysis/", caption = "Select folder for saving file"))
#df <- subset(df, Cell.Perimeter..um. >10)
#write.csv(df, paste0(exp_name, '_trimmedcompiled.csv'), row.names=FALSE)

