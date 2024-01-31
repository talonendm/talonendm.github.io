---
layout: post
title: Sähkölaskulaskuja
subtitle: analyysia ja kielimallin kanssa keskustelua
tags:
  - Pörssisähkö
  - chatGPT
comments: false
cover-img: /assets/pics/cover/e1024/e-book-notes.jpg
thumbnail-img: /assets/pics/thumbnail/e384-direct/e-IMG20230504215854.jpg
published: true
---

Onko sähkösopimuksissa suuria eroja vai ei? Eri lähteissä pörssisähkösopimusta suitsutetaan, vaikka se ei välttämättä sellainen ole (omakotitaloasujalle). 
- "Energian säästäminen on puhuttanut etenkin kovien pakkasten aikaan."
- "Osan ilma-vesilämpöpumppujen lämmöntuotto hiipuu kokonaan noin -20–25 asteen ulkolämpötiloissa." [^3]
- "Ilta-Sanomien taannoin tekemästä selvityksestä ilmenee, että pörssisähkö on viime vuonna todennäköisesti tullut selvästi halvemmaksi kuin kahden vuoden määräaikainen sopimus."
- "Jos sähkölämmitteisen omakotitalon asukas otti kahden vuoden määräaikaisen sähkösopimuksen vuoden 2022 syyskuussa, saattoi viime vuoden sähkölasku nousta jopa 8 000 euroon, kun taas pörssisähkösopimuksella lasku olisi samalla kulutuksella pysynyt alle 1 500 eurossa."
- "Ihmiset laskevat, että pörssin keskihinta tulee edullisimmaksi, mutta pitää laskea kulutuksellinen keskihinta eli milloin sähköä kuluu todella. Kahdentoista kuukauden keskihinta ei anna oikeaa tulosta. Kesällä pörssisähkö voi olla halpaa, mutta talvella jolloin sitä todella kuluu, se on kallista, toinen vastaaja kertoi Ilta-Sanomille." [^1] 

Milloin pörssisähkö kannattaa ja missä tilanteessa aggregaatille [^7] tulee käyttöä? Kannattaa siis laskea kulutuksella painotettu sähköenergian keskihinta.

~~~Python

# Generoi samantyylinen vastaus

prompt = f"""
Your task is to answer in a consistent style. Answer in Finnish.

<child>: Kerro minulle pörssisähköstä.

<grandparent>: pörssisähköstä.. tuleeko halvemmaksi vai ei? Useasti pörssisähkösopimusta suitsutenaan, vaikka omakotitaloasujalle se ei välttämättä sellainen ole: "Ilta-Sanomien taannoin tekemästä selvityksestä ilmenee, että pörssisähkö on viime vuonna todennäköisesti tullut selvästi halvemmaksi kuin kahden vuoden määräaikainen sopimus." ja "Jos sähkölämmitteisen omakotitalon asukas otti kahden vuoden määräaikaisen sähkösopimuksen vuoden 2022 syyskuussa, saattoi viime vuoden sähkölasku nousta jopa 8 000 euroon, kun taas pörssisähkösopimuksella lasku olisi samalla kulutuksella pysynyt alle 1 500 eurossa." ja "Ihmiset laskevat, että pörssin keskihinta tulee edullisimmaksi, mutta pitää laskea kulutuksellinen keskihinta eli milloin sähköä kuluu todella. Kahdentoista kuukauden keskihinta ei anna oikeaa tulosta. Kesällä pörssisähkö voi olla halpaa, mutta talvella jolloin sitä todella kuluu, se on kallista, toinen vastaaja kertoi Ilta-Sanomille." [^1] Ei siis lasketa kustannuksia siten kuten ihmiset, vaan tässä blogissa näytetään miten painotettu keskihinta lasketaan.

<child>: Säästääkö ilmalämpöpumpulla sähköä?
"""
response = get_completion(prompt)
print(response)

# deeplearning.ai

~~~

output [Turbo 3.5](https://platform.openai.com/docs/guides/text-generation/chat-completions-api):

~~~Python

<grandparent>: Kyllä, ilmalämpöpumpun avulla voi säästää sähköä. Ilmalämpöpumppu hyödyntää ulkoilman lämpöä ja siirtää sen sisätiloihin lämmitykseen tai jäähdytykseen. Tämä vähentää tarvetta käyttää perinteistä sähkölämmitystä tai ilmastointilaitetta, mikä voi johtaa merkittäviin säästöihin sähkölaskussa. Ilmalämpöpumpun energiatehokkuus ja käyttöolosuhteet vaikuttavat kuitenkin siihen, kuinka paljon sähköä todellisuudessa säästyy. On tärkeää valita oikean kokoinen ja tehokas ilmalämpöpumppu sekä käyttää sitä oikein, jotta saavutetaan parhaat mahdolliset säästöt.

child -> omakotiasukas
grandparent -> toimittaja

<toimittaja>: Kyllä, ilmalämpöpumpun käyttö voi auttaa säästämään sähköä omakotitalossa. Ilmalämpöpumppu hyödyntää ulkoilman lämpöä ja siirtää sen sisätiloihin lämmitykseen tai jäähdytykseen. Tämä voi vähentää tarvetta käyttää sähkölämmitystä tai ilmastointilaitteita, mikä puolestaan voi alentaa sähkönkulutusta ja siten säästää energiaa. On kuitenkin tärkeää huomioida, että ilmalämpöpumpun tehokkuus ja säästöt riippuvat monista tekijöistä, kuten talon eristyksestä, ilmavirtauksista ja käyttötavoista.

~~~


Onko tämä hinta korkeampi, jolloin kannattaa hankkia kiinteähintainen sopimus: "Edullisimmissa kiinteähintaisissa sopimuksissa sähköenergia maksaa nyt hieman alle yhdeksän senttiä kilowattitunnilta, selviää [Energiaviraston vertailupalvelusta](https://www.sahkonhinta.fi/)." [^2] Jos on mahdollisuus asettaa yösähkö esimerkiksi lämminvesivaraajalle, niin paras vaihtoehto saattaa olla "joustosopimus". "Tyypillisesti kulutusvaikutuksen kerrotaan olevan sopimuksissa noin 1,5 senttiä kilowattitunnilta suuntaansa, eli joko kiinteää hintaa laskien tai nostaen." [^2], [^5] Kuluttaja-asiamies on etsinyt keinoja kalliiden määräaikaisten sopimusten kohtuullistamiseksi. Sillä ei kuitenkaan ole käytössä olevia keinoja auttaa ahdingossa olevia kuluttajia. [^6] (Keskustelusta: "Kuluttajavirasto on olemassa sitä varten että olisi ketterämpi elin joka ratkaisee nopeasti kuluttajien ongelmia häiriötilanteissa. Jos yritykset lopettavat sen suositusten noudattamisen oikeusasteet ruuhkautuvat hyvin nopeasti entisestään kun jokainen kuluttaja joutuu käymään raskaan prosessin läpi saadakseen oikeusturvaa.")

# Koodi

private [ta.dm](https://docs.google.com/document/d/1bZe9BhvIAwEv39FTTzlkiU4YRZ-kIH9iSdpZ5zvZjwY/edit?usp=sharing)

~~~R

filename <- "<filename>.xlsx" # "electricity_report_01_01_2021_18_01_2024.xlsx"
library(readxl)
library(dplyr)

sopparihinta <- 9.45 # c/kWh
sopparikuukausi <- 3 * 100  # HINTA SENTEISSA

# [Helen]
# Pörssi: # Sähkön hintasi määräytyy tuntikohtaisen sähkön spot-hinnan mukaan, jonka lisäksi maksat kiinteän marginaalin.
# Tarkastele pörssisähkön tuntihintoja
# Perusmaksu: # 3,93eur/kk # Energia # 0,38c/kWh

porssimarginaali = 0.38
porssikuukausi <- 3.93 * 100 

da0 <- readxl::read_xlsx(path = paste0(path, filename), col_types = c("date", "numeric", "numeric", "numeric", "numeric"))
da0a <- da0 %>% dplyr::filter(!is.na(`Sähkönkulutus kWh`))

da1 <- da0a %>% dplyr::mutate(hintavakio = sopparihinta * `Sähkönkulutus kWh`, hintaporssi = `Sähkönkulutus kWh` * (`Pörssisähkön hinta c/kWh` + porssimarginaali) )

# Probably there is better way to do this:
da1$kuukausivaihtui <- lubridate::month(da1$Ajankohta) - lag(lubridate::month(da1$Ajankohta))
da1$kuukausivaihtui[1] <- 1
da1$kuukausivaihtui[da1$kuukausivaihtui!=0] <- 1

da1 <- da1 %>% dplyr::mutate(sopparikk = sopparikuukausi * kuukausivaihtui)
da1 <- da1 %>% dplyr::mutate(sahkokk = porssikuukausi * kuukausivaihtui)
da1 <- da1 %>% dplyr::mutate(hintavakiocum = cumsum(hintavakio) + cumsum(sopparikk), hintaporssicum = cumsum(hintaporssi) + cumsum(sahkokk))

~~~

# Kuvat

LATER



# Lopuksi


## Kaupan purku

"Ostajalla on oikeus purkaa kauppa, jos myyjän toimitus viivästyy siten, että tämä sopimusrikkomus on ostajalle olennainen, myyjä ei toimita tavaraa ostajan asettamassa kohtuullisessa lisäajassa, tai jos **tavassa** on **virhe**, jota ei voi korjata tai toimittaa uutta tavaraa kohtuullisessa ajassa reklamaatiosta huolimatta. Ostajan on kuitenkin oltava varma siitä, että sopimusrikkomus on olennainen, ja myyjän on tullut ymmärtää tai pitänyt ymmärtää tämä. Vaikka tavara olisi myyty osamaksulla, ostajalla on oikeus purkaa kauppa myyjän viivästyksen tai **tavaran virheen vuoksi**, jos myyjä rikkoo sopimusvelvoitteitaan tavalla, joka on olennainen ostajalle, **eikä virheen korjaaminen** tai uuden tavaran toimittaminen ole mahdollista." [^3], [^4] (Tummennukset lisätty)


# Links

- HattiWatt - sähkön hinta: [playstore](https://play.google.com/store/apps/details?id=com.arcinix.hattiwatt)
- Hinta nyt: [https://energy.semeai.fi/](https://energy.semeai.fi/), [github](https://github.com/sjlehtin/semerg)
- "Tappiot 140–400 miljoonaa: 1 100 Porschella ja 3 000 muulla autolla lastatun rahtilaivan sammutus epäonnistui keskellä Atlanttia" [Tekniikka ja talous](https://www.tekniikkatalous.fi/uutiset/sahkoautojen-akut-pitivat-tulta-ylla-tappiot-140400-miljoonaa-1100-porschella-ja-3000-muulla-autolla-lastatun-rahtilaivan-sammutus-epaonnistui-keskella-atlanttia/088b4f38-4655-4da7-93e5-4b71d09aa70a): "Felicity Ace"

---

[Disclaimer](https://talonendm.github.io/disclaimer)

---

## Kirjallisuus

[^1]: "Nyt puhuvat tavalliset suomalaiset: Ei ollut halpaa pörssisähkö, 500–600 euron lasku joka kuukausi" [IS 16.1.2024](https://www.is.fi/taloussanomat/art-2000010122991.html)
[^2]: "Sähkötarjoukset halpenivat – tällaisia sopimuksia on nyt tarjolla" [HS 28.1.2024](https://www.hs.fi/talous/art-2000010150610.html)
[^3]: "Markun lämpöpumppu osoittautui sudeksi – Myyjältä tyly ukaasi" [IL 30.1.2024](https://www.iltalehti.fi/asumisartikkelit/a/c812e29d-7bc5-4df0-8958-cc49fb8a30d7)
[^4]: Minilex [kaupanpurku](https://www.minilex.fi/a/osamaksukaupan-purku)
[^5]: "Pörssisähkö maksoi viime vuonna keskimäärin seitsemän senttiä kilowattitunnilta, mutta hinta on vain osatotuus sähkön todellisesta hinnasta pörssisopimuksen tehneelle kuluttajalle." [KL 26.1.2024](https://www.kauppalehti.fi/uutiset/porssisahkon-vaitetaan-olevan-aina-halvempi-keskiarvohinta-kertoo-vain-osan-totuudesta/23d0b89f-4561-40b3-8823-ee6f2ee6ffd9)
[^6]: "Sadattuhannet jumissa kalliissa sopimuksessa – kuluttaja-asiamies neuvoton" [HS 20.9.2023](https://www.hs.fi/talous/art-2000009867277.html)
[^7]: "Kiteeläinen maitotilallinen otti aggregaatin käyttöön ja huomasi polttoöljyllä tuotetun sähkön tulevan nyt pörssisähköä edullisemmaksi" [Maaseudun tulevaisuus 15.12.2022](https://www.maaseuduntulevaisuus.fi/uutiset/052c51bf-2085-4f3f-8c08-4ca982088982)