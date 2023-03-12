---
published: false
layout: post
title: University
subtitle: Lessons learned
tags:
  - University
  - TKK
  - Aalto
  - studies
comments: false
cover-img: /assets/pics/cover/photo/sunflower.JPG
thumbnail-img: /assets/pics/thumbnail/photo/sieni2016.JPG
usemathjax: true
published: true
---

Generally: Lecture notes, data source: blackboard, overhead projector and copies. 

Data related on courses (lecturer, year etc. available) for me at [Google sheet /data/git/](https://docs.google.com/spreadsheets/d/12JFGGhikQjEroUtw-VM7BH_R2bCjIqYJrKMXsMunElc/edit?usp=sharing).


# P1 ja P2 Matematiikka Mat-1.441 ja 1.442

Ottaita muistiinpanoista: [ta.dm](https://docs.google.com/document/d/12k9p9jWPxdxX6sa5lrkheZIBTdBF1wSFcDSiEXbLst4/edit?usp=sharing)
- Matriisit
- yhteenlasku
- reaaliluvun ja matriisin kertolasku
- tangentti yksikköympyrässä
- kulman esitys radiaaneissa
- matemaattinen induktio, on väline väitöksien todistamiseksi, jotka pätevät jokaiselle $$n \in N$$.
- [Gaussin eliminaatio](https://fi.wikipedia.org/wiki/Gaussin_algoritmi), [youtube](https://www.youtube.com/watch?v=dvPqTD-Lmgk)
- Funktion raja-arvo: $$lim_{x\rightarrow 2} x^2 = 4$$, oma muistiinpano Täh? :D [Raja-arvon kuristaminen](http://www.math.jyu.fi/matpo/kirja/rfa/index-54.html)

# P2

- [Tangenttitaso](https://matta.hut.fi/matta2/isom/html/tangnorm2.html)
- [De Morganin lait](https://fi.wikipedia.org/wiki/De_Morganin_lait) ovat logiikan päättelysääntöjä.
- Yhdistetty funktio [PDF](http://math.tkk.fi/opetus/sovtoda/luennot/vanhat/JOLIITE1.pdf)
- [ketjusääntö](https://fi.wikipedia.org/wiki/Ketjus%C3%A4%C3%A4nt%C3%B6): "Differentiaalilaskennassa ketjusääntö antaa keinon derivoida yhdistetty funktio."
- [Lagrange](https://fi.wikipedia.org/wiki/Lagrangen_kertoimet)
- [Cobb–Douglas production](https://en.wikipedia.org/wiki/Cobb%E2%80%93Douglas_production_function)
- [Stokesin](https://fi.wikipedia.org/wiki/Stokesin_lause) lause: "yhdistää suljetun polkuintegraalin sekä polun rajaaman avoimen pinnan pintaintegraalin."







# Monimuuttujamenetelmät prossitekniikassa
Original source: copies and notes (2003) and finally in garbage (2021).

- [PCA](https://en.wikipedia.org/wiki/Principal_component_analysis) (Hotelling ja SPE), Rekursiivinen PCA, Epälineaarinen PCA, MSPCA
- [PLS](https://fi.wikiqube.net/wiki/Partial_least_squares) eli osittaisten neliösummien menetelmä, see e.g. [PLS-REGRESSIO KEMOMETRIAN KALIBROINTIONGELMASSA](http://salserver.org.aalto.fi/vanhat_sivut/Opinnot/Mat-2.4108/pdf-files/esaa08.pdf), RPLS. PLS Demossa aikasarjadataa ja esim. autokorrelointi näkyy Loadings pc1 ja pc2 kuvissa. Prosssidata yleensä kollineaarista eli mittarien lukemat riippuvat toisistaan.
- ARX malli: valkoisen kohinan e(k) sijaan värillistä kohinaa v(k). Kohinasuodatin pyrkii eliminoimaan ainoastaan bias-termin. Haasteet: harvoin niin että malli tuntematon, mutta kohina tunnettu. Yleinen periaate on tehdä malli ja tutkia residuaaleja. Jos korrelaatiota tai värillistä kohinaa esiintyy niin suodatin tarvitaan mahdollisesti.
- ARX PNS ym. lisää menetelmiä täällä: [Menetelmia regressiomallin estimointiin kompleksisessa otanta-asetelmassa](https://jyx.jyu.fi/bitstream/handle/123456789/38594/URN:NBN:fi:jyu-201209202467.pdf?sequence=1).
- [aallokeanalyysi](https://www.akustinenseura.fi/wp-content/uploads/2015/09/AP2015_Paperin_palautus_21.pdf)
- SOM: Kohosen itseorganisoituva kartta. Voi soveltaa esim. [leijukerrosrakeistusprosessi](http://fi.qiangdijetmill.com/wp-wdg-system-apply-to-agrochemical-field-product/)
- Adaptive resonance theory [ART](https://en.wikipedia.org/wiki/Adaptive_resonance_theory).
- Harjoitustyö: paperinvalmistusprosessi X dataa, Y paperin laatuparametreja. PLS malli. Y = (Rainautuminen eli formaatio, paperin vetolujuus, paperin opasiteetti)
- painokertoimet: adaptiivisissa systeemeissä yleensä ekspotentiaalien unohduskerroin, $$\lambda \epsilon ]0, 1]$$.
- Rekursiiviset estimointialgoritmit: 
  - $$\Theta(N+1) = \Theta(N + g(N)(y(N+1) - y(N+1 \mid N))$$ 
  - Mallia parannetaan uuden mittauksen avulla.
- Rekursiivinen pienimmän neliösumman menetetelmä unohdus kertoimella, ks. [Advances in Methods of Anomaly Detection and Visualization of Multivariate Data](https://aaltodoc.aalto.fi/handle/123456789/15255).
- [Umetrics - SIMCA](https://www.youtube.com/watch?v=kCisOk8bC5E)

# Digital Workshop Basics: Spring 2013
More info at [Aalto Fablab](https://fablab.aalto.fi/).
- 2D drawing for the lasercutter: Adobe Illustrator, Corel Draw, Inkscape
- 2D drawing for the vinyl cutter
- 3D design (STL format: RhinoCeros, Blender, AutoCAD, Skethup)
- 3D design for the milling machine

## 3D printer
- materials: Acrylonitrile butadiene styrene (ABS) and polyactic acid (PLA).
- file format: STL
- computer software: G-code, printer: Ultimaker.

# Kon-41.5167 Patentit

- [patentit](https://mycourses.aalto.fi/course/info.php?id=25645&lang=fi): Kurssilla perehdytään keksintöjen ja liikeideoiden suojaamis mahdollisuuksiin kotimaassa ja ulkomailla. Patentti, mallioikeus, tavaramerkki, tekijänoikeus, toiminimi ja suoja sopimatonta menettelyä vastaan. Työsuhdekeksinnöt ja keksinnöt korkeakouluissa. Riitakysymykset.

- [patenttiopas](https://www.prh.fi/stc/attachments/patentinliitteet/Patenttiopas.pdf) Patentti on vaihtokauppa keksijän ja yhteiskunnan välillä. [PRH - patentit](https://www.prh.fi/fi/patentit/palvelut_ja_tietokannat/oppaatjakoulutus.html)
tentistä poimintoja: olet tehnyt keksinnön; esitä palvelukonsepti; ohjelmistopatennonnin ja tekijänoikeussuojan väliset yhtäläisyydet ja erot. Patenttien loukkaus, miten toimia.
“patenttipeikko” IPcom vs. Nokia. 
Teollisuusoikeudet. 
Ruukki vs. Rauturuukki. Tunnusmerkkiriidat, loukkaskanteet. Selvitä aina onko merkki käytössä ts. kannattaa rekisteröidä PRH.
Kurssin harjoitustyö: ”väline lumen poistamiseksi harjakatolta”, luotiin patenttihakemus 25.2.2011. 

# Tieteen filosofia I Mat-1.3013

“Yksi tieteen filosofisen tarkastelun perustehtävistä on luoda ja tutkia sellaisia käsitteitä ja ajatustapoja, jotka auttavat meitä ymmärtämään, mitä tiede on ja mitä se voisi olla. Näin ollen tieteen filosofinen tarkastelu on kaksisuuntaista: voidaan tarkastella jälkikäteen tieteessä tapahtuneita muutoksia tai pyrkiä asettamaan etukäteen tutkimukselle uusia tavoitteita.” [tieteen filosofia](http://math.tkk.fi/teaching/tieteenfilosofia/1-3013.html)

 Platonin ja Aristoteleen yhteydessä todetaan “tulla tietämään kaiken, mikä voidaan tietää”
totuusteoriat
Immanuel Kantin koperkikaaninen [vallankumous](https://www.mv.helsinki.fi/home/olappi/lukionfilosofia/filosofit/kant.htm): “(Ts. mullistavan koko filosofian tutkimusalan niin kuin siirtyminen antiikin Maa-keskeisestä maailmankuvasta Kopernikuksen Aurinko-keskeiseen aurinkokunnan malliin oli mullistanut tähtitieteen.”
Humen [giljotiini](https://tieteentermipankki.fi/wiki/Filosofia:humen_giljotiini) ja tieteen arvovapaus:
aristoteleen naturalismi: osa luontoa, tutkitaan tiedettä sellaisena kuin se on. 
-skeptismi: sokrateen epäilyn muodot: mitään tietoa ei voi olla olemassa. Pitäisi pidättäytyä kaikista todellisuutta koskevista uskomuksista = Pyrrhonistinen skeptismi (300 ekr.). Ihmiset tekivät kaiken vain tavan ja tottumuksen vuoksi.

# Ka6j Time Series Analysis: Unit Roots and Cointegration

the problem can be stated in a time-series setting involving potentially non-stationary series
test the unit-root assumption
money demand

Wage EQUATION: nominal wage eate explained by unempoyhment rate, measure of productivity and producer price index.
Do markup dynamics reflect fundamentals or changes in conduct?: [material](http://urn.fi/URN:NBN:fi:bof-20140807229)
An Application of the Granger & Engle Two-Step Estimation Procedure to United Kingdom Aggregate Wage Data. [full-text](https://www.researchgate.net/publication/4777768_An_Application_of_the_Granger_Engle_Two-Step_Estimation_Procedure_to_United_Kingdom_Aggregate_Wage_Data) harkkatyön yks materiaaleista.
The Relevant Market for Production and Wholesale of Electricity in the Nordic Countries: An Econometric Study [paper](https://helda.helsinki.fi/handle/10138/16711)
[Cointegration implications of linear
rational expectation models](https://core.ac.uk/download/pdf/6836123.pdf)
Testing for the Price‐ and Wage‐Setting Model in Belgium Using Multivariate Cointegration Tests [paper](https://ideas.repec.org/a/bla/labour/v11y1997i1p177-199.html): unit root tests, 
[Pairs Trading, Convergence Trading, Cointegration - Daniel Herlemont](https://www.researchgate.net/publication/249912444_Pairs_Trading_Convergence_Trading_Cointegration): “just like a drunk man leaving a bar follows a random walk. His dog also follows a random walk on its own. The paths will diverge”.. original [A Drunk and Her Dog: An Illustration of Cointegration and Error Correction](http://www-stat.wharton.upenn.edu/~steele/Courses/434F2005/Context/Co-integration/Murray93DrunkAndDog.pdf)
augmented Dickey-Fuller tests (ADF): 

- [Modelling Hypothetical Wage Equation by Neural Networks](https://www.springerprofessional.de/modelling-hypothetical-wage-equation-by-neural-networks/3664832) 5/2011.



# Sovellettu Todennäköisyyslaskenta

- Todennäköisyyslaskenta: " Tapahtuman klassinen todennäköisyys on tapahtumalle suotuisien tulosvaihtoehtojen suhteellinen frekvenssi"
- Tilastolliset menetelmät
- Kaavat ja talukot [pdf](http://salserver.org.aalto.fi/vanhat_sivut/Opinnot/Mat-2.090/pdf_varasto/1_painos.pdf)
- [Prujut by Ilkka Mellin](http://math.tkk.fi/opetus/sovtodb/)


# Systeemidynamiikka
- AS-74.2400
- ohjelmisto: Vensim
- materiaalia, katso esim. kirja [Strategic_Modelling_Business_Dynamics.pdf](https://www.smv.gob.pe/Biblioteca/temp/catalogacion/Strategic_Modelling_Business_Dynamics.pdf)

## Tentti 10.5.2007
- Arvosana 22 + 5 / 30 --> 5 (oma arvio tentistä 17-23p.)
- [rajoitettu rationaalisuus](https://fi.wikipedia.org/wiki/Rajoitettu_rationaalisuus) (Bounded rationality)
- mallin rajojen venyttäminen
- [dynaaminen hypoteesi](https://www.vensim.com/documentation/21415.html)
- faasidiagrammi (Phase plane)
- [Law of Little](https://en.wikipedia.org/wiki/Little%27s_law)
- mallinnusprosessi: älä mallinna tilannetta vaan ongelmaa. 

# Ruotsi 1994 - 1997 (1-8 kurssit)

## kurssi 1 jakso 2

substantiivit: taivuta 4:ssä muodossa jokaisen deklinaation mallisanat: ett hus, huset, hus, husen
prepositiot: täyttötehtävä
adjektiivi predikatiivina ja attribuuttina


## kurssi 2

adverbi vastaa kysymykseen 
milloin: jag läste igår 
miten: jag läste flitig
mihin: jag gick hem
missä: jag läste hemma
miksi: därför kom jag för sent


## kurssi 3

ilmansuunnat: nordväst, nordost, sydväst, sydost
substantiivien taitutusluokat eli deklinaatiot 5kpl (2 yksikkö, 2 monikko). 5. deklinaatio epäsäännöllinen


## kurssi 4

verbin taivutus -> konjugaatiot
vahvojen ja epäsäännöllisten verbien taivutus
aikamuodot / futuurit
käskymuodot -> imperatiivi
konditionaali
infinitiivi / apuverbit
pronominien käyttöä:
den här = tämä
den där = tuo
hela = koko
båda = molemmat


## kurssi 5


päälauseen sanajärjestys on käänteinen esim. ajan, tavan tai paikan määre, kysymyslause, sivulause ennen päälausetta, johtolause
moderni ruotsalainen kirjakieli sai alkunsa kirjasta [Punainen huone](https://www.bookbeat.fi/kirja/223789?gclid=Cj0KCQjwnJaKBhDgARIsAHmvz6fcSiFwMJjZrtayCMlUghP3Qd0xFybjXxf-ZFhMnigA3ElJdPWBLQ4aAgocEALw_wcB) “August Strindberg (1849–1912) oli ruotsalainen kirjailija, joka työskenteli myös taidemaalarina. Hän on yksi ruotsalaisen kirjallisuushistorian merkittävimpiä kirjailijoita. “
partisiipin preesens ei taivu
sjungande = laulava
störande = häiritsevä
sjungande = laulaen
partisiipin perfekti taipuu adjektivin tavoin
lyckad, lyckadt, lyckade = onnistunut 
supiini muodosta poistetaan pääte -it, försvinna -> försvunnit => försvunn
tavallisimmat prepositiot: av, bakom, bland, efter, enlight, framför, från, för, före, (i)genom, hos
koe 5. Kurssiarvosana 6 (vaatisi enemmän työtä)

## Kurssi 6

kun lapset ovat pihalla, äiti laittaa ruokaa = När barnen är på gården, lagar mamma mat.
Tunnen kyllä kaupungin, jossa he asuvat = Jag känner mig staden, där debor.
Välitätkö minusta? Bryr du dig om mig?
Se riippuu sinusta? Det beror på dig själv.
Ota hiukan rauhallisemmin! Ta det lite lugnare!
Kaipaatko ystäviäsi? Saknar du dina vänner?


## Kurssi 7



## kurssi 8

adjektiivi attribuuttina:  en svår fråga, den svåra frågan, svåra frågor, de svåra frårorna min svåra fråga, min egen fråga
adjektiivi predikatiivina: frågan är svår, Problemet är svårt, problemen är svåra
hemma = kotona
hem = kotiin
hemifrån = kotoa
i vinter, nästa vinter, på vintern

Mappi siivottu 18.9.2021





### Vastuuvapauslauseke

Tämä julkaisu on tehty parhaan oman tietämyksemme ja ymmärtämyksemme pohjalta. Olemme tehneet kaiken voitavamme tietojen täsmällisyyden ja oikeellisuuden takaamiseksi, [talonendm](https://talonendm.github.io/) ei ole vastuussa mistään virheistä tai puutteista tai mistään suorasta, epäsuorasta tai välillisestä
vahingosta, joka on aiheutunut tietojen virheellisestä soveltamisesta. Pidätämme oikeuden muutoksiin.