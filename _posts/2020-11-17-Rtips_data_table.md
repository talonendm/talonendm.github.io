---
layout: post
title: R tips - data table package
subtitle: data mungling
tags:
  - R
  - package data table
  - mungling
comments: true
cover-img: /assets/pics/wide/wide_Time series and histogram.png
thumbnail-img: /assets/pics/cover/square_time series, points and labels.png
published: false
---
# R tips - data table


~~~

if (!require(dplyr)) install.packages('dplyr')
library(dplyr)

datetime <- seq(ISOdate(2020, 05, 01), ISOdate(2020, 05, 31), "hours")

df <- data.frame(datetime, 
                 values = sample(0:100, length(datetime), rep = TRUE), 
                 cond = factor( rep_len(c("A","B"), length(datetime))), 
                 rating = c(rnorm(50),rnorm(length(datetime) - 50, mean=.8))) # [1]
head(df)
~~~
Random data set was generated.

## rleidv



## Microsoft Windows - Office 
Data files can be messed up, if e.g. date is in format 18.11.2020 and other column has value 18.11 --> 18.11.2020
In this case, e.g. if you use Finnish keyboard and language do the following:
- Search: Alueasetukset
- Maa tai Alue: Suomi
- Alueasetus: Windows recommendation: Suositus (Suomi) -> englanti (Eurooppa)
- Vaihda datamuotoa: , -> .