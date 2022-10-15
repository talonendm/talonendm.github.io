---
layout: post
title: p5-ohjelmointia
subtitle: Taidetta koodaamalla - luovaa toimintaa
tags:
  - p5
  - svg
comments: true
cover-img: /assets/pics/cover/photo/lasercutHiveCover.jpg
thumbnail-img: /assets/pics/thumbnail/photo/app.jpg
published: true
---

Taiteen luominen tietokoneella on hauskaa ja hyödyllistä. P5 on JavaScript -kirjaston avulla visuaalisten ja luovien teosten ohjelmointi onnistuu ilman ohjelmien asennuksia. Valitettavasti suurin osa materiaalista on englanninkielistä ja perheen pienimmille se voi olla kynnys aloittaa ohjelmointiharrastus. Oppaita P5-ohjelmointiin löytyy internetistä kuitenkin ihan hyvin, katso esimerkiksi [MAOL:in ohjeet - taidetta ohjelmoimalla](https://maol.fi/materiaalit/taidetta-ohjelmoimalla/).

Miksi tehdä taidetta ohjelmoimalla? Kaikkea ei voi tehdä paperille perinteisin menetelmin, katso esimerkiksi animaatio [täällä](https://peda.net/p/tuomo.riekkinen%40jns.fi/animaatiot/proccessing/tjat/tjat). PS. Palaa takaisin tänne selaimen <i style='font-size:18px' class='fas'>&#xf060;</i>-näppäintä. Lisäksi uudelleen ajettavuus sekä erilaiset komennot joilla voi tehdä esimerkiksi 10 000 pistettä tai viivaa kankaalle onnistunee melko helposti.

<!-- https://www.w3schools.com/icons/fontawesome5_icons_arrows.asp -->

Tämän blogin tarkoitus on antaa ohjeet alkuun pääsemiseksi. Aiempaa ohjelmointitaitoja ei vaadita. Aiemmasta tietokoneen käytöstä on hyötyä, mutta editorin käyttö on melko yksinkertaista. Tekstin kopioiminen ja liimaaminen helpottaa valmiiden ohjelmakoodien testaamista. 

# Grafiikka

## perusasiat

Ensimmäinen harjoitus mitä tahansa uutta ohjelmointikieltä opeteltaessa on tyypillisesti "Hello World!" -ohjelmakoodi eli "Hei maailma". Ohjelman ideana on näyttää ruudulla "Hei maailma" -teksti. [Wikipedia - Hei maailma -ohjelma](https://fi.wikipedia.org/wiki/Hei_maailma_-ohjelma)

~~~
// p5ohjelmointi-blog
// 1. Harjoitus: Hello World!
function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(255, 255, 255);
  text("Hei maailma", 200, 200); 
}
~~~

Ihan ensimmäiseksi tulisi testata, toimiiko editoria ja osaat käyttää sen perustoimintoja. Tutki koodia selaimessa: [P5-Hello World!](https://editor.p5js.org/haques/sketches/McqXpW-WZ) ja paina P5-editorissa <i style="font-size:18px" class="fa">&#xf04b;</i>-näppäintä. Tapahtuuko mitään?

Avaa P5-editori näistä linkeistä uuteen välilehteen: 
- <a href="https://editor.p5js.org/haques/sketches/xCVg1jLN5" target="_blank" rel="noopener"><span>P5-Hello World!</span> </a>
- [P5-Hello World!](https://editor.p5js.org/haques/sketches/xCVg1jLN5){:target="_blank"}

### Koodi selitettynä

- setup: Kirjoita kaarisulkujen väliin ohjelmakoodi, joka ajetaan kerran ohjelmaa käynnistäessä
  - kommentin eli rivin jota ei käsitellä ohjelmassa kirjoitetaan kahden kenoviivan // jälkeen.
  - createCanvas: piirtoalueen leveys ja korkeus. Enemmän koordinaatistosta ja pikseleistä voi lukea [täältä](https://maol.fi/materiaalit/taidetta-ohjelmoimalla/1-johdanto/){:target="_blank"}.
- draw: piirto
  - background: taustaväri [RGB](https://www.rapidtables.org/fi/web/color/RGB_Color.html)
    - Värin voi asettaa esimerkiksi käyttäen RGB-värejä:
      - (255,0,0) Punainen
      - (0, 255, 0) Lime
      - (0, 0, 255) Sininen
      - Katso muita värivaihtoehtoja ylläolevasta linkistä.
  - text: teksti lainausmerkkien välissä sekä sijainti x ja y koordinaatit.

Editorista voi lukea ohjeita [täältä](https://maol.fi/materiaalit/taidetta-ohjelmoimalla/1-johdanto/p5-js-ohjelmointi/).

### Tee itse ja opi

- [ ]  Tehtävä: muuta tekstiä tai tekstin sijaintia piirtokankaalla.
- [ ]  Tehtävä: Muuta taustaväriä.


### Viiva

- [P5-editorissa viivoilla piirretty Hello World](https://editor.p5js.org/4pip/sketches/w5zALh8xO)
- [ ]  Tehtävä: muokkaa jonkin komennon koordinaatteja ja katso mitä tapahtuu.

### Muut kuviot

Tässä kappaleessa opetellaan piirtämään ympyrä, neliö, suorakulmio, viiva jne. Piirrä ne hiirtä käyttäen. Muokkaa kuviot koodiksi ja kopioi ne [P5-editoriin](https://editor.p5js.org/). Sivustolla [codeguppy - Artist](https://codeguppy.com/code.html?t=artist): piirrä kuvioita käyttäen Artist-koodia. Tarkastele, miten piirtämäsi kuvio voidaan piirtää käyttäen ohjelmakoodia. 

- [ ]  Valitse hiirellä generoitu koodi ja kopioi se esimeriksi selaimessa toimivaan p5-editoriin.
- [ ]  Katso Youtube-video: piirtäminen editorissa [2-piste-ja-viivakuviot](https://maol.fi/materiaalit/taidetta-ohjelmoimalla/2-piste-ja-viivakuviot/).

## Kurssi 2

### Kesken

- Mitä seuraavaksi haluat tehdä?

### Interaktiivisuus

Kuviot seuraavat hiiren liikkeitä, katso ja kokeile: [mouseX ja mouseY](https://maol.fi/materiaalit/taidetta-ohjelmoimalla/3-tasokuviot/mousex-ja-mousey/). 

- [ ] Kopioi koodi editoriin. Valitse koodi, klikkaa hiiren oikeaa näppäintä ja kopioi. Mene editoriin ja liimaa koodi editoriin. Paina <i style="font-size:18px" class="fa">&#xf04b;</i>-näppäintä.

### Haastava lisätehtävä

Nostoauto esimerkki [täällä](https://maol.fi/materiaalit/taidetta-ohjelmoimalla/5-muuttujat/nostoauto/) ja kopio editoitavissa omassa P5-editorissa: <a href="https://editor.p5js.org/haques/sketches/McqXpW-WZ" target="_blank" rel="noopener"><span>Nostoauto - MAOL</span> </a>


# Lisämateriaalia

- peliohjelmointiin vinkkejä: [pulustudio.com](https://www.pulustudio.com/asteroids-pelin-ohjelmointi/). 
- p5-komentoja (reference) englanniksi: [p5js.org/reference](https://p5js.org/reference/).

# Auta Ukrainaa

<blockquote class="twitter-tweet"><p lang="fi" dir="ltr">Ihmiset, kutsutaan kaikki pääsiäismaanantaina klo 12 Senaatintorille näyttämään, että toimimme Ukrainan rinnalla taistelussa vapauden, demokratian ja rauhan puolesta. VAPAA UKRAINA - VAPAA MAAILMA!<a href="https://twitter.com/hashtag/suomivoitehdaenemman?src=hash&amp;ref_src=twsrc%5Etfw">#suomivoitehdaenemman</a> <a href="https://twitter.com/hashtag/vapaaukraina?src=hash&amp;ref_src=twsrc%5Etfw">#vapaaukraina</a> <a href="https://twitter.com/hashtag/vapaamaailma?src=hash&amp;ref_src=twsrc%5Etfw">#vapaamaailma</a><a href="https://t.co/gROTDHrUzT">https://t.co/gROTDHrUzT</a> <a href="https://t.co/ItC4S3J5yn">pic.twitter.com/ItC4S3J5yn</a></p>&mdash; Pilvi Torsti (@pilvitorsti) <a href="https://twitter.com/pilvitorsti/status/1514861534194937860?ref_src=twsrc%5Etfw">April 15, 2022</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>





### Vastuuvapauslauseke

Tämä julkaisu on tehty parhaan oman tietämyksemme ja ymmärtämyksemme pohjalta. Olemme tehneet kaiken voitavamme tietojen täsmällisyyden ja oikeellisuuden takaamiseksi, [talonendm](https://talonendm.github.io/) ei ole vastuussa mistään virheistä tai puutteista tai mistään suorasta, epäsuorasta tai välillisestä
vahingosta, joka on aiheutunut tietojen virheellisestä soveltamisesta. Pidätämme oikeuden muutoksiin.