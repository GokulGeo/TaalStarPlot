  library(tidyverse)
  library(readxl)
  library(scales)
  df <- read_excel("/media/gokul/New Volume/Taal/Tables/Sentinel-1 Metadata info.xlsx", 
                   sheet = "Descending",col_types = c("numeric", 
                                                      "text", "date", "text", "numeric", 
                                                      "numeric"))
  
  df$Date_of_acquisition <- as.Date(df$Date_of_acquisition)  # change to Date
  centroid <- slice(df, 1)
  
  ggplot(df, aes(Date_of_acquisition, Bperpm)) + geom_point() +
    geom_segment(aes(
      x = centroid$Date_of_acquisition, y = centroid$Bperpm,
      xend = Date_of_acquisition, yend = Bperpm)) +
    labs(y= "Perpendicular baseline(m)", x = "Temporal baseline") +
    theme_bw()+
    scale_x_date(breaks=df$Date_of_acquisition, labels = date_format("%d/%m/%y")) +
    theme(axis.ticks.length.y =unit(-0.2, "cm"),
          axis.ticks.length.x = unit(-0.2, "cm"),
          axis.text.y = element_text(margin = margin(0,.3,0,0, unit= "cm")),
          #axis.text.x = element_text(margin = margin(t = .3, unit = "cm"))) +
          axis.text.x=element_text(angle=90 , hjust = 1, size = 10, vjust=0.5,margin = margin(.3,0,0,0,unit = "cm")),
          axis.line = element_line(colour = "black", 
                                   size = .5, linetype = "solid"))

#scale_x_date(labels=date_format(format="%d-%m-%Y"),date_breaks = 'day')  # change format here
