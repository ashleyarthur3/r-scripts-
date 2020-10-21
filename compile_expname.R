df=NULL
#save the names of the files you want to import
file_names <- dir(setwd(choose.dir(default = "s:/Groups/LAB-titus004/AshleyArthur/Microscopy/Image Analysis/", caption = "Select folder with .csv compiled"))) #where you have your files
#combines all the csv files and adds a column at the end with the name of the file the data came from
df <- do.call(rbind, lapply(file_names, function(x) cbind(read.csv(x), name=strsplit(x,'\\.')[[1]][1])))
#saves name of your directory as variable dir_name
dir_name<-basename(getwd())
#save the final compiled document
write.csv(df, paste0(dir_name, '_compiled.csv'))

