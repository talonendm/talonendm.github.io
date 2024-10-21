---
layout: post
title: R tips - ggplot package
subtitle: Simple time series and annotate points and labels on it
tags:
  - R
  - package ggplot
  - package ggsave
  - package chattr
  - LLM
  - copilot
comments: true
cover-img: /assets/pics/wide/wide_Time series and histogram.png
thumbnail-img: /assets/pics/cover/square_time series, points and labels.png
published: true
---


# Custom tips

- Disable .Rdata saving: 
  - Tools -> Global Options -> change save .Rdata (never) and disable restore .Rdata 

## copilot

<!-- 10/2024 -->

- github settings, activate copilot [talonendm](https://github.com/settings/copilot)
- [university students](https://techcommunity.microsoft.com/t5/educator-developer-blog/step-by-step-setting-up-github-student-and-github-copilot-as-an/ba-p/3736279), free
- Rstudio ohjeet [posit.co](https://docs.posit.co/ide/user/ide/guide/tools/copilot.html)
  - Navigate to Tools > Global Options > Copilot.
  - Check the box to “Enable GitHub Copilot”.
  - Download and install the Copilot Agent components.
  - Click the “Sign In” button.
  - In the “GitHub Copilot: Sign in” dialog, copy the Verification Code.

### Chat with AI in RStudio

"Interact with Github Copilot and OpenAI’s GPT (ChatGPT) models directly in RStudio. The chattr Shiny add-in makes it easy for you to interact with these and other Large Language Models (LLMs)."  [rstudio](https://blogs.rstudio.com/ai/posts/2024-04-04-chat-with-llms-using-chattr/)

- [chattr package R](https://mlverse.github.io/chattr/)
  - check instructions
- tillburg.ai [chattr](https://tilburg.ai/2024/05/how-to-integrate-chatgpt-inside-rstudio/)

```
# Run the app
chattr::chattr_app()
```

and espace with ESC.



# R tips - ggplot 


## time series

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

# annotate points and labels: [2 & 3] # https://stackoverflow.com/questions/36541086/adding-an-extra-point-in-a-ggplot2-graph
gg1 <- gg1 + annotate("point", df_max_min$datetime, df_max_min$values, colour="red") + 
  geom_text(data = df_max_min, aes(x= datetime, y= values, label = "extreme")) + 
  ggtitle("time series, points and labels") 


# add horizontal and vertical lines:
gg1 <- gg1 + geom_vline(xintercept = df_max_min$datetime, linetype = "dashed", color = "red", size=1)  
gg1 <- gg1 + geom_hline(yintercept = 50, linetype = "dotted", color = "green", size=1)


# show figure --------
print(gg1 + ggtitle("time series, points and labels"))

~~~

## Histogram: geom_histogram

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

## many ggplots in the same figure

Required packages:

~~~
if (!require(here)) install.packages('here')
library(here) # create path for ggsave

if (!require(cowplot)) install.packages('cowplot')
library(cowplot)

if (!require(ggpubr)) install.packages('ggpubr')
library(ggpubr)

if (!require(here)) install.packages('here')
library(here)
~~~

First, let's change theme a bit. Generated picture is used as top image in this blog post.
~~~
gg1 <- gg1 + theme(plot.background = element_rect(fill = "#C0C0C0"), 
                   panel.grid.major = element_line(colour = "grey90"), 
                   axis.ticks = element_line(size = 2)) # https://ggplot2.tidyverse.org/reference/theme.html


gg2 <- gg2 + 
  theme(plot.background = element_rect(fill = "#C0C0C3"))  # https://ggplot2.tidyverse.org/reference/theme.html


gg_plots <- ggarrange(gg1, gg2 , 
                          labels = c("A", "B"),
                          ncol = 2, nrow = 1)

gg_plots <- gg_plots + ggtitle("Time series and histogram")

last_plot()$labels$title
paste0(here("/"), last_plot()$labels$title, ".png")

# wide image on blog post ===========
ggsave(filename = paste0(here("/"), "wide_", last_plot()$labels$title, ".png"),
       width = 29, height = 6, units = "cm",  dpi = 300)

# Square image on main page ===========
ggsave(filename = paste0(here("/"), "square_", gg1$labels$title, ".png"), plot = gg1,
       width = 10, height = 10, units = "cm",  dpi = 300)

~~~


- [Tight x-axis with data and time](https://stackoverflow.com/questions/44518354/ggplot-with-date-x-axis-at-y-0-and-labels-at-the-bottom)

~~~
+ ggplot2::scale_x_datetime(limit=as.Date(limits = c(startdate_time, '2015-07-01')), expand=c(0,0), date_beaks = "1 day" ) + 
~~~

## stringr

- [Extracting the last n characters from a string in R](https://stackoverflow.com/questions/7963898/extracting-the-last-n-characters-from-a-string-in-r)
~~~
str_sub(data, -4, -1) 
~~~


## Experiments

### Rjs test - write R inside html

[rjs: R in JavaScript](https://github.com/kdpsingh/rjs) quick test in additional html-page: However, I got this message [4.1.2021]:
~~~
Mixed Content: The page at 'https://talonendm.github.io/introR' was loaded over HTTPS, but requested an insecure XMLHttpRequest endpoint 'http://kdpsingh.ocpu.io/RendereR/R/renderer'. This request has been blocked; the content must be served over HTTPS.
~~~
In addition, _posts are md-files, so I should do something like this: How to [write html into md-file](https://stackoverflow.com/questions/16350545/html-code-into-readme-md-on-github)?


# Shinybulma

This was originally used in safka.me re:teatteri app in mid 2010. See [shinybulma](https://github.com/RinteRface/shinybulma) github pages: "Bulma: the modern
CSS framework that just works."


Installation, e.g. in ui.R file as
~~~

install.packages('devtools')
library(devtools)
devtools::install_github("RinteRface/shinybulma")
library(shinybulma)

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




### Vastuuvapauslauseke

Tämä julkaisu on tehty parhaan oman tietämyksemme ja ymmärtämyksemme pohjalta. Olemme tehneet kaiken voitavamme tietojen täsmällisyyden ja oikeellisuuden takaamiseksi, [talonendm](https://talonendm.github.io/) ei ole vastuussa mistään virheistä tai puutteista tai mistään suorasta, epäsuorasta tai välillisestä
vahingosta, joka on aiheutunut tietojen virheellisestä soveltamisesta. Pidätämme oikeuden muutoksiin.