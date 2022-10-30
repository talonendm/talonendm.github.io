---
layout: post
title: Matematiikkaa ja R:ää
subtitle: vesikattotilastoja (Studentin t-jakauma)
tags:
  - vesikatto
  - R
  - tilastotiede
comments: true
cover-img: /assets/pics/cover/ai/constructioneye.jpg
thumbnail-img: /assets/pics/thumbnail/ai/roofgauss.jpg
usemathjax: true
published: true
---

[William Sealy Gosset](https://fi.wikipedia.org/wiki/William_Sealy_Gosset) työskenteli [Guinnessin](https://talonendm.github.io/2020-12-17-beers/) panimolla Dublinissa ja tutki parhaiden ohralajikkeiden valintaa. "Vuonna 1908 Gosset julkaisi löytönsä brittiläisessä Biometrika -lehdessä, jonka yksi toimittaja oli Karl Pearson. Julkaisu tapahtui nimimerkillä "Student" eli opiskelija, mistä tulee myös testille vakiintunut nimi *Studentin t-testi*." [Wikipedia]

## Peltikatteen elinikä - Studentin t-jakauma

Tutustutaan Studentin t-jakaumaan kuvitteellisen aineiston avulla. Peltikatevalmistaja väittää, että heidän valmistamien peltikatteiden elinikä **asennettuna** on vähintään 30 vuotta. Seitsämän omakotitalon satunnaisotoksesta saatiin seuraava aineisto (valmistajan peltikatteet kestivät tutkimusten mukaan ennen seuraavaa saneerausta): \\
7, 5, 12, 35, 44, 10, 11 vuotta.

Voidaanko todeta valmistajan väitteen olevan sopusoinnussa aineiston kanssa? Käytä 5% merkitsevyystasoa.

**Ratkaistaan tehtävä seuraavalla tavalla:**

Valitaan nollahypoteesiksi peltikatevalmistajan väite, eli

$$H_0: \mu \geq 30$$\\
$$H_1: \mu < 30 $$, eli vastahypoteesina asennettu vesikatto ei kestä valmistajan väittämää aikaa. \\

$$ \overline{x} = \Sigma_{i=1}^n{x_i} = 17.71429 $$\\
$$s = \sqrt{\frac{\Sigma_{i=1}^n(x_i - \overline{x})^2}{(n - 1)}} = 15.29395$$

R:
~~~
# 2021-05-17-roof.R
peltikateika <- c(7, 5, 12, 35, 44, 10, 11)
mu = mean(peltikateika)
mu

n = length(peltikateika)
s = sqrt(
  (
    sum((peltikateika - mu)^2)
  ) / (n - 1)
)
s

~~~

Perusjoukon (kerättyyn dataan) perustuva keskihajonta ei ole tunnettu ja siksi käytetään t-testiä. Testisuureen arvoksi saadaan laskettua:

$$T = \frac{\overline{x} - \mu_0}{s/\sqrt{n}}$$

$$T = \frac{17.71429 - 30}{15.29395 / \sqrt{7}} = 
-2.125347$$

Studentin t-jakauma ([table](https://www.sjsu.edu/faculty/gerstman/StatPrimer/t-table.pdf)), vapausasteella df = 6: $$T_{df=6, 0.05} = 1.943$$. Jakauman symmetrisyyden perusteella vasemman hännän arvo on -1.943.


~~~
# R:
T <- (mu - mu0) / (s / sqrt(n))
T

# or test:
R_test <- t.test(peltikateika, alternative = "less")
R_test$statistic

p <- stats::pt(q = T, df = n - 1, lower.tail = TRUE)
p

~~~

$$p = 0.0388536048047322 < 0.05$$ eli p-arvo on pienempi kuin merkitsevyystaso ja siten nollahypoteesi hylätään. Vastaavasti T-kriittistä arvoa tarkastelemalla: -2.125 < -1.943 Vesikatot **eivät** kestä 30 vuotta tämän aineiston perusteella.




~~~
# 2021-05-17-roof.R

# aineisto:
mu0 <- 30
merk <- 0.05

# data:
peltikateika <- c(7, 5, 12, 35, 44, 10, 11)


# otoskeskiarvo ja -keskihajonta:
mu <- mean(peltikateika)
mu
n <- length(peltikateika)
s <- sqrt(
  (
    sum((peltikateika - mu)^2)
  ) / (n - 1)
)
s

# Testisuureen arvo:
T <- (mu - mu0) / (s / sqrt(n))
T


R_test <- t.test(peltikateika, alternative = "less")
R_test$statistic


p <- stats::pt(q = T, df = n - 1, lower.tail = TRUE)
p

if (p <= merk) {
  print(
    paste("Nollahypoteesi hylätään - vesikatot eivät kestä", mu0, "vuotta tämän aineiston perusteella.") 
  )
} else {
  print(paste("Nolla hypoteesi jää voimaan", 100*merk, "prosentin merkitsevyyatasolla."))
}

print(paste("p-arvo:", p))  
  
~~~

## Linkkejä

- More talonendm statistics available [here (2021-05-17-roof)](https://talonendm.github.io/2021-05-17-roof/).
- Student's t-Test: [R stats::t.test](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/t.test.html)
- [Student's t-test in R](https://statsandr.com/blog/student-s-t-test-in-r-and-by-hand-how-to-compare-two-groups-under-different-scenarios/) and by hand: how to compare two groups under different scenarios?
- [pt](https://www.statology.org/working-with-the-student-t-distribution-in-r-dt-qt-pt-rt/): "The function pt returns the value of the cumulative density function (cdf) of the Student t distribution given a certain random variable x and degrees of freedom df."


![i.03](/assets/pics/page/ai/streetart.jpg){: .mx-auto.d-block :}


---

Tämä julkaisu on tehty parhaan oman tietämyksemme ja ymmärtämyksemme pohjalta. Olemme tehneet kaiken voitavamme tietojen täsmällisyyden ja oikeellisuuden takaamiseksi.

