
df=NULL
file_names <- dir(setwd(choose.dir(default = "S:/Groups/LAB-titus004/Previous Lab Members/Alex McQuown/Microscopy", caption = "Select folder with .csv compiled"))) #where you have your files
df <- do.call(rbind,lapply(file_names,read.csv, header = F))
dir_name<-basename(getwd())

write.csv(df, paste0(dir_name, '_all_files.csv'))
