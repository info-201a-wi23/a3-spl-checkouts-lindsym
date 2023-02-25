library("ggplot2")
library("dplyr")
library("tidyverse")

df <- read.csv("C:/Users/linds/INFO201/2017-2023-10-Checkouts-SPL-Data.csv",
  stringsAsFactors = FALSE
)

harry_potter_trends <- df %>%
  group_by(CheckoutMonth, MaterialType) %>%
  filter(CheckoutYear == 2022) %>%
  filter(str_detect(MaterialType, "BOOK|VIDEODISC")) %>%
  filter(str_detect(Title, "Harry Potter and the")) %>%
  summarize(Total = sum(Checkouts))

ggplot(harry_potter_trends) +
  geom_line(mapping = aes(
    x = CheckoutMonth,
    y = Total,
    color = MaterialType
  )) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  labs(
    title = "Harry Potter Material Trends in 2022",
    x = "Month",
    y = "Number of Checkouts",
    color = "Material Type"
  )
