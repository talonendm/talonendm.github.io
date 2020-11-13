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
~~~
Random data set was generated, see [stackoverflow.com][1].
~~~
# line graph: scale_x_datetime  
gg1 <- ggplot(df, aes(x = datetime, y = values)) + geom_line() + 
scale_x_datetime(date_breaks = "5 days", date_labels = "%y/%m/%d") + 
ylab("values [0..100]")

# detect points when values are 0 or 100 [dplyr]
df_max_min <- df %>% dplyr::filter(values == 0 | values == 100)
~~~
Annotate points and labels to gg1 object, see [stackoverflow.com][2] and [stackoverflow.com][3].
~~~

# annotate points and labels: [2 & 3]
gg1 <- gg1 + annotate("point", df_max_min$datetime, df_max_min$values, colour="red") + geom_text(data = df_max_min, aes(x= datetime, y= values, label = "extreme"))# https://stackoverflow.com/questions/36541086/adding-an-extra-point-in-a-ggplot2-graph

# add horizontal and vertical lines:
gg1 <- gg1 + geom_vline(xintercept = df_max_min$datetime, linetype = "dashed", color = "red", size=1)  
gg1 <- gg1 + geom_hline(yintercept = 50, linetype = "dotted", color = "green", size=1)


# show figure --------
print(gg1 + ggtitle("time series, points and labels"))

~~~

h2. Histogram

Let's create larger data frame [https://plotly.com/][6].
~~~
df <- data.frame(datetime, 
                 values = sample(0:100, length(datetime), rep = TRUE), 
                 cond = factor( rep_len(c("A","B"), length(datetime))), 
                 rating = c(rnorm(50),rnorm(length(datetime) - 50, mean=.8))) # [1]


gg2 <- ggplot(data=df, aes(x=rating, fill=cond)) +
  geom_vline(xintercept=c(-2,2)) +
  geom_histogram(binwidth=.5, alpha = 0.4)


print(gg2) + ggtitle("Histogram")

~~~


### References

1. ["random numbers"](https://stackoverflow.com/questions/19352267/create-a-dataframe-with-random-numbers-in-each-column)
2. ["Adding extra points to graph"](https://stackoverflow.com/questions/36541086/adding-an-extra-point-in-a-ggplot2-graph)
3. ["geom_text how to position the text on bar as I want?"](https://stackoverflow.com/questions/40211451/geom-text-how-to-position-the-text-on-bar-as-i-want)
4. ["markdown references"](https://wordpress.com/support/markdown-quick-reference/)
5. ["markdown comments"](https://gist.github.com/jonikarppinen/47dc8c1d7ab7e911f4c9)
6. ["histogram"](https://plotly.com/ggplot2/geom_histogram/)

<!-- a normal html comment [5] -->
[//]: # (This is a comment. [5])


[//]: # (Markdown comments - label in brackets is shown when hovering the link)
[1]: https://stackoverflow.com/questions/19352267/create-a-dataframe-with-random-numbers-in-each-column "random numbers"
[2]: https://stackoverflow.com/questions/36541086/adding-an-extra-point-in-a-ggplot2-graph "Adding extra points to graph"
[3]: https://stackoverflow.com/questions/40211451/geom-text-how-to-position-the-text-on-bar-as-i-want "geom_text how to position the text on bar as I want?"
[6]: https://plotly.com/ggplot2/geom_histogram/ "histogram"
