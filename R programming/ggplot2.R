## ggplot2

## library
library(tidyverse)

## First Plot
# เฉพาะพื้นหลัง
gplot(data = mtcars, mapping = aes(x = hp, y = mpg))

# มี point chart ด้วย
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
    geom_point()

# มีชั้นเพิ่มอีกชั้น
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
    geom_point() +
    geom_smooth()

# มีชั้นเพิ่มอีกชั้น
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
    geom_point() +
    geom_smooth() +
    geom_rug()

# custom chart
ggplot(mtcars, aes(hp, mpg)) +
    geom_point(size = 3, col = "blue", alpha = 0.2)

#-----------------------------------------------------
# Histogram
ggplot(mtcars, aes(hp)) +
    geom_histogram(bins = 10, fill = "red", alpha = 0.5)

#-----------------------------------------------------
# Box plot
p <- ggplot(mtcars, aes(hp))
p + geom_boxplot()

#-----------------------------------------------------
# Box plot by groups

# จะใช้ dataset `diamonds`
diamonds %>%
    count(cut)
# # A tibble: 5 × 2
#   cut           n
#   <ord>     <int>
# 1 Fair       1610
# 2 Good       4906
# 3 Very Good 12082
# 4 Premium   13791
# 5 Ideal     21551

diamonds %>%
    count(color)
# # A tibble: 7 × 2
#   color     n
#   <ord> <int>
# 1 D      6775
# 2 E      9797
# 3 F      9542
# 4 G     11292
# 5 H      8304
# 6 I      5422
# 7 J      2808

# Bar plot
ggplot(diamonds, aes(cut)) +
    geom_bar(fill = "#0366fc")

ggplot(diamonds, mapping = aes(cut, fill=color)) +
    geom_bar()

ggplot(diamonds, mapping = aes(cut, fill=color)) +
    geom_bar(position = "dodge")

ggplot(diamonds, mapping = aes(cut, fill=color)) +
    geom_bar(position = "fill")

#-----------------------------------------------------
## Scatter Plot

ggplot(diamonds, aes(carat, price)) +
    geom_point()

# With small amount
sm_diamonds <- sample_n(diamonds, 5000)

ggplot(sm_diamonds, aes(carat, price)) +
    geom_point()

#-----------------------------------------------------
## FACET : small multiples
# เป็นการแบ่ง chart ซอยย่อยเป็นกลุ่มได้
ggplot(sm_diamonds, aes(carat, price)) +
    geom_point() +
    facet_wrap(~color)

ggplot(sm_diamonds, aes(carat, price)) +
    geom_point() +
    facet_wrap(~color, ncol=2)

ggplot(sm_diamonds, aes(carat, price)) +
    geom_point() +
    geom_smooth() +
    facet_wrap(~color, ncol=2)

ggplot(sm_diamonds, aes(carat, price)) +
    geom_point() +
    geom_smooth(method="lm", col="red") +
    facet_wrap(~color, ncol=2)

# Theme
ggplot(sm_diamonds, aes(carat, price)) +
    geom_point() +
    geom_smooth(method="lm", col="red") +
    facet_wrap(~color, ncol=2) +
    theme_minimal() +
    labs(title="Relationship between carat and price by color",
         x = "Carat",
         y = "Price USD",
         caption = "Source: Diamonds from ggplot2 package")

ggplot(sm_diamonds, aes(carat, price, col=cut)) +
    geom_point(size=2, alpha=0.2) +
    geom_smooth(method="lm", col="red") +
    facet_wrap(~color, ncol=2) +
    theme_minimal()
