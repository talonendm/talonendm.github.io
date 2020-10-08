---
published: false
layout: post
title: Shiny app - mushroom hunting
subtitle: Mushroom data on the table
tags:
  - hobby
  - shiny
comments: false
published: true
---
## Mushrooms

Test simple R shiny application running on shinyapps.io: [Mushrooms - Fungi table](https://talonen.shinyapps.io/app-fungi-insta/ "shiny app")
However, this app is not very useful and I suggest to go for example here: [laji.fi](https://laji.fi/)

### Shiny tip - character encoding:

[Shiny article](https://shiny.rstudio.com/articles/unicode.html "Unicode characters")

For example, mushroom called Lampaankääpä was shown as Lampaankp. Time to time I almost lose my mind fighting with character encoding, but following R code worked:

~~~
 d0$fi <- as.character(d0$fi)
 d0$fi <- enc2native(d0$fi)
~~~

iconv:

~~~
localeToCharset()
d0$fi <- iconv(d0$fi, "ISO_8859-2", "UTF-8")
~~~

### References

1. [Shinyapps](https://shiny.rstudio.com/articles/shinyapps.html)
2. [Suomalaisia sieniä](https://fi.wikipedia.org/wiki/Luettelo_suomalaisista_ruokasienist%C3%A4 "Sieniä")
3. google, sienikirjat ym.
4. https://stackoverflow.com/questions/16347731/how-to-change-the-locale-of-r/20971351



