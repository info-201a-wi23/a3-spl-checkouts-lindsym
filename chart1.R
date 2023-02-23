
library("ggplot2")
library("dplyr")

df <- read.csv("C:/Users/linds/INFO201/a3-spl-checkouts-lindsym/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

harry_potter_trends <- df %>% group_by(Title, CheckoutMonth) %>% filter(CheckoutYear == 2020) %>% filter(MaterialType == "BOOK") %>%  
 filter(Creator == "Rowling, J. K.") %>% summarize(Total = sum(Checkouts))

ggplot(harry_potter_trends) + 
  geom_line(mapping = aes(x = CheckoutMonth,
                          y = Total,
                          color = Title))
