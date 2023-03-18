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
# Active Site RMSD
#

rmsd_wild_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rmsd/1rtc-wild-active-rmsd.dat"
rmsd_s203n_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rmsd/1rtc-s203n-active-rmsd.dat"
rmsd_wild <- read.table(file=rmsd_wild_file, header=TRUE)
rmsd_s203n <- read.table(file=rmsd_s203n_file, header=TRUE)

rmsd_wild[,1] <- rmsd_wild[,1] * ns_per_frame
rmsd_s203n[,1] <- rmsd_s203n[,1] * ns_per_frame

colnames(rmsd_wild) = c('time', 'rmsd')
colnames(rmsd_s203n) = c('time', 'rmsd')

ggplot() + 
  geom_line(data=rmsd_wild, aes(x=time, y=rmsd, color='Wild')) + 
  geom_line(data=rmsd_s203n, aes(x=time, y=rmsd, color='S203N')) + 
  xlab('Time (ns)') + 
  ylab('RMSD') + 
  ggtitle('1RTC Wild and S203N Mutant Active Site RMSD') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

#
# RG Plot
#

rg_wild_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rg/1rtc-wild-rg.dat"
rg_s203n_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rg/1rtc-s203n-rg.dat"

rg_wild <- read.table(file=rg_wild_file, header=TRUE)
rg_s203n <- read.table(file=rg_s203n_file, header=TRUE)

rg_wild[,1] <- rg_wild[,1] * ns_per_frame
rg_s203n[,1] <- rg_s203n[,1] * ns_per_frame

colnames(rg_wild) = c('time', 'rg')
colnames(rg_s203n) = c('time', 'rg')


ggplot() + 
  geom_line(data=rg_wild, aes(x=time, y=rg, color='Wild')) + 
  geom_line(data=rg_s203n, aes(x=time, y=rg, color='S203N')) + 
  xlab('Time (ns)') + 
  ylab('Radius of Gyration') + 
  ggtitle('1RTC Wild and S203N Mutant Radius of Gyration') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

#
# Active Site RG Plot
#

rg_wild_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rg/1rtc-wild-active-rg.dat"
rg_s203n_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rg/1rtc-s203n-active-rg.dat"

rg_wild <- read.table(file=rg_wild_file, header=TRUE)
rg_s203n <- read.table(file=rg_s203n_file, header=TRUE)

rg_wild[,1] <- rg_wild[,1] * ns_per_frame
rg_s203n[,1] <- rg_s203n[,1] * ns_per_frame

colnames(rg_wild) = c('time', 'rg')
colnames(rg_s203n) = c('time', 'rg')

ggplot() + 
  geom_line(data=rg_wild, aes(x=time, y=rg, color='Wild')) + 
  geom_line(data=rg_s203n, aes(x=time, y=rg, color='S203N')) + 
  xlab('Time (ns)') + 
  ylab('Radius of Gyration') + 
  ggtitle('1RTC Wild and S203N Mutant Active Site Radius of Gyration') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

#
# RMSF Plot
#

rmsf_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rmsf/1rtc-rmsf.dat"
rmsf <- read.table(file=rmsf_file, header=TRUE)

ggplot() + 
  geom_line(data=rmsf, aes(x=Residue, y=RMSF0, color="Wild")) + 
  geom_line(data=rmsf, aes(x=Residue, y=RMSF1, color="S203N")) + 
  xlab('Residue') + 
  ylab('RMSF') + 
  ggtitle('1RTC Wild and S203N Mutant RMSF') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue"))
theme(legend.title=element_blank())

#
# Active Site RMSF Plot
#

wild <- c(rep("Wild", 5), rep("S203N", 5))
rmsf0 <- c(rmsf[c(80, 123, 177, 180, 203), 2], rmsf[c(80, 123, 177, 180, 203), 3])
resname <- rep(c("TYR80", "TYR123", "GLU177", "ARG180", "SER203"), 2)

df <- data.frame(wild, rmsf0, resname)

colnames(df) <- c('Variant', 'rmsf', 'resname')

df$resname <- factor(df$resname, levels=c("TYR80", "TYR123", "GLU177", "ARG180", "SER203"))

ggplot(data=df, aes(fill=Variant, x=resname, y=rmsf)) + 
  geom_bar(stat="identity", position="dodge") + 
  ggtitle('1RTC Wild and S203N Mutant Active Site RMSF') + 
  xlab('Residue') + 
  ylab('RMSF')

#
# Salt Bridge (GLU177 - ARG180)
#

sb_wild_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/sb/1rtc-wild-sb-177-180.dat"
sb_s203n_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/sb/1rtc-s203n-sb-177-180.dat"

sb_wild <- read.table(file=sb_wild_file, header=FALSE)
sb_s203n <- read.table(file=sb_s203n_file, header=FALSE)

sb_wild[,1] <- sb_wild[,1] * ns_per_frame
sb_s203n[,1] <- sb_s203n[,1] * ns_per_frame

colnames(sb_wild) <- c('time', 'sb')
colnames(sb_s203n) <- c('time', 'sb')

ggplot() + 
  geom_line(data=sb_wild, aes(x=time, y=sb, color='Wild')) + 
  geom_line(data=sb_s203n, aes(x=time, y=sb, color='S203N')) + 
  xlab('Time (ns)') + 
  ylab('Salt Bridge Distance (A)') + 
  ggtitle('1RTC Wild and S203N Mutant GLU177-ARG180 Salt Bridge Distance') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

#
# H-Bonds Plot
#

hbonds_wild_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/hbonds/1rtc-wild-hbonds.dat"
hbonds_s203n_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/hbonds/1rtc-s203n-hbonds.dat"

hbonds_wild <- read.table(file=hbonds_wild_file, header=FALSE)
hbonds_s203n <- read.table(file=hbonds_s203n_file, header=FALSE)

hbonds_wild[,1] <- hbonds_wild[,1] * ns_per_frame
hbonds_s203n[,1] <- hbonds_s203n[,1] * ns_per_frame

colnames(hbonds_wild) = c('time', 'hbonds')
colnames(hbonds_s203n) = c('time', 'hbonds')

ggplot() + 
  geom_line(data=hbonds_wild, aes(x=time, y=hbonds, color='Wild'), alpha=1) + 
  geom_line(data=hbonds_s203n, aes(x=time, y=hbonds, color='S203N'), alpha=0.9) + 
  xlab('Time (ns)') + 
  ylab('Hydrogen Bond Count') + 
  ggtitle('1RTC Wild and S203N Mutant Hydrogen Bonds') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

mean(hbonds_wild[, 2])
mean(hbonds_s203n[, 2])

#
# Active Site H-Bonds Plot
#

hbonds_wild_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/hbonds/1rtc-wild-active-hbonds.dat"
hbonds_s203n_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/hbonds/1rtc-s203n-active-hbonds.dat"

hbonds_wild <- read.table(file=hbonds_wild_file, header=FALSE)
hbonds_s203n <- read.table(file=hbonds_s203n_file, header=FALSE)

hbonds_wild[,1] <- hbonds_wild[,1] * ns_per_frame
hbonds_s203n[,1] <- hbonds_s203n[,1] * ns_per_frame

colnames(hbonds_wild) = c('time', 'hbonds')
colnames(hbonds_s203n) = c('time', 'hbonds')

ggplot() + 
  geom_line(data=hbonds_wild, aes(x=time, y=hbonds, color='Wild'), alpha=1) + 
  geom_line(data=hbonds_s203n, aes(x=time, y=hbonds, color='S203N'), alpha=0.9) + 
  xlab('Time (ns)') + 
  ylab('Hydrogen Bond Count') + 
  ggtitle('1RTC Wild and S203N Mutant Active Site Hydrogen Bonds') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

mean(hbonds_wild[, 2])
mean(hbonds_s203n[, 2])

#
# Angles
#

angles_file <- "/Users/jshe/School/bios-10603/BIOS10603-Win2023-Lab-8/angles.dat"

angles <- read.table(file=angles_file, header=FALSE)

angles[,1] <- angles[,1] * ns_per_frame

colnames(angles) <- c('time', 'angle')

ggplot() + 
  geom_line(data=angles, aes(x=time, y=angle)) + 
  xlab('Time (ns)') + 
  ylab('Angle (degree)') + 
  ggtitle('Angle between Best Fit Line and Z-Axis for 1UBQ Large Helix')

#
# Mutant Helix Angles
#

angles_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/fitangle/mutant-helices-angles.dat"

angles <- read.table(file=angles_file, header=FALSE)

angles[,1] <- angles[,1] * ns_per_frame

colnames(angles) <- c('time', 'angle')

ggplot() + 
  geom_line(data=angles, aes(x=time, y=angle)) + 
  xlab('Time (ns)') + 
  ylab('Angle (degree)') + 
  ggtitle('Angle between S203N Mutant Helix and Wild-Type Helix')

print (angles)
mean(angles[1000:2143, 2])

#
# Protein Angles
#

angles_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/fitangle/protein-angles.dat"

angles <- read.table(file=angles_file, header=FALSE)

angles[,1] <- angles[,1] * ns_per_frame

colnames(angles) <- c('time', 'angle')

ggplot() + 
  geom_line(data=angles, aes(x=time, y=angle)) + 
  xlab('Time (ns)') + 
  ylab('Angle (degree)') + 
  ggtitle('Angle between S203N Mutant Helix and Wild-Type Helix')

mean(angles[1000:2143, 2])

#
# Helices Z-Axis Angles
#

helices_wild_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/fitangle/wild-helix-protein-angles.dat"
helices_s203n_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/fitangle/s203n-helix-protein-angles.dat"

helices_wild <- read.table(file=helices_wild_file, header=FALSE)
helices_s203n <- read.table(file=helices_s203n_file, header=FALSE)

helices_wild[,1] <- helices_wild[,1] * ns_per_frame
helices_s203n[,1] <- helices_s203n[,1] * ns_per_frame

colnames(helices_wild) = c('time', 'angle')
colnames(helices_s203n) = c('time', 'angle')

ggplot() + 
  geom_line(data=helices_wild, aes(x=time, y=angle, color='Wild'), alpha=1) + 
  geom_line(data=helices_s203n, aes(x=time, y=angle, color='S203N'), alpha=1) + 
  xlab('Time (ns)') + 
  ylab('Angle (degree)') + 
  ggtitle('1RTC Wild and S203N Mutant Helix Angle With Respective Proteins') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

mean(helices_wild[1000:2000, 2]) - mean(helices_s203n[1000:2000, 2])

 #
# Hydrophobic vs Hydrophilic RMSD
#

rmsd_hydrophobic_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rmsd/1rtc-wild-hydrophobic-rmsd.dat"
rmsd_hydrophilic_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/rmsd/1rtc-wild-hydrophilic-rmsd.dat"

rmsd_hydrophobic <- read.table(file=rmsd_hydrophobic_file, header=TRUE)
rmsd_hydrophilic <- read.table(file=rmsd_hydrophilic_file, header=TRUE)

rmsd_hydrophobic[, 1] <- rmsd_hydrophobic[, 1] * ns_per_frame
rmsd_hydrophilic[, 1] <- rmsd_hydrophilic[, 1] * ns_per_frame

colnames(rmsd_hydrophobic) <- c('time', 'rmsd')
colnames(rmsd_hydrophilic) <- c('time', 'rmsd')

ggplot() + 
  geom_line(data=rmsd_hydrophobic, aes(x=time, y=rmsd, color="Hydrophobic")) + 
  geom_line(data=rmsd_hydrophilic, aes(x=time, y=rmsd, color="Hydrophilic")) +
  xlab('Time (ns)') + 
  ylab('RMSD') + 
  ggtitle('RMSD of ') + 
  scale_color_manual(name='', values=c("Hydrophobic"="red", "Hydrophilic"="blue")) + 
  theme(legend.title=element_blank())

#
# SASA
#

wild_sasa_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/sasa/wild-all-sasa.dat"
s203n_sasa_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/sasa/s203n-all-sasa.dat"

wild_sasa <- read.table(file=wild_sasa_file, header=FALSE)
s203n_sasa <- read.table(file=s203n_sasa_file, header=FALSE)

wild_sasa[,1] <- wild_sasa[,1] * ns_per_frame
s203n_sasa[,1] <- s203n_sasa[,1] * ns_per_frame

colnames(wild_sasa) <- c('time', 'sasa')
colnames(s203n_sasa) <- c('time', 'sasa')

ggplot() + 
  geom_line(data=wild_sasa, aes(x=time, y=sasa, color='Wild'), alpha=1) + 
  geom_line(data=s203n_sasa, aes(x=time, y=sasa, color='S203N'), alpha=1) + 
  xlab('Time (ns)') + 
  ylab('Solvent Accessible Surface Area (A^2)') + 
  ggtitle('1RTC Wild and S203N Mutant Solvent Accessible Surface Area') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())

mean(wild_sasa[1000:2143, 2])
mean(s203n_sasa[1000:2143, 2])

#
# SASA Active
#

wild_sasa_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/sasa/wild-active-sasa.dat"
s203n_sasa_file <- "/Users/jshe/School/bios-10603/1rtc/analysis/sasa/s203n-active-sasa.dat"

wild_sasa <- read.table(file=wild_sasa_file, header=FALSE)
s203n_sasa <- read.table(file=s203n_sasa_file, header=FALSE)

wild_sasa[,1] <- wild_sasa[,1] * ns_per_frame
s203n_sasa[,1] <- s203n_sasa[,1] * ns_per_frame

colnames(wild_sasa) <- c('time', 'sasa')
colnames(s203n_sasa) <- c('time', 'sasa')

ggplot() + 
  geom_line(data=wild_sasa, aes(x=time, y=sasa, color='Wild'), alpha=1) + 
  geom_line(data=s203n_sasa, aes(x=time, y=sasa, color='S203N'), alpha=1) + 
  xlab('Time (ns)') + 
  ylab('Solvent Accessible Surface Area (A^2)') + 
  ggtitle('1RTC Wild and S203N Mutant Active Site Solvent Accessible Surface Area') + 
  scale_color_manual(name='', values=c("Wild"="red", "S203N"="blue")) + 
  theme(legend.title=element_blank())
  
mean(wild_sasa[1000:2143, 2])
mean(s203n_sasa[1000:2143, 2])
  
  
