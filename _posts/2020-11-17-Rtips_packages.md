---
layout: post
title: R tips - R user since 2004
subtitle: data mungling
tags:
  - R
  - package data table
  - mungling
  - modeling
comments: true
cover-img: /assets/pics/wide/wide_Time series and histogram.png
thumbnail-img: /assets/pics/thumbnail/R/square_time series, points and labels.png
published: true
---

# R tips


## Packages and Libraries

### New computer / R installed

Download [R](https://cran.r-project.org/bin/windows/base/). 9/2021: R 4.1.1.

It is good idea to setup R_LIBS for R packages, see e.g. [this](https://statistics.berkeley.edu/computing/R-packages). Go to My Computer and then to the advanced settings and environmental variables: "C:/R/libs" or as:

- R_LIBS and C:/R/libs without parentheses.

Check:
~~~
Sys.getenv('R_LIBS')
  .libPaths()
~~~

### general stuff

Check version numbers of installed packages as

~~~
sessionInfo()
~~~

for example, model trained with newer package version may not work on another R having older package version. It can be also possible that error message doesn't give hint to that direction if things are not working. 

## shortcuts

- CTRL-p: find open/close bracket and make comment after bracket closing, e.g. long loops.
- CTRL-i: make code prettier

## Creativity

### Bookdown

- [bookdown](https://bookdown.org/yihui/bookdown/): Authoring Books and Technical Documents with R Markdown



## Modeling

- lm

### caret

### xgboost

- vtreat package

- save models as rds / Rdata or check out xgboost::xgb.save() and xgboost::xgb.load() to have models in json-format.





## Cloud

### aws

- [Paws is a Package for Amazon Web Services in R](https://github.com/paws-r/paws)

### gc

- googleCloudStorageR:: [cran - googleCloudStorageR](https://cran.r-project.org/web/packages/googleCloudStorageR/vignettes/googleCloudStorageR.html)

- [Google Big Query with R](https://github.com/r-dbi/bigrquery)

## data.table

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

- rleidv(): Nice function, if working with e.g. "transaction" data frames (not using e.g. zoo or ts package) to get serial ids to data.

- timewarp:: and lubridate:: to work with dates

## Package developing

- pkgdown
- debugging, developing: have at least 2 Rstudio sessions open. Package development and another having package loaded to workspace. While testing new funcion, copy manually function code by clicking down icon &#9660; to right &#9658; and by copying one line to another session. 

## Microsoft Windows - Office (comma or dot as separator)

Data files can be messed up, if e.g. date is in format 18.11.2020 and other column has value 18.11 --> 18.11.2020
In this case, e.g. if you use Finnish keyboard and language do the following:
- Search: Alueasetukset
- Maa tai Alue: Suomi
- Alueasetus: Windows recommendation: Suositus (Suomi) -> englanti (Eurooppa)
- Vaihda datamuotoa: , -> .