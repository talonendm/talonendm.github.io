---
layout: post
title: R tips - ggplot package
subtitle: Simple time series and annotate points and labels on it
tags:
  - R
  - ggplot
comments: true
cover-img: /assets/pics/wide/wide_seaweed.PNG
thumbnail-img: /assets/pics/Rtips_ggplot_Capture.PNG
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

[1]: https://stackoverflow.com/questions/19352267/create-a-dataframe-with-random-numbers-in-each-column "random numbers"
[2]: https://stackoverflow.com/questions/36541086/adding-an-extra-point-in-a-ggplot2-graph "Adding extra points to graph"
[3]: https://stackoverflow.com/questions/40211451/geom-text-how-to-position-the-text-on-bar-as-i-want "geom_text how to position the text on bar as I want?"
[4]: https://wordpress.com/support/markdown-quick-reference/ "markdown references"

