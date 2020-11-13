---
layout: post
title: Thesis Shiny app - word cloud
subtitle: Visual presentation of the most common words in each Chapter
tags:
  - thesis
comments: true
cover-img: /assets/pics/wide/wide_seaweed.PNG
thumbnail-img: /assets/pics/vedonlyontiCapture.PNG
published: true
---
## R tips - ggplot 

~~~

# ....................................................................
# Rtips_ggplot.R
# ....................................................................
if (!require(dplyr)) install.packages('dplyr')
library(dplyr)

if (!require(ggplot2)) install.packages('ggplot2')
library(ggplot2)
# ....................................................................
# generate random time series:
datetime <- seq(ISOdate(2020, 05, 01), ISOdate(2020, 05, 31), "hours")
df <- data.frame(datetime, values = sample(0:100, length(datetime), rep = TRUE)) # [1]
head(df)

# line graph:
gg1 <- ggplot(df, aes(x = datetime, y = values)) + geom_line() 

# detect points when values are 0 or 100
df_max_min <- df %>% dplyr::filter(values == 0 | values == 100)

# annotate points and labels: [2 & 3]
gg1 <- gg1 + annotate("point", df_max_min$datetime, df_max_min$values, colour="red") + geom_text(data = df_max_min, aes(x= datetime, y= values, label = "extreme"))# https://stackoverflow.com/questions/36541086/adding-an-extra-point-in-a-ggplot2-graph

# show figure --------
print(gg1 + ggtitle("time series, points and labels"))

~~~


### References

1) https://stackoverflow.com/questions/19352267/create-a-dataframe-with-random-numbers-in-each-column
2) https://stackoverflow.com/questions/36541086/adding-an-extra-point-in-a-ggplot2-graph
3) https://stackoverflow.com/questions/40211451/geom-text-how-to-position-the-text-on-bar-as-i-want

