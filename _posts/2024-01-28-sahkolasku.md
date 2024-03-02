---
layout: post
title: Sähkölaskulaskuja
subtitle: analyysia ja kielimallin kanssa keskustelua
tags:
  - Pörssisähkö
  - chatGPT
comments: false
cover-img: /assets/pics/cover/e1024/e-book-notes.jpg
thumbnail-img: /assets/pics/thumbnail/e640-direct/2023/tuulivoimala.jpg
published: true
---

Onko sähkösopimuksissa suuria eroja vai ei? Eri lähteissä pörssisähkösopimusta suitsutetaan, vaikka se ei välttämättä sellainen ole (omakotitaloasujalle). 
- "Energian säästäminen on puhuttanut etenkin kovien pakkasten aikaan."
- "Osan ilma-vesilämpöpumppujen lämmöntuotto hiipuu kokonaan noin -20–25 asteen ulkolämpötiloissa." [^3]
- "Ilta-Sanomien taannoin tekemästä selvityksestä ilmenee, että pörssisähkö on viime vuonna todennäköisesti tullut selvästi halvemmaksi kuin kahden vuoden määräaikainen sopimus."
- "Jos sähkölämmitteisen omakotitalon asukas otti kahden vuoden määräaikaisen sähkösopimuksen vuoden 2022 syyskuussa, saattoi viime vuoden sähkölasku nousta jopa 8 000 euroon, kun taas pörssisähkösopimuksella lasku olisi samalla kulutuksella pysynyt alle 1 500 eurossa."
- "Ihmiset laskevat, että pörssin keskihinta tulee edullisimmaksi, mutta pitää laskea kulutuksellinen keskihinta eli milloin sähköä kuluu todella. Kahdentoista kuukauden keskihinta ei anna oikeaa tulosta. Kesällä pörssisähkö voi olla halpaa, mutta talvella jolloin sitä todella kuluu, se on kallista, toinen vastaaja kertoi Ilta-Sanomille." [^1] 
- "Oksanen siirtyi maaliskuussa 2023 Helenin pörssisähköön ja on pysynyt siinä sen jälkeen. Sähkön siirrosta vastaa Järvi-Suomen Energia." [^12]

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

![b.01.sahko2401](/assets/pics/page/R/240128-sahkolasku.png){: .mx-auto.d-block :}

Tammikuussa 2024 määräaikainen sähkösopimus tuli hieman edullisemmaksi kuin se, että asukas olisi valinnut pörssisähkösopimuksen.

~~~R

otsikko <- paste0(
  "Sähkölämmitteinen omakotitalo:\nkulutuksella painotettu pörssihinta ", 
  round(porssisahkopainotettukahinta,2), 
  " c/kWh vs.\n vakiosoppari 9,45 c/kWh"
)

library(ggplot2)
Sys.setlocale("LC_TIME", "Finnish")
ggplot2::ggplot(da2, ggplot2::aes(x = t, y = hinta, color = sopimus)) + 
  ggplot2::geom_line(size = 1.2) + 
  ggplot2::xlab("Päiväys") +
  ggplot2::ggtitle(otsikko) + 
  ylab("Kustannus €")

~~~


## Sankey diagram for a winter day's energy distribution

- Varaavalla takalla vähennetään sähkön kulutusta keskimäärin noin 2 000 kilowattituntia vuodessa, mutta kyllä parhaat pääsevät jopa 8000 kilowattituntiin. [^8]
-  Levossa ihminen tuottaa keskimäärin 100 wattia lämpöä, kun taas kotitöitä tehtäessä lämmöntuotanto kasvaa jo 250 wattiin. Jos rasitus on keskiraskasta, lämpöä syntyy 500 wattia. "Ihmisen perusmetabolia tuottaa lämpöä noin 58 W/m² eli keskimäärin 110 W. Aikuisen ihmisen jäähtyessä säätelyn alainen lämmön tuotto perustuu ennen kaikkea lihasvärinän ja lihastyön tuottamaan lämpöön." [^9]
-  "Hehkulamput on jo todettu niin surkeiksi valonlähteiksi, että ne täytyi kieltää, mutta kynttilä se vasta heikoksi jääkin: kynttilän palaessa vapautuvasta energiasta alle tuhannesosa nähdään valona." [^10]
-  Elmukelmu ja perunat [^11]

<!-- https://mermaid.js.org/syntax/sankey.html  -->

<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>


<!-- NOTE: these do not work in P5, here it is ok! 
    width: 800 too wide, lets try 700 
    
    
Links Coloring
You can adjust links' color by setting linkColor to one of those:

source - link will be of a source node color
target - link will be of a target node color
gradient - link color will be smoothly transient between source and target node colors
hex code of color, like #a1a1a1
Node Alignment
Graph layout can be changed by setting nodeAlignment to:

justify
center
left
right

    
     -->

<script>
  const config = {
    startOnLoad: true,
    securityLevel: 'loose',
    sankey: {
      width: 700,
      height: 350,
      linkColor: 'source',
      nodeAlignment: 'left',
    },
  };
  mermaid.initialize(config);
</script>

<pre class="mermaid">     


%% CSV !!!!!

sankey-beta

Energy, Hot Water, 8
Energy, Heating,59
Energy, Lighting,8
Energy, Kitchen, 3
Energy, Cooking, 2
Energy, Hygiene, 2
Cooking, Kitchen, 2
Energy, Sauna, 5
Sauna, Heating, 3
Sauna, Hygiene, 2
Hot Water, Hygiene, 5
Hot Water, Kitchen, 3
Fire place, Heating, 9
People, Heating, 7
Candles, Heating, 0.799
Candles, Lighting, 0.001
Energy, Electronic devices, 13
Electronic devices, Lighting, 2
Electronic devices, Heating, 11


</pre>


ChatGPT Turbo 3.5:sen näkemys energian kulutuksesta:

~~~

                  +-----------+
                  |  Energy   |
                  |  Source   |
                  +-----|-----+
                        |
         +--------------|--------------+
         |              |              |
    +----v----+  +----v----+  +----v----+
    | Heating |  | Lighting|  | Devices |
    | System  |  |         |  |         |
    +----|----+  +----|----+  +----|----+
         |             |            |
         |             |            |
         |             |            |
  +------v-------+ +--v--+ +-------v--------+
  | Radiators   | | LED | |  Electronic   |
  |              | |     | |  Devices      |
  +--------------+ +-----+ +---------------+
         |             |            |
         |             |            |
         |             |            |
  +------v-------+ +--v--+ +-------v--------+
  | Hot Water   | | TV  | |   Computer    |
  | Boiler      | |     | |               |
  +--------------+ +-----+ +---------------+

~~~



# R detailed analysis

~~~R

# Assuming your data frame is named df
df$date <- as.Date(paste(df$vuosi, df$kuukausi, df$paiva, "01", sep = "-"))

# Now you can remove the individual year and month columns if needed
df <- df[, !(names(df) %in% c("vuosi", "kuukausi", "paiva"))]

# OR

df <- df %>% dplyr::ungroup() %>% dplyr::select(-vuosi, -kuukausi, -paiva)

~~~





~~~R

ggplot2::ggplot(
  data = df, 
  ggplot2::aes(x = date, 
               y = sum_kulutus,
               color = kellonaika)
) + 
  ggplot2::geom_point(size = 0.5) + 
  ggplot2::stat_smooth(size = 1.2, se = FALSE, span = 0.25, n = 60) +
  ggplot2::ylab("avg(kWh/h)") + ggplot2::ggtitle("Energian kulutus vuorokaudessa")

~~~

# Lopuksi


## Hintavertailu

Tänne tarkoitus poimia saatavilla olevia tarjouksia. Hyvän palvelun tarjoaa myös[sahkonkilpailutus](https://www.sahkon-kilpailutus.fi/vertailu/), missä laajemmin tiedot tarjouksista linkkeineen.

### 4.2.2024

- Fortum: 7.99 snt/kWh, 3.99 €/kk
- Hehku: 8.95 snt/kWh, 0.00 €/kk
- Nordic Green: Spot + 0.45 snt/kWh, 1.99 €/kk
- Nordic Green: 8.29 €/kk, 3.99 €/kk
- Helen: 8.75 snt/kWh, 5.99 €/kk
- [PKV](https://paneliankoskenvoima.fi/): 
  - 24 kk, 8,95 snt/kWh, 3.95€/kk
  - Kosken [markkinaWoimaa](https://paneliankoskenvoima.fi/fi-fi/tuotteet-ja-palvelut/hinnastot/20/) 0,4 snt/kWh marginaalilla
- Oomi: 1.3.2024-
  - yli 400 000 kuluttaja- ja yritysasiakasta.
  - Marginaali nousee 0,25 snt/kWh -> 0,59 snt/kWh.
  - 4.95€/kk [^13] 

### 28.2.2024

- [Fortum](https://www.fortum.fi/kotiasiakkaille/sahkoa-kotiin/sahkosopimukset?utm_term=m%C3%A4%C3%A4r%C3%A4aikainen+s%C3%A4hk%C3%B6sopimus): Energian hinta 7,89 c/kWh
  - +/- kulutusvaikutus
  - Perusmaksu 3,99 €/kk
- Helen 4.3. asti voimassa: Perusmaksu: 3,99 €/kk, Energia: 8,59 c/kWh. ks. meilit.
  -  0,38 snt/kWh marginaalilla + 3,93 € / kk. 
- [PKV](https://paneliankoskenvoima.fi/): 
  - 24 kk, 8,95 snt/kWh, 3.95€/kk
  - Kosken [markkinaWoimaa](https://paneliankoskenvoima.fi/fi-fi/tuotteet-ja-palvelut/hinnastot/20/) 0,4 snt/kWh marginaalilla
  - Energiaraportit PKV - [kirjautuminen](https://energiaraportit.fi/paneliankoskenvoima/fi/login)
  - Toistaiseksi voimassa oleva: 9,55 snt/kWh ja perusmaksu 3,95 €/ kk (sis. alv. 24%)


# Fingrid 

- [asiakasportaali](https://www.fingrid.fi/sahkomarkkinat/datahub/kirjautuminen-datahubin-asiakasportaaliin/)
  - "Kohdassa Asioi toisen puolesta voit asioida toisen käyttäjän puolesta, mikäli toinen osapuoli on valtuuttanut sinut Suomi.fi-palvelussa asioimaan hänen puolestaan. Asioi yrityksenä kohdassa voit asioida yrityksen puolesta, mikäli sinulta löytyy Suomi.fi-palvelussa annettu valtuus edustaa yhtiötä palvelussa."
  - suomi.fi valtuus: "Sähkösopimusten tietojen katselu": "Tällä valtuudella valtuutettu voi katsella sähkösopimusten tietoja ja antaa palveluntarjoajille luvan valtuuttajan sähkösopimusten ja sähkön kulutustietojen tarkasteluun."
    - [Datahub](https://oma.datahub.fi/#/login)

## Kaupan purku

Tässä vielä esim. lämpöpumppuihin tai aurinkopaneeleihin liittyvä "haaste": "Ostajalla on oikeus purkaa kauppa, jos myyjän toimitus viivästyy siten, että tämä sopimusrikkomus on ostajalle olennainen, myyjä ei toimita tavaraa ostajan asettamassa kohtuullisessa lisäajassa, tai jos **tavassa** on **virhe**, jota ei voi korjata tai toimittaa uutta tavaraa kohtuullisessa ajassa reklamaatiosta huolimatta. Ostajan on kuitenkin oltava varma siitä, että sopimusrikkomus on olennainen, ja myyjän on tullut ymmärtää tai pitänyt ymmärtää tämä. Vaikka tavara olisi myyty osamaksulla, ostajalla on oikeus purkaa kauppa myyjän viivästyksen tai **tavaran virheen vuoksi**, jos myyjä rikkoo sopimusvelvoitteitaan tavalla, joka on olennainen ostajalle, **eikä virheen korjaaminen** tai uuden tavaran toimittaminen ole mahdollista." [^3], [^4] (Tummennukset lisätty)


# Links

- Sheets [private ta.dm](https://docs.google.com/spreadsheets/d/1khNHvD_jq5zCdLZW7wAnOAJS81ThxjPPSlxytaiLnDg/edit?usp=sharing) vasteita, takka, säädöt ym.
- HattiWatt - sähkön hinta: [playstore](https://play.google.com/store/apps/details?id=com.arcinix.hattiwatt)
- Hinta nyt: [https://energy.semeai.fi/](https://energy.semeai.fi/), [github](https://github.com/sjlehtin/semerg)
- "Tappiot 140–400 miljoonaa: 1 100 Porschella ja 3 000 muulla autolla lastatun rahtilaivan sammutus epäonnistui keskellä Atlanttia" [Tekniikka ja talous](https://www.tekniikkatalous.fi/uutiset/sahkoautojen-akut-pitivat-tulta-ylla-tappiot-140400-miljoonaa-1100-porschella-ja-3000-muulla-autolla-lastatun-rahtilaivan-sammutus-epaonnistui-keskella-atlanttia/088b4f38-4655-4da7-93e5-4b71d09aa70a): "Felicity Ace"
- [https://caruna.fi/](https://caruna.fi/)
- [https://sahko.tk/](https://sahko.tk/): "1.5.2023 alkaen sähkön arvonlisävero on jälleen 24 %. Kuvaajassa aikavälin 1.12.2022 - 30.4.2023 hinnat ovat alv 10 %. Hallitus on päättänyt sähkön energiamaksun väliaikaisesta arvonlisäveron alennuksesta. Joulukuusta 2022 alkaen sähkön alv on 10 %. Alennus on tällä päätöksellä voimassa huhtikuun 2023 loppuun asti."

---

[Disclaimer](https://talonendm.github.io/disclaimer)

---

## Lähteet

[^1]: "Nyt puhuvat tavalliset suomalaiset: Ei ollut halpaa pörssisähkö, 500–600 euron lasku joka kuukausi" [IS 16.1.2024](https://www.is.fi/taloussanomat/art-2000010122991.html)
[^2]: "Sähkötarjoukset halpenivat – tällaisia sopimuksia on nyt tarjolla" [HS 28.1.2024](https://www.hs.fi/talous/art-2000010150610.html)
[^3]: "Markun lämpöpumppu osoittautui sudeksi – Myyjältä tyly ukaasi" [IL 30.1.2024](https://www.iltalehti.fi/asumisartikkelit/a/c812e29d-7bc5-4df0-8958-cc49fb8a30d7)
[^4]: Minilex [kaupanpurku](https://www.minilex.fi/a/osamaksukaupan-purku)
[^5]: "Pörssisähkö maksoi viime vuonna keskimäärin seitsemän senttiä kilowattitunnilta, mutta hinta on vain osatotuus sähkön todellisesta hinnasta pörssisopimuksen tehneelle kuluttajalle." [KL 26.1.2024](https://www.kauppalehti.fi/uutiset/porssisahkon-vaitetaan-olevan-aina-halvempi-keskiarvohinta-kertoo-vain-osan-totuudesta/23d0b89f-4561-40b3-8823-ee6f2ee6ffd9)
[^6]: "Sadattuhannet jumissa kalliissa sopimuksessa – kuluttaja-asiamies neuvoton" [HS 20.9.2023](https://www.hs.fi/talous/art-2000009867277.html)
[^7]: "Kiteeläinen maitotilallinen otti aggregaatin käyttöön ja huomasi polttoöljyllä tuotetun sähkön tulevan nyt pörssisähköä edullisemmaksi" [Maaseudun tulevaisuus 15.12.2022](https://www.maaseuduntulevaisuus.fi/uutiset/052c51bf-2085-4f3f-8c08-4ca982088982)
[^8]: "Näin kannattavaa on lämmittää varaavalla takalla – ostetuilla klapeillakin säästää satoja euroja" [IS 2.10.2017](https://www.is.fi/taloussanomat/art-2000005391951.html) 
[^9]: "Ihmisen kylmävasteet ja toimintakyky", 2005, Hannu Rintamäki, Lawrence A. Palinkas ja Juhani Leppäluoto [Duodecim](https://www.duodecimlehti.fi/duo94810)
[^10]: "TM selvitti: Miten kynttilä toimii? Energiasta alle tuhannesosa näkyy valona" [TM 18.2.2017](https://tekniikanmaailma.fi/tm-selvitti-nain-toimii-kynttila-energiasta-tuhannesosa-nakyy-valona/)
[^11]: "elmu" [IL](https://www.iltalehti.fi/ruoka-artikkelit/a/64e1c895-285b-46e7-ad72-f265af3835cd)
[^12]: "Martti tilastoi kaiken sähkön­kulutuksensa 7 vuotta – data paljasti yllätyksiä" [IS 4.2.2024](https://www.is.fi/taloussanomat/art-2000010141932.html)
[^13]: "Oomin pörssisähkö kallistuu
Oomi: ”Hinnanmuutoksen perusteena on sähkönhankintaan ja liiketoimintaan liittyvien kustannusten nousu.”" [IL 6.2.2024](https://www.iltalehti.fi/talous/a/7119afb4-bd72-489c-8a24-47dfe27eb6fb)