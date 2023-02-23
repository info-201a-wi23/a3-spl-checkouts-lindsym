
library("ggplot2")
library("dplyr")

df <- read.csv("C:/Users/linds/INFO201/a3-spl-checkouts-lindsym/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

popular <- df %>% group_by(Title, CheckoutYear) %>% filter(MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "AUDIOBOOK") %>% summarize(Total = sum(Checkouts)) 
popular <- popular %>% group_by(CheckoutYear) %>% filter(Total == max(Total))

ggplot(popular) +
  geom_col(mapping = aes(x = CheckoutYear,
                         y = Total,
                         fill = Title))

