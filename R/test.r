library(tidyverse)
library(readxl)
library(scales)


data <-read_excel("~/Desktop/Sentinel-1 Metadata info.xls")
centroid <- slice(data,1)

data %>% 
  ggplot(aes(`Date of acquisition`, `Bperp(m)`)) +
  geom_point() +
  geom_segment(aes(x = centroid$`Date of acquisition`, y = centroid$`Bperp(m)`, 
                   xend = `Date of acquisition`, yend = `Bperp(m)`)) +
  theme_minimal()

my_data_compressed <-data
reconstruct <- structure(list(`Date of acquisition` = structure(c(1580256000, 
                                                                  1581292800, 1582329600, 1579219200, 1577664000, 1575590400, 1576627200, 
                                                                  1578700800, 1579737600, 1581811200, 1580774400, 1582848000), class = c("POSIXct", 
                                                                                                                                         "POSIXt"), tzone = "UTC"), `Bperp(m)` = c(0, -23.22, 15.03, 8.85, 
                                                                                                                                                                                   -26.13, 7.35, -31.04, 19.4, 12.44, -25.21, -6.45, 70.35)), row.names = c(NA, 
                                                                                                                                                                                                                                                            -12L), class = c("tbl_df", "tbl", "data.frame"))