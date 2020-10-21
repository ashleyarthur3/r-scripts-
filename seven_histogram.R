
par(mfrow=c(2,1))


filo1 <- read.table("g120_i112_Myoi_WT_nnz.txt")
colnames(filo1) = c("index", "fps1", "cell body intensity", "filo intesity")
attach(filo1)
mean1<-mean(fps1)
mean1
hist(fps1, freq=F, breaks=c(-0.5,0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5), xlab="# filopodia/cell", ylab="proportion", ylim=c(0,1),main="GFP_M7")

filo3 <- read.table("g120_i346_Myoi_Caax_nnz.txt")
colnames(filo3) = c("index", "fps3", "cell body intensity", "filo intesity")
attach(filo3)
summary(fps3)
mean3<-mean(fps3)

hist(fps3, freq=F, breaks=c(-0.5,0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5), xlab="# filopodia/cell", ylab="proportion", ylim=c(0,1),main="GFP_M7_MRY")

filo2 <- read.table("g120_i340_Myoi_WT.txt-1-fp-per-cell.txt")
colnames(filo2) = c("index", "fps2", "cell body intensity", "filo intesity")
attach(filo2)
summary(fps2)
hist(fps2, freq=F, breaks=c(-0.5,0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5), xlab="# filopodia/cell", ylab="proportion", xlim=c(0,8), ylim=c(0,1), main="M7_mCh")
mean2<-mean(fps2)
filo4 <- read.table("vaspnull_i74_Myoi_WT.txt-1-fp-per-cell.txt")
colnames(filo4) = c("index", "fps4", "cell body intensity", "filo intesity")
attach(filo4)
summary(fps4)
hist(fps4, freq=F, breaks=c(-0.5,0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5), xlab="# filopodia/cell", ylab="proportion",ylim=c(0,1),main="Vasp GFP_M7")
mean4<-mean(fps4)

filo5 <- read.table("vaspnull_i346_Myoi_CAAX.txt-1-fp-per-cell.txt")
colnames(filo5) = c("index", "fps5", "cell body intensity", "filo intesity")
attach(filo5)
summary(fps5)
mean5<-mean(fps5)
hist(fps5, freq=F, breaks=c(-0.5,0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5), xlab="# filopodia/cell", ylab="proportion",ylim=c(0,1),main="Vasp GFP_M7_MRY")

filo6 <- read.table("g120_i345_Myoi_MT.txt-1-fp-per-cell.txt")
colnames(filo6) = c("index", "fps6", "cell body intensity", "filo intesity")
attach(filo6)

hist(fps6, freq=F, breaks=c(-0.5,0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5), xlab="# filopodia/cell", ylab="proportion",ylim=c(0,1),main="MT_M7_mCh")
mean6<-mean(fps6)
GFPvRFP<- t.test(fps1,fps2)
GFPvMRY<-t.test(fps1,fps3)
RFPvMT<-t.test(fps2,fps6)
G120vVASP<-t.test(fps1,fps4)
G120MRYvVASPMRY<-t.test(fps3,fps5)
GFPvRFP
GFPvMRY
RFPvMT
G120vVASP
G120MRYvVASPMRY

par(mfrow=c(1,1))
means=cbind(mean1, mean3, mean2, mean4, mean5, mean6)
colnames(means) = c("M7", "MRY", "mCh", "Vsp-", "Vsp- MRY", "MT mCh")
attach(means)
head(means)
par(las=2)
barplot(means, main="Mean #FP/cell", ylab="fps/cell", ylim=c(0,1.6))


