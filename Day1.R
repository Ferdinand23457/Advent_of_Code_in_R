library(tidyverse)
table <- read.table("your_path_here", header = FALSE, sep= "")
table$V1 <- sort(table$V1)
table$V2 <- sort(table$V2)
table$diff <-table$V1 - table$V2
table$diff <- abs(table$diff)
distance_sum <- sum(table$diff)
