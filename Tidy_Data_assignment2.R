library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidytext)
spotify <- read.csv(file= "/home/Documents/spotify/spotify-data.csv")
summary(spotify)  #100 observations of 11 variables

#deleting the first columns without name specifying the S.No.
spotify <- spotify[-1] # 10 variables

#renaming column names
colnames(spotify) <- c('Name', 'Artist', 'Album', 'Popularity', 'Energy', 'Acousticness', 'Key', 'Loud')

#filtering according to the album , eliminating ones which have null(NA) value
clothesr <- spotify %>% filter(!is.na(Album))  #22641 obs of 10 variables

#extracting rows with or without artist
noartist <- clothesr %>% filter(is.na(Artist)) %>% select(-Artist)
wartist <- clothesr %>% filter(!is.na(Artist)) %>% unite(Album, c(Artist, Album), sep = ' ')

#reducing column by merging artist and album
main <- bind_rows(noartist, wartist)  #22641 obs. of 9 variables

 write.csv(main, file="/home/Documents/spotify/TidyData.csv")
