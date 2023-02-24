
library("ggplot2")
library("dplyr")

df <- read.csv("C:/Users/linds/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

popular <- df %>% group_by(Title, CheckoutYear) %>% filter(MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "AUDIOBOOK") %>% summarize(Total = sum(Checkouts)) 
popular <- popular %>% group_by(CheckoutYear) %>% filter(Total == max(Total))

ggplot(popular) +
  geom_col(mapping = aes(x = CheckoutYear,
                         y = Total,
                         fill = Title)) +
  labs(title = 'Most Popular Book and Their Check Outs Per Year 2017-2023',
       x = "Year",
       y = "Check Outs") +
  scale_x_continuous(breaks =  seq(2017, 2023, 1)) +
  coord_flip()

