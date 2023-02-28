### tricolored blackbird bioacoustic analysis ###

# graphing detections for each vocalization obtained through manual vs automated analysis 

# set working directory 

df <- read.csv("manual_v_automated.csv")
head(df)

site.names <- c("CR19" = "Denverton Creek", "HL19" = "Hay Landfill",
                "RR19" = "Rush Ranch")

library(ggplot2)
library(wesanderson)

ggplot(data=df) + geom_bar(aes(x=Vocalization, y=Detections, fill=Method), 
                           position="dodge", stat="identity") + 
  facet_wrap(~Site, labeller=as_labeller(site.names)) + theme_bw() +
  scale_fill_manual(values=wes_palette("Chevalier1")) + 
  scale_x_discrete(limits=c("MS", "FS", "BC")) + theme(legend.position = c(0.84, 0.88)) +
  theme(legend.background = element_rect(fill="white",
                                         size=0.5, linetype="solid", 
                                         colour ="black"))
