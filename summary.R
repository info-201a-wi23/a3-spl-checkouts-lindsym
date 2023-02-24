library("ggplot2")
library("dplyr")
library("scales")

df <- read.csv("C:/Users/linds/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

totals <- df %>% group_by(UsageClass, CheckoutYear) %>% summarize(count = sum(Checkouts))
