library(tidyverse)

rename(diamonds, length = x, width = y, height = z)

d2 <- select(diamonds, carat, price)
d2

mutate(d2, ppc = price / carat)
