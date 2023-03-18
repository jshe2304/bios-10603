install.packages("ggplot2")
library(ggplot2)

ns_per_frame <- 0.02

#
# RMSD Plot
#

rmsd_wild_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rmsd/1rtc-wild-rmsd.dat"
rmsd_s203n_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rmsd/1rtc-s203n-rmsd.dat"
rmsd_wild <- read.csv(file=rmsd_wild_file, sep=" ", header=FALSE)
rmsd_s203n <- read.csv(file=rmsd_s203n_file, sep=" ", header=FALSE)

rmsd_wild[,1] <- rmsd_wild[,1] * ns_per_frame
rmsd_s203n[,1] <- rmsd_s203n[,1] * ns_per_frame

colnames(rmsd_wild) = c('time', 'rmsd')
colnames(rmsd_s203n) = c('time', 'rmsd')

ggplot() + 
  geom_line(data=rmsd_wild, aes(x=time, y=rmsd, color='Wild')) + 
  geom_line(data=rmsd_s203n, aes(x=time, y=rmsd, color='S203N')) + 
  xlab('Time (ns)') + 
  ylab('RMSD') + 
  ggtitle('1RTC Wild and S203N Mutant RMSD') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

#
# RMSF Plot
#

rmsf_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rmsf/rmsf.dat"
rmsf <- read.table(file=rmsf_file, header=TRUE)

print (rmsf)

ggplot() + 
  geom_line(data=rmsf, aes(x=Residue, y=RMSF0, color="Wild")) + 
  geom_line(data=rmsf, aes(x=Residue, y=RMSF1, color="S203N")) + 
  xlab('Residue') + 
  ylab('RMSF') + 
  ggtitle('1RTC Wild and S203N Mutant RMSF') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue"))
  theme(legend.title=element_blank())





