library("ggplot2")
library("dplyr")
library("scales")

df <- read.csv("C:/Users/linds/INFO201/2017-2023-10-Checkouts-SPL-Data.csv",
  stringsAsFactors = FALSE)

total_checkouts <- df %>%
  group_by(MaterialType, CheckoutYear) %>%
  filter(str_detect(MaterialType, "BOOK")) %>%
  summarize(Total = sum(Checkouts))

ggplot(total_checkouts) +
  geom_line(mapping = aes(
    x = CheckoutYear,
    y = Total,
    color = MaterialType
  )) +
  scale_x_continuous(breaks = seq(2017, 2023, 1)) +
  scale_y_continuous(labels = label_number_si()) +
  labs(
    title = "Book Checkouts Per Material Between 2017-2023",
    x = "Year",
    y = "Number of Checkouts",
    color = "Material Type"
  )
