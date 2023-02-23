library("ggplot2")
library("dplyr")

df <- read.csv("C:/Users/linds/INFO201/a3-spl-checkouts-lindsym/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

total_CheckOuts <- df %>% group_by(MaterialType, CheckoutYear) %>% filter(MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "AUDIOBOOK") %>% summarize(Total = sum(Checkouts))

ggplot(total_CheckOuts) + 
  geom_line(mapping = aes(x = CheckoutYear,
                           y = Total,
                           color = MaterialType))






