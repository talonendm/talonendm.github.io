---
layout: post
title: Quick Basic
subtitle: old games wake up from coma - part 2
tags:
  - Quick Basic
  - bas
  - antique code
  - 90s
  - Texas Hold'em
comments: true
cover-img: /assets/pics/cover/screenshot/qb.JPG
thumbnail-img: /assets/pics/thumbnail/screenshot/qb.JPG
published: true
---
# Quick Basic

"From the 80s to eternity. Unlike traditional BASIC and QBasic code, QB64 gets compiled automatically into machine code – allowing exceptional performance, easy distribution, and the ability to link with external C and C++ programming libaries.", se [qb64 portal](https://www.qb64.org/portal/).

I had some problems to open old code files, [in QB45 format detected](https://www.qb64.org/forum/index.php?topic=965.0). 
Conversion worked almost all files.
Finally, I was able to open all expect one file, [GRANDPRX.BAS](https://talonendm.github.io/assets/bas/GRANDPRX.BAS). Tell me if you are able to open this file :D !!
![conversionfailed](/assets/pics/page/screenshot/conversionfailed.JPG){: .mx-auto.d-block :}
More info at [Pete's QBSSIC site](http://petesqbsite.com/phpBB3/viewtopic.php?t=7472) and [QB64 Files](https://www.qb64.org/wiki/FILES).

It is simple car game having "fun" steering system created in year 1994. Instead of controlling steering wheel and speed, 
player can accelerate in both x- and y-directions. I remember that I have played that with paper and pencil on squared paper, but instead of square in game pixels were used as metric. Rules was something like this:
- draw circuit and paly with friends
- player can:
- Accelerate 1 square/turn in x/y-direction
- Brake 2 squares/turn in x/y-direction
- Additional rules for collision with other player or wall


## Download 

https://www.qb64.org/portal/
unpack e.g. to C:\qb64\

![bas code in 45 binary format](/assets/pics/page/screenshot/qb64_45binarydetected.JPG){: .mx-auto.d-block :}


{: .box-warning}
**Warning:** Never download exe-files from untrusted pages!
So, if you know and trust me, go ahead. Files with .exe extension are mainly meant for myself. In year 2040 I still can easily install my own worm game to my laptop!

# Code

## Worm game for 2-4 players
Worm game, download converted exe file [here](https://www.dropbox.com/sh/ne7b81igchipyai/AACfGCtSlHBKO1rAzsL7hhh8a?dl=0).

![matis3 converted.bas](/assets/pics/page/screenshot/matis3_hidastus.JPG){: .mx-auto.d-block :}
Worm "matis3" game winner is player 1 having 1711 points. If I remember correctly, it means that the worm is 1711 pixels long.  
Note: for loop added 21.11.2020 to matis3 (converted).bas after "looppi:"-row. It makes worms slower.
~~~
FOR aaaa = 1 TO n



    aaahid = 0
    FOR hidas = 1 TO 20000
        aaahid = aaahid + 1
        PSET (3, 3), 16 - p
    NEXT hidas
NEXT aaaa
~~~


~~~
'*****************************************************************************
SCREEN 12
'*****************************************************************************
DIM ti, p, players, pe, pelit, n AS INTEGER
DIM y(1 TO 4) AS INTEGER
DIM x(1 TO 4) AS INTEGER
DIM vy(1 TO 4) AS INTEGER
DIM vx(1 TO 4) AS INTEGER
DIM ply(1 TO 4) AS INTEGER
CONST hidastus = 2000

'*****************************************************************************
ihanalku:
CLS
'*****************************************************************************
PRINT "The Matis III"
1 INPUT "Kuinka monta pelaajaa (2-4) "; players
IF players < 2 THEN GOTO 1
IF players > 4 THEN GOTO 1
2 INPUT "Nopeus eli hidastus (1-5) "; n
IF n < 1 THEN GOTO 2
IF n > 5 THEN GOTO 2
'*****************************************************************************
FOR p = 1 TO 4
    READ x(p), y(p), vx(p), vy(p)
    x(p) = INT(x(p) / n) * n
    y(p) = INT(y(p) / n) * n
    vx(p) = vx(p) * n
    vy(p) = vy(p) * n
    'PRINT x(p), y(p), vx(p), vy(p)
    ply(p) = 0
NEXT p


'*****************************************************************************
RESTORE
ti = 0
pe = 0
CLS
'*****************************************************************************
DATA 50,245,1,0,590,245,-1,0,320,420,0,-1,320,70,0,1
'*****************************************************************************
LINE (0, 20)-(639, 470), 7, B
'*****************************************************************************
looppi:
ti = ti + 1

FOR aaaa = 1 TO n



    aaahid = 0
    FOR hidas = 1 TO 20000
        aaahid = aaahid + 1
        PSET (3, 3), 16 - p
    NEXT hidas
NEXT aaaa


g$ = INKEY$
FOR p = 1 TO players
    IF ply(p) = 1 THEN GOTO etsku
    x(p) = x(p) + vx(p): y(p) = y(p) + vy(p)
    IF POINT(x(p), y(p)) <> 0 THEN GOTO dead
    PSET (x(p), y(p)), 16 - p
    etsku:
NEXT p
IF ply(1) = 1 THEN GOTO pl2
'*****************************************************************************
SELECT CASE g$
    CASE "s"
        IF vy(1) = -n THEN GOTO looppi
        vy(1) = n: vx(1) = 0
    CASE "w"
        IF vy(1) = n THEN GOTO looppi
        vy(1) = -n: vx(1) = 0
    CASE "a"
        IF vx(1) = n THEN GOTO looppi
        vx(1) = -n: vy(1) = 0
    CASE "d"
        IF vx(1) = -n THEN GOTO looppi
        vx(1) = n: vy(1) = 0
END SELECT
'*****************************************************************************
pl2:
IF ply(2) = 1 THEN GOTO pl3
'*****************************************************************************
SELECT CASE g$
    CASE "2"
        IF vy(2) = -n THEN GOTO looppi
        vy(2) = n: vx(2) = 0
    CASE "8"
        IF vy(2) = n THEN GOTO looppi
        vy(2) = -n: vx(2) = 0
    CASE "4"
        IF vx(2) = n THEN GOTO looppi
        vx(2) = -n: vy(2) = 0
    CASE "6"
        IF vx(2) = -n THEN GOTO looppi
        vx(2) = n: vy(2) = 0
    CASE CHR$(27)
        END
END SELECT
'*****************************************************************************
pl3:
IF players < 3 THEN GOTO looppi
IF ply(3) = 1 THEN GOTO pl4
'*****************************************************************************
SELECT CASE g$
    CASE "h"
        IF vy(3) = -n THEN GOTO looppi
        vy(3) = n: vx(3) = 0
    CASE "y"
        IF vy(3) = n THEN GOTO looppi
        vy(3) = -n: vx(3) = 0
    CASE "g"
        IF vx(3) = n THEN GOTO looppi
        vx(3) = -n: vy(3) = 0
    CASE "j"
        IF vx(3) = -n THEN GOTO looppi
        vx(3) = n: vy(3) = 0
END SELECT
'*****************************************************************************
pl4:
IF players < 4 THEN GOTO looppi
IF ply(4) = 1 THEN GOTO looppi
'*****************************************************************************
SELECT CASE g$
    CASE "„"
        IF vy(4) = -n THEN GOTO looppi
        vy(4) = n: vx(4) = 0
    CASE "†"
        IF vy(4) = n THEN GOTO looppi
        vy(4) = -n: vx(4) = 0
    CASE "”"
        IF vx(4) = n THEN GOTO looppi
        vx(4) = -n: vy(4) = 0
    CASE "'"
        IF vx(4) = -n THEN GOTO looppi
        vx(4) = n: vy(4) = 0
END SELECT
'*****************************************************************************
GOTO looppi
'*****************************************************************************
dead:
COLOR 16 - p
IF p = 1 THEN LOCATE 1: PRINT players - pe; " : "; ti * n
IF p = 2 THEN LOCATE 1, 22: PRINT players - pe; " : "; ti * n
IF p = 3 THEN LOCATE 1, 44: PRINT players - pe; " : "; ti * n
IF p = 4 THEN LOCATE 1, 66: PRINT players - pe; " : "; ti * n
ply(p) = 1
pe = pe + 1: IF pe = players THEN GOTO loppu
GOTO looppi
'*****************************************************************************
loppu:
DO
    g$ = INKEY$
LOOP UNTIL g$ = CHR$(13)
CLS
COLOR 15
INPUT "Haluatteko uuden pelin (k/e) "; uus$
IF UCASE$(uus$) = "E" THEN END
GOTO ihanalku
'*****************************************************************************
~~~


## TEXAHO21.bas
Texas Hold'em simulator. It seems that I had "creative coding" &#128169; skills already more than 19 years ago, see filename where results are saved and the extension based on my nick name. 
![TEXAHO21.bas](/assets/pics/page/screenshot/10pari_v1.JPG){: .mx-auto.d-block :}
![TEXAHO21v2.bas](/assets/pics/page/screenshot/10pari_v2.JPG){: .mx-auto.d-block :}

<!--  https://www.w3schools.com/charsets/ref_emoji.asp -->
Output: pair of tens, 6 players: 
~~~
"pelaajia",6
"peleja",180874
"pelaajien voitot"
" 1.pelaaja",53239
" 2.pelaaja",23969
" 3.pelaaja",23771
" 4.pelaaja",23940
" 5.pelaaja",23806
" 6.pelaaja",23849
"pelaajien tasapelit"
" 1.pelaaja",719.334
" 2.pelaaja",1534.167
" 3.pelaaja",1540.416
" 4.pelaaja",1519.083
" 5.pelaaja",1495.583
" 6.pelaaja",1491.416
"todennakoisyydet"
"hai",0
"pari",63349
"2 paria",71660
"3:set",21226
"suora",4146
"vari",3536
"tayskasi",15453
"neloset",1452
"varisuora",52
"todennakoisyydet kaikilla"
"hai",154918
"pari",459596
"2 paria",287438
"3:set",66240
"suora",42517
"vari",31023
"tayskasi",40026
"neloset",3165
"varisuora",321
"Voittajan kasi"
"hai",0
"pari",24098
"2 paria",48402
"3:set",31986
"suora",20783
"vari",16839
"tayskasi",27277
"neloset",2888
"varisuora",301
"Tasapelin tuottanut kasi"
"hai",0
"pari",756
"2 paria",1890
"3:set",418
"suora",4382
"vari",70
"tayskasi",775
"neloset",7
"varisuora",2
~~~
It seems that in case of even e.g. with 3 players, all these players get 0.3333 victory points.

![Texas Hold'em with 4 players in the beginning of 21st century](/assets/pics/page/photo/texasholdemX4.PNG){: .mx-auto.d-block :}


Code:
~~~
'*****************************************************************************
'* 13.10.2001
'*****************************************************************************
CLS
RANDOMIZE TIMER
CONST maxpelaajia = 10
DIM pelinpituus, peleja AS LONG
DIM pelaajia, einakyvyys, kelaus, kelauspituus, kelauskielto7 AS INTEGER

kadennimi$(1) = "hai"
kadennimi$(2) = "pari"
kadennimi$(3) = "2 paria"
kadennimi$(4) = "3:set"
kadennimi$(5) = "suora"
kadennimi$(6) = "vari"
kadennimi$(7) = "tayskasi"
kadennimi$(8) = "neloset"
kadennimi$(9) = "varisuora"

pelaajia = 6
pelinpituus = 2000
kelauspituus = 13
kelauskielto7 = 0

Hakemistopolku$ = "c:\ohjelm~1\qb\TexasH~1\data\"
tiedostonnimi$ = "paska"
tunnus$ = ".jaq"
'*****************************************************************************
DIM kortti(5 + maxpelaajia * 2) AS INTEGER
DIM valittukortti(11) AS INTEGER
DIM koko(5 + maxpelaajia * 2) AS INTEGER
DIM maa(5 + maxpelaajia * 2) AS INTEGER
DIM vari(3) AS INTEGER
DIM pari(2), parinkoko(2) AS INTEGER
DIM jarjestetty(maxpelaajia, 7) AS INTEGER
DIM kadenarvo(maxpelaajia)
DIM voitot(maxpelaajia) AS LONG
DIM tasapeli(maxpelaajia)

DIM apumuisti(5) AS INTEGER
'*****************************************************************************
DIM einakyvissa(8) AS INTEGER
DIM todennakoisyys(9) AS LONG
DIM todennakoisyyskaikilla(9)
DIM voittajankasi(9) AS LONG
DIM tasapelikasi(9) AS INTEGER
'*****************************************************************************
DIM kakkyra(13)
DIM kakkyravoitot(13) AS LONG
DIM kakkyratasapeli(13)
'*****************************************************************************
FOR a = 1 TO 8
    einakyvissa(a) = 0
NEXT a
FOR a = 1 TO 11
    valittukortti(a) = 0
NEXT a
einakyvyys = 3
'*****************************************************************************
kelaus = 0
'*****************************************************************************
alkukysely:
GOSUB taysnollaus
'*****************************************************************************
CLS
PRINT " Haquesin TEXAS HOLD'EM todenn„k”isyys chekkeri!"
PRINT " 19.8.2001               e-mail: haques@iobox.fi"
'PRINT
PRINT "Kortit (2-14 Pata) (15-27 Risti) (28-40 Ruutu) (41-53 Hertta)"
FOR a = 1 TO 11
    PRINT a; ": "; valittukortti(a);
    IF a = 5 THEN PRINT
    IF pelaajia = 2 AND a = 9 THEN a = 11
NEXT a
IF kelauskielto7 = 0 THEN PRINT "  7. kortti Kelautuu" ELSE PRINT "  7. kortti ei kelaudu"

PRINT "Seuraavat kortit ei tule "; einakyvyys; " :een ensimm„iseen"
FOR a = 1 TO 8
    PRINT a; ": "; einakyvissa(a);
NEXT a
PRINT
'PRINT
PRINT "0.. Aloita"
PRINT "1-5.. P”yt„korttien valinta"
PRINT "6-7.. Valitse pime„t kortit"
PRINT "9... tietty koko ei"; einakyvyys; ".n„kyv„„n korttiin"
PRINT "10.. tietty koko ei"; einakyvyys; ".n„kyv„„n korttiin (ei kelautuva)"
PRINT "11-14 .. kys. kortti ei tule"; einakyvyys; "  n„kyv„„n korttiin"
PRINT "15.. vaihda kiellon korttim„„r„„ 3/5"
PRINT "16.. kelaaminen 0/1:"; kelaus
PRINT "17.. kelauspituus 2-13:"; kelauspituus
PRINT "18.. 7:ka kortin kelaus 0/1:"; kelauskielto7
PRINT "20.. pelaajia:"; pelaajia
PRINT "21.. pelinpituus:";
IF kelaus = 1 THEN PRINT pelinpituus ELSE PRINT "-"
PRINT "30.. Tallennuksessa hakemistopolku: ";
PRINT Hakemistopolku$
PRINT "31.. Tallennuksessa tiedoston nimi: ";
PRINT tiedostonnimi$
PRINT "48-49 / 50-51.. Valitse pime„t kortit 2 / 3.pelaajalle"
PRINT "99.. Poistu"
INPUT a
IF a = 0 THEN GOTO alunalku
IF a > 0 AND a < 8 THEN
    PRINT a; "kortti maa (0-3)";
    INPUT b
    PRINT a; "kortti koko (2-14)";
    INPUT c
    valittukortti(a) = b * 13 + c
END IF
IF a >= 48 AND a <= 51 THEN
    PRINT a; "kortti maa (0-3)";
    INPUT b
    PRINT a; "kortti koko (2-14)";
    INPUT c
    valittukortti(a - 40) = b * 13 + c
END IF

IF a >= 9 AND a <= 14 THEN
    IF a > 10 THEN
        PRINT a; "kortti maa (0-3)";
        INPUT b
    END IF
    PRINT a; "kortti koko (2-14)";
    INPUT c
    IF a > 10 THEN
        einakyvissa(a - 10) = b * 13 + c
    ELSEIF a = 9 THEN
        einakyvissa(1) = c
        einakyvissa(2) = 13 + c
        einakyvissa(3) = 2 * 13 + c
        einakyvissa(4) = 3 * 13 + c
    ELSEIF a = 10 THEN
        einakyvissa(5) = c
        einakyvissa(6) = 13 + c
        einakyvissa(7) = 2 * 13 + c
        einakyvissa(8) = 3 * 13 + c
    END IF
END IF
IF a = 15 THEN IF einakyvyys = 3 THEN einakyvyys = 5 ELSE einakyvyys = 3
IF a = 16 THEN
    IF kelaus = 1 THEN
        kelaus = 0
        peleja = 0
    ELSE
        kelaus = 1
        'peleja = pelinpituus
    END IF
END IF
IF a = 17 THEN
    INPUT "kelauksia"; kelauspituus
    IF kelauspituus > 13 THEN kelauspituus = 13
    IF kelauspituus < 2 THEN kelauspituus = 2
END IF
IF a = 18 THEN
    IF kelauskielto7 = 1 THEN
        kelauskielto7 = 0
    ELSE
        kelauskielto7 = 1
    END IF
END IF


IF a = 20 THEN
    INPUT "pelaajia"; pelaajia
    IF pelaajia > maxpelaajia THEN pelaajia = maxpelaajia
    IF pelaajia < 2 THEN pelaajia = 2
END IF
IF a = 21 THEN
    INPUT "pelinpituus"; pelinpituus
    IF pelinpituus > 100000 THEN pelinpituus = 100000
    IF pelinpituus < 1 THEN pelinpituus = 1
    'IF kelaus = 1 THEN peleja = pelinpituus
END IF
IF a = 30 THEN
    INPUT "Hakemistopolku"; Hakemistopolku$
END IF
IF a = 31 THEN
    INPUT "Tiedostonnimi"; tiedostonnimi$
END IF
IF a = 99 THEN END


GOTO alkukysely
'*****************************************************************************
alunalku:
CLS
PRINT "t.. v„liaikatiedot"
PRINT "k.. korttitiedot"
PRINT "q.. lopetus ja tallennus"
PRINT "p.. paluu ja tallennus"
PRINT "ESC.. lopetus (ei tallennusta)"
'*****************************************************************************
alku:
'*****************************************************************************
IF peleja = pelinpituus AND kelaus <> 0 THEN GOSUB kelaaminen
'*****************************************************************************
peleja = peleja + 1
REM ******** kaden arvojen nollaus ************
FOR a = 1 TO pelaajia
    kadenarvo(a) = 0
NEXT a
REM *********** varien nollaus *********
FOR a = 0 TO 3
    vari(a) = 0
NEXT a
'*****************************************************************************
'                                   kortit
'*****************************************************************************
FOR a = 1 TO 5 + pelaajia * 2
    looppi:
    ok = 1
    IF a <= 11 THEN IF valittukortti(a) <> 0 THEN GOTO looppiohitus
    kortti(a) = INT(RND(1) * 52) + 2
                
    FOR c = 1 TO 11
        IF kortti(a) = valittukortti(c) THEN ok = 0
    NEXT c
    REM ******* estet„„n tietyn kortin tulo 3.ekaan
    IF a <= einakyvyys THEN
        FOR c = 1 TO 8
            IF einakyvissa(c) = kortti(a) THEN ok = 0
        NEXT c
    END IF
    IF a > 1 THEN
        FOR b = 1 TO a - 1
            IF kortti(a) = kortti(b) THEN
                ok = 0
                b = a - 1
            END IF
        NEXT b
    END IF
    looppiohitus:
    IF ok = 0 THEN GOTO looppi
NEXT a

FOR a = 1 TO 11
    IF valittukortti(a) <> 0 THEN kortti(a) = valittukortti(a)
NEXT a

'*****************************************************************************
'                     Korttien koko ja maa
'*****************************************************************************
FOR a = 1 TO 5 + pelaajia * 2
    koko(a) = kortti(a) MOD 13
    maa(a) = INT((kortti(a) - 2) / 13)
    IF koko(a) = 0 THEN koko(a) = 13
    IF koko(a) = 1 THEN koko(a) = 14
NEXT a
'************ j„rjestet„„n  2 korttii ************
FOR a = 6 TO 5 + pelaajia * 2 STEP 2
    IF koko(a) < koko(a + 1) THEN
        apu = kortti(a)
        kortti(a) = kortti(a + 1)
        kortti(a + 1) = apu
        apu = maa(a)
        maa(a) = maa(a + 1)
        maa(a + 1) = apu
        apu = koko(a)
        koko(a) = koko(a + 1)
        koko(a + 1) = apu
    END IF
NEXT a

'*****************************************************************************
'                       Onko mahdollisuutta v„riin?
'*****************************************************************************
varimahdollisuus = -1
FOR a = 1 TO 5
    vari(maa(a)) = vari(maa(a)) + 1
NEXT a
FOR a = 0 TO 3
    IF vari(a) >= 3 THEN varimahdollisuus = a
NEXT a
'PRINT "vari"; varimahdollisuus
'*****************************************************************************
IF varimahdollisuus <> -1 THEN
    FOR a = 6 TO 5 + pelaajia * 2 STEP 2

        IF (maa(a) = varimahdollisuus) AND (maa(a + 1) = varimahdollisuus) THEN kadenarvo((a - 4) / 2) = 2000
        IF ((maa(a) = varimahdollisuus) AND (vari(varimahdollisuus) = 4) OR (maa(a + 1) = varimahdollisuus) AND (vari(varimahdollisuus) = 4)) THEN kadenarvo((a - 4) / 2) = 2000
        IF (vari(varimahdollisuus) = 5) THEN kadenarvo((a - 4) / 2) = 2000
                      
        REM ********** isoin hai voittaa jos v„ri monella *****
        IF kadenarvo((a - 4) / 2) = 2000 THEN


            IF a = 6 THEN todennakoisyys(6) = todennakoisyys(6) + 1
            todennakoisyyskaikilla(6) = todennakoisyyskaikilla(6) + 1
            'IF koko(a) > koko(a + 1) THEN
            '        kadenarvo((a - 4) / 2) = kadenarvo((a - 4) / 2) + koko(a) + koko(a + 1) / 100
            'ELSE
            '        kadenarvo((a - 4) / 2) = kadenarvo((a - 4) / 2) + koko(a + 1) + koko(a) / 100
            'END IF
        END IF
    NEXT a
END IF
'*****************************************************************************
'                    Korttien j„rjest„minen koon mukaan
'*****************************************************************************
FOR d = 1 TO 5
    apumuisti(d - 1) = koko(d)
NEXT d
FOR b = 0 TO 3
    FOR c = b + 1 TO 4
        IF apumuisti(b) < apumuisti(c) THEN
            apu = apumuisti(b)
            apumuisti(b) = apumuisti(c)
            apumuisti(c) = apu
        END IF
    NEXT c
NEXT b
'FOR b = 0 TO 4
'        PRINT apumuisti(b);
'NEXT b

                      
FOR a = 1 TO pelaajia
    b = 0
    c = 4
    REM * MERGESORT *
    FOR d = 1 TO 7
        IF c < 6 THEN
            IF (apumuisti(b) < koko(c + a * 2)) OR (b > 4) THEN
                jarjestetty(a, d) = koko(c + a * 2)
                c = c + 1
            ELSE
                jarjestetty(a, d) = apumuisti(b)
                b = b + 1
            END IF
        ELSE
            jarjestetty(a, d) = apumuisti(b)
            b = b + 1
        END IF
    NEXT d

    'FOR d = 1 TO 5
    '        jarjestetty(a, d) = koko(d)
    'NEXT d
    'jarjestetty(a, 6) = koko(4 + a * 2)
    'jarjestetty(a, 7) = koko(5 + a * 2)
    REM **************** j„rjestys iso--> pieni ******
    'FOR b = 1 TO 6
    '        FOR c = b + 1 TO 7
    '                IF jarjestetty(a, b) < jarjestetty(a, c) THEN
    '                        apu = jarjestetty(a, b)
    '                        jarjestetty(a, b) = jarjestetty(a, c)
                               
    '                        jarjestetty(a, c) = apu
    '                END IF

    '        NEXT c
                

    'NEXT b
    samoja = 0
    FOR b = 0 TO 2
        pari(b) = 0
        parinkoko(b) = 0
    NEXT b
    '*****************************************************************************
    '                         Suoran chekkaus
    '*****************************************************************************
    suoraa = 0
    FOR b = 2 TO 7
        '***********************************
        '* Samojen kokojen zekkaus         *
        '***********************************
        IF jarjestetty(a, b - 1) = jarjestetty(a, b) THEN
            pari(samoja) = pari(samoja) + 1
            parinkoko(samoja) = jarjestetty(a, b)
        ELSEIF pari(samoja) <> 0 THEN samoja = samoja + 1
        END IF
        '*****************************************************************************
        IF (jarjestetty(a, b - 1) = jarjestetty(a, b) + 1) THEN
            suoraa = suoraa + 1
            IF (suoraa = 4) OR ((suoraa = 3) AND (jarjestetty(a, b) = 2) AND (jarjestetty(a, 1) = 14)) THEN
                REM ******** v„risuora
                IF kadenarvo(a) >= 2000 THEN
                    GOSUB varisuorachekki
                ELSE
                    IF a = 1 THEN todennakoisyys(5) = todennakoisyys(5) + 1
                    todennakoisyyskaikilla(5) = todennakoisyyskaikilla(5) + 1
                END IF
                IF kadenarvo(a) < 50000& THEN
                    ohitus = 2
                    REM ******** suora *   toimii!
                    kadenarvo(a) = kadenarvo(a) + 1500 + jarjestetty(a, b) + 4
                    IF suoraa = 3 THEN kadenarvo(a) = kadenarvo(a) - 1
                    suoraa = 0
                END IF
            END IF
        ELSEIF (jarjestetty(a, b - 1) <> jarjestetty(a, b)) THEN
            suoraa = 0
        END IF
    NEXT b
    '*****************************************************************************
    '            Jos ei suoraa eik„ v„ri„ katsotaan onko jotain muuta
    '*****************************************************************************
    IF kadenarvo(a) = 0 THEN
        ohitus = 0
        '*****************************************************************************
        '                       * Hai *      seuraavat hait 20-j„rjestelm„ss„
        '*****************************************************************************
        IF (pari(0) = 0) THEN
            juoksevahaijako = 1
            FOR b = 1 TO 5
                kadenarvo(a) = kadenarvo(a) + jarjestetty(a, b) * juoksevahaijako
                juoksevahaijako = juoksevahaijako / 20
            NEXT b
            IF a = 1 THEN todennakoisyys(1) = todennakoisyys(1) + 1
            todennakoisyyskaikilla(1) = todennakoisyyskaikilla(1) + 1
            ohitus = 1
        END IF
        IF ohitus = 1 THEN GOTO ohitus
        '*****************************************************************************
        '                            * Pari *
        '*****************************************************************************
        IF (pari(0) = 1) AND (pari(1) = 0) THEN
            kadenarvo(a) = parinkoko(0) * 10
            juoksevahaijako = 10
            FOR b = 1 TO 5
                IF jarjestetty(a, b) <> parinkoko(0) THEN
                    kadenarvo(a) = kadenarvo(a) + jarjestetty(a, b) / juoksevahaijako
                    juoksevahaijako = juoksevahaijako * 100
                                   
                END IF
            NEXT b
            IF a = 1 THEN todennakoisyys(2) = todennakoisyys(2) + 1
            todennakoisyyskaikilla(2) = todennakoisyyskaikilla(2) + 1
            ohitus = 1
        END IF
        IF ohitus = 1 THEN GOTO ohitus
        '*****************************************************************************
        '                          * kolmoset *
        '*****************************************************************************
        IF (pari(0) = 2) AND (pari(1) = 0) THEN
            kadenarvo(a) = parinkoko(0) * 10 + 1000
            juoksevahaijako = 10
            FOR b = 1 TO 5
                IF jarjestetty(a, b) <> parinkoko(0) THEN
                    kadenarvo(a) = kadenarvo(a) + jarjestetty(a, b) / juoksevahaijako
                    juoksevahaijako = juoksevahaijako * 100
                                  
                END IF
            NEXT b
                       
            IF a = 1 THEN todennakoisyys(4) = todennakoisyys(4) + 1
            todennakoisyyskaikilla(4) = todennakoisyyskaikilla(4) + 1
            ohitus = 1
        END IF
        IF ohitus = 1 THEN GOTO ohitus
        '*****************************************************************************
        '                               * neloset *
        '*****************************************************************************
        IF (pari(0) = 3) OR (pari(1) = 3) THEN
            kadenarvo(a) = parinkoko(0) * 100
            IF jarjestetty(a, 1) = parinkoko(0) THEN
                kadenarvo(a) = kadenarvo(a) + 10000 + jarjestetty(a, 5)
            ELSE
                kadenarvo(a) = kadenarvo(a) + 10000 + jarjestetty(a, 1)
            END IF
            IF a = 1 THEN todennakoisyys(8) = todennakoisyys(8) + 1
            todennakoisyyskaikilla(8) = todennakoisyyskaikilla(8) + 1
            ohitus = 1
        END IF
        IF ohitus = 1 THEN GOTO ohitus
        '*****************************************************************************
        '                              * T„ysk„si *
        '*****************************************************************************
        IF ((pari(0) = 2) AND (pari(1) = 1)) OR ((pari(0) = 1) AND (pari(1) = 2)) OR (pari(2) = 2) OR ((pari(0) = 2) AND (pari(1) = 2)) THEN
            IF a = 1 THEN todennakoisyys(7) = todennakoisyys(7) + 1
            todennakoisyyskaikilla(7) = todennakoisyyskaikilla(7) + 1

            IF pari(0) = 2 THEN kadenarvo(a) = 5000 + parinkoko(0) * 100 + parinkoko(1)
            IF pari(0) = 1 AND pari(1) = 2 THEN kadenarvo(a) = 5000 + parinkoko(0) + parinkoko(1) * 100
            IF pari(2) = 2 THEN kadenarvo(a) = 5000 + parinkoko(0) + parinkoko(2) * 100
                       
            ohitus = 1
        END IF
        IF ohitus = 1 THEN GOTO ohitus
        '*****************************************************************************
        '                             * Kaksi paria *
        '*****************************************************************************
        IF (pari(0) = 1) AND (pari(1) = 1) AND (pari(2) <> 2) THEN
            kadenarvo(a) = 150
            IF a = 1 THEN todennakoisyys(3) = todennakoisyys(3) + 1
            todennakoisyyskaikilla(3) = todennakoisyyskaikilla(3) + 1
            kadenarvo(a) = kadenarvo(a) + parinkoko(0) * 10 + parinkoko(1) / 10
            FOR b = 1 TO 5
                IF jarjestetty(a, b) <> parinkoko(0) AND jarjestetty(a, b) <> parinkoko(1) THEN
                    kadenarvo(a) = kadenarvo(a) + jarjestetty(a, b) / 1000
                    b = 5
                END IF
            NEXT b
        END IF
        ohitus:
    END IF
    IF kadenarvo(a) = 2000 THEN
        'PRINT "v„ri"
        GOSUB isoinanumeroinakortitjarjestykseen
        REM   eka hai 50-j„rjestelm„ss„
        juoksevahaijako = 50
        FOR b = 1 TO 5
            'PRINT jarjestetty(a, b);
            jarjestetty(a, b) = jarjestetty(a, b) MOD 13
            'PRINT jarjestetty(a, b);
            IF jarjestetty(a, b) = 0 THEN jarjestetty(a, b) = 13
            IF jarjestetty(a, b) = 1 THEN jarjestetty(a, b) = 14
            'PRINT jarjestetty(a, b)
        NEXT b
        'PRINT
        'PRINT kadenarvo(a);
        REM  seuraavat hait 15-j„rjestelm„ss„
        FOR b = 1 TO 5
            kadenarvo(a) = kadenarvo(a) + jarjestetty(a, b) * juoksevahaijako
            'PRINT kadenarvo(a);
            juoksevahaijako = juoksevahaijako / 15
        NEXT b
        'PRINT kadenarvo(a);
        'FOR b = 1 TO 5
        '      PRINT jarjestetty(a, b);
        'NEXT b
        'PRINT
    END IF
NEXT a
'*****************************************************************************
'FOR a = 1 TO pelaajia
'        FOR b = 1 TO 7
'        PRINT jarjestetty(a, b);
'        NEXT b
'        PRINT
'NEXT a
'PRINT
'*****************************************************************************
'                   Tarkistetaan voittaja (suurin k„denarvo)
'*****************************************************************************
voittaja = 0
maks = 0
FOR a = 1 TO pelaajia
    '        PRINT kadenarvo(a);
    IF kadenarvo(a) > maks THEN
        voittaja = a
        maks = kadenarvo(a)
    ELSEIF kadenarvo(a) = maks THEN voittaja = -1
    END IF
NEXT a
'*****************************************************************************
'                   Voittaja=-1, jos tasapelej„
'*****************************************************************************
IF voittaja = -1 THEN
    tasapeleja = 0
    FOR a = 1 TO pelaajia
        IF kadenarvo(a) = maks THEN tasapeleja = tasapeleja + 1
    NEXT a
    tasapeleja = 1 / tasapeleja
    FOR a = 1 TO pelaajia
        IF kadenarvo(a) = maks THEN tasapeli(a) = tasapeli(a) + tasapeleja
    NEXT a
    IF maks > 50000& THEN
        tasapelikasi(9) = tasapelikasi(9) + 1
    ELSEIF maks > 10000 THEN
        tasapelikasi(8) = tasapelikasi(8) + 1
    ELSEIF maks > 5000 THEN
        tasapelikasi(7) = tasapelikasi(7) + 1
    ELSEIF maks >= 2000 THEN
        tasapelikasi(6) = tasapelikasi(6) + 1
        'FOR b = 1 TO 5
        '        PRINT maa(b);
        'NEXT b
        'PRINT
    ELSEIF maks > 1500 THEN
        tasapelikasi(5) = tasapelikasi(5) + 1
    ELSEIF maks > 1000 THEN
        tasapelikasi(4) = tasapelikasi(4) + 1
    ELSEIF maks > 150 THEN
        tasapelikasi(3) = tasapelikasi(3) + 1
    ELSEIF maks > 15 THEN
        tasapelikasi(2) = tasapelikasi(2) + 1
    ELSEIF maks > 0 THEN
        tasapelikasi(1) = tasapelikasi(1) + 1
    END IF
ELSE
    voitot(voittaja) = voitot(voittaja) + 1
    IF kadenarvo(voittaja) > 50000& THEN
        voittajankasi(9) = voittajankasi(9) + 1
    ELSEIF kadenarvo(voittaja) > 10000 THEN
        voittajankasi(8) = voittajankasi(8) + 1
    ELSEIF kadenarvo(voittaja) > 5000 THEN
        voittajankasi(7) = voittajankasi(7) + 1
    ELSEIF kadenarvo(voittaja) >= 2000 THEN
        voittajankasi(6) = voittajankasi(6) + 1
    ELSEIF kadenarvo(voittaja) > 1500 THEN
        voittajankasi(5) = voittajankasi(5) + 1
    ELSEIF kadenarvo(voittaja) > 1000 THEN
        voittajankasi(4) = voittajankasi(4) + 1
    ELSEIF kadenarvo(voittaja) > 150 THEN
        voittajankasi(3) = voittajankasi(3) + 1
    ELSEIF kadenarvo(voittaja) > 15 THEN
        voittajankasi(2) = voittajankasi(2) + 1
    ELSEIF kadenarvo(voittaja) > 0 THEN
        voittajankasi(1) = voittajankasi(1) + 1
    END IF
END IF
'*****************************************************************************
g$ = INKEY$
IF g$ = "q" THEN
    GOSUB tuloksia
    GOTO quitti
END IF
IF g$ = "t" THEN GOSUB tuloksia
IF g$ = "k" THEN GOSUB tarkattiedotkorteista
IF g$ = "p" THEN
    GOSUB tuloksia
    GOTO quitti
    PRINT "taa ei oo viel valmis"
END IF
IF g$ = CHR$(27) THEN END
GOTO alku
'*****************************************************************************
tarkattiedotkorteista:
CLS
FOR a = 1 TO 5
    PRINT "kortti nro:"; kortti(a); "Koko:"; koko(a); "Maa:"; maa(a)
NEXT a
PRINT
FOR a = 6 TO 5 + pelaajia * 2 STEP 2
    PRINT (a - 4) / 2; " pelaajan kortit (nro):"; kortti(a); kortti(a + 1); "Koko:"; koko(a); koko(a + 1); "Maa:"; maa(a); maa(a + 1); "Arvo:"; kadenarvo((a - 4) / 2)
NEXT a
PRINT
IF voittaja <> -1 THEN PRINT "Voittaja:"; voittaja; ".pelaaja" ELSE PRINT "tasapeli"
RETURN
'*****************************************************************************
tuloksia:
CLS
'PRINT
'apu = 0
FOR b = 1 TO pelaajia
    'apu = apu + voitot(b)
    prossa = INT((voitot(b) + tasapeli(b)) / peleja * 10000) / 100
    PRINT b; "voitot:"; voitot(b); "tasapelit:"; tasapeli(b); "tod:"; prossa; "%"
NEXT b
PRINT

PRINT "1.pelaajan k„det: (hai,pari,2paria,3:Set,suora,v„ri,t„ky,neloset,v„risuora)"
FOR b = 1 TO 9
    'apu2 = apu2 + todennakoisyys(b)
    PRINT todennakoisyys(b);
NEXT b
PRINT
'apu2 = 0
PRINT "Kaikkien k„det"
FOR b = 1 TO 9
    'apu2 = apu2 + todennakoisyyskaikilla(b)
    PRINT todennakoisyyskaikilla(b);
NEXT b
'PRINT
'PRINT apu2
PRINT
PRINT "Voittajan k„si"
FOR b = 1 TO 9
    PRINT voittajankasi(b);
NEXT b

PRINT
PRINT "Todenn„k”isyys voittaa k„dell„"
FOR b = 1 TO 9
    IF todennakoisyyskaikilla(b) > 0 THEN
        PRINT INT(voittajankasi(b) / todennakoisyyskaikilla(b) * 10000) / 100;
    ELSE
        PRINT " - ";
    END IF
NEXT b

PRINT
PRINT "Tasapelik„si: ";
FOR b = 1 TO 9
    PRINT tasapelikasi(b);
NEXT b

PRINT
PRINT "Pelej„:"; peleja
PRINT "1.pelaajan kortit:";
PRINT valittukortti(6); valittukortti(7)
PRINT "Ei tule n„kyviin kortteihin:";
FOR b = 1 TO 8
    PRINT einakyvissa(b);
NEXT b
RETURN
'*****************VŽRISUORANZEKKAUS
isoinanumeroinakortitjarjestykseen:
FOR ddd = 1 TO 5
    IF INT((kortti(ddd) - 2) / 13) <> varimahdollisuus THEN
        jarjestetty(a, ddd) = -3
    ELSE
        jarjestetty(a, ddd) = kortti(ddd)
    END IF
NEXT ddd
IF INT((kortti(4 + a * 2) - 2) / 13) <> varimahdollisuus THEN
    jarjestetty(a, 6) = -3
ELSE
    jarjestetty(a, 6) = kortti(4 + a * 2)
END IF
IF INT((kortti(5 + a * 2) - 2) / 13) <> varimahdollisuus THEN
    jarjestetty(a, 7) = -3
ELSE
    jarjestetty(a, 7) = kortti(5 + a * 2)
END IF

REM **************** j„rjestys iso--> pieni ******
FOR bbb = 1 TO 6
    FOR ccc = bbb + 1 TO 7
        IF jarjestetty(a, bbb) < jarjestetty(a, ccc) THEN
            apu = jarjestetty(a, bbb)
            jarjestetty(a, bbb) = jarjestetty(a, ccc)
                             
            jarjestetty(a, ccc) = apu
        END IF

    NEXT ccc
NEXT bbb
RETURN
'*****************************************************************************
varisuorachekki:
GOSUB isoinanumeroinakortitjarjestykseen
       
FOR bbb = 1 TO 3
    IF (jarjestetty(a, bbb + 1) - 3 = jarjestetty(a, bbb + 4)) THEN
        'PRINT "4.suora"
        vvv = 0
        IF jarjestetty(a, 1) MOD 13 = 1 AND jarjestetty(a, bbb + 4) MOD 13 = 2 THEN
            vvv = 1
            kadenarvo(a) = 50000& + jarjestetty(a, bbb + 1) * 100
        END IF
                      
        IF (jarjestetty(a, bbb) - 4 = jarjestetty(a, bbb + 4)) THEN
            vvv = 1
            kadenarvo(a) = 50000& + jarjestetty(a, bbb) * 100
        END IF
        IF vvv = 1 THEN
            'kadenarvo(a) = 50000 + jarjestetty(a, bbb) * 100
            'IF koko(4 + a * 2) > koko(5 + a * 2) THEN
            '        kadenarvo(a) = kadenarvo(a) + koko(4 + a * 2) + koko(5 + a * 2) / 100
            'ELSE
            '        kadenarvo(a) = kadenarvo(a) + koko(5 + a * 2) + koko(4 + a * 2) / 100
            'END IF
                               
                               
            'PRINT "v„risuora"; kadenarvo(a)
            'FOR sd = 1 TO 100000
            'NEXT sd
            IF a = 1 THEN todennakoisyys(6) = todennakoisyys(6) - 1
            IF a = 1 THEN todennakoisyys(9) = todennakoisyys(9) + 1
            todennakoisyyskaikilla(6) = todennakoisyyskaikilla(6) - 1
            todennakoisyyskaikilla(9) = todennakoisyyskaikilla(9) + 1
            bbb = 3
            'PRINT kadenarvo(a)
        END IF

    END IF

NEXT bbb
'IF (kadenarvo(a) < 50000) AND a = 1 THEN
'PRINT
'                PRINT "e"; kadenarvo(a)
'        FOR bbb = 1 TO 7
'                PRINT jarjestetty(a, bbb);
             
'        NEXT bbb
'        PRINT
'        FOR bbb = 1 TO 7
'                PRINT jarjestetty(a, bbb) MOD 13;
             
'        NEXT bbb

'        GOSUB korttienarvot
'END IF
RETURN
korttienarvot:

FOR aaa = 1 TO 5 + pelaajia * 2
    PRINT kortti(aaa); koko(aaa); maa(aaa)
    IF aaa = 5 THEN PRINT
NEXT aaa
'FOR aaa = 1 TO 3000000
'NEXT aaa
PRINT
RETURN
taysnollaus:
FOR a = 1 TO pelaajia
    voitot(a) = 0
    tasapeli(a) = 0
NEXT a
FOR a = 1 TO 9
    todennakoisyys(a) = 0
    voittajankasi(a) = 0
    todennakoisyyskaikilla(a) = 0
NEXT a
peleja = 0
RETURN
'*****************************************************************************
kelaaminen:
'GOSUB tuloksia
kakkyra(kelaus) = INT(voitot(1) / peleja * 10000) / 100 + INT(tasapeli(1) / peleja * 10000) / 100
kakkyravoitot(kelaus) = voitot(1)
kakkyratasapeli(kelaus) = tasapeli(1)
       
IF valittukortti(6) <> 0 THEN valittukortti(6) = valittukortti(6) + 1
IF (valittukortti(7) <> 0) AND (kelauskielto7 = 0) THEN valittukortti(7) = valittukortti(7) + 1
'valittukortti(6) = 13
'valittukortti(7) = kelaus + 13
'valittukortti(1) = kelaus + 26
FOR c = 1 TO 4
    'einakyvissa(c) = kelaus + 13 * (c - 1)
    IF einakyvissa(c) <> 0 THEN einakyvissa(c) = einakyvissa(c) + 1
NEXT c
GOSUB tuloksia
 
GOSUB taysnollaus
IF kelaus = kelauspituus THEN
    SCREEN 12
               
    FOR aa = 0 TO 10
        LINE (30, 400 - aa * 40)-(kelauspituus * 30, 400 - aa * 40), 1
    NEXT aa
    LINE (30, 400 - 400 / pelaajia)-(kelauspituus * 30, 400 - 400 / pelaajia), 2
    FOR aa = 1 TO kelauspituus
        LINE (aa * 30, 0)-(aa * 30, 400), 1
    NEXT aa


    FOR aa = 2 TO kelauspituus
        LINE ((aa - 1) * 30, 400 - kakkyra(aa - 1) * 4)-(aa * 30, 400 - kakkyra(aa) * 4), 15
    NEXT aa
               
    'FOR aa = 2 TO 9
    '        LINE ((aa - 1) * 30, 400 - todennakoisyys(aa - 1) * 4 / pelinpituus / 14 * 100)-(aa * 30, 400 - todennakoisyys(aa) * 4 / pelinpituus / 14 * 100), 12
    'NEXT aa
    GOTO quitti
    'END
END IF
kelaus = kelaus + 1
        
'PRINT "1.pelaajan kortit:";
'PRINT valittukortti(6); valittukortti(7)
'PRINT "Ei tule n„kyviin kortteihin:";
'PRINT einakyvissa(1); einakyvissa(2); einakyvissa(3); einakyvissa(4);einakyvissa(5); einakyvissa(6); einakyvissa(7); einakyvissa(8)

RETURN

quitti:
OPEN Hakemistopolku$ + tiedostonnimi$ + tunnus$ FOR OUTPUT AS #1
WRITE #1, "pelaajia", pelaajia
'WRITE #1, pelaajia


IF kelaus <> 0 THEN
    WRITE #1, "pelinpituus", pelinpituus
    WRITE #1, "sarjan voitot"
    FOR a = 1 TO kelauspituus
        WRITE #1, kakkyravoitot(a)
    NEXT a
    WRITE #1, "sarjan tasapelit"
    FOR a = 1 TO kelauspituus
        WRITE #1, kakkyratasapeli(a)
    NEXT a
ELSE
    WRITE #1, "peleja", peleja
    WRITE #1, "pelaajien voitot"
    FOR a = 1 TO pelaajia
        WRITE #1, STR$(a) + ".pelaaja", voitot(a)
    NEXT a
    WRITE #1, "pelaajien tasapelit"
    FOR a = 1 TO pelaajia
        WRITE #1, STR$(a) + ".pelaaja", tasapeli(a)
    NEXT a


END IF

WRITE #1, "todennakoisyydet"
FOR a = 1 TO 9
    WRITE #1, kadennimi$(a), todennakoisyys(a)
NEXT a

WRITE #1, "todennakoisyydet kaikilla"
FOR a = 1 TO 9
    WRITE #1, kadennimi$(a), todennakoisyyskaikilla(a)
NEXT a

WRITE #1, "Voittajan kasi"
FOR a = 1 TO 9
    WRITE #1, kadennimi$(a), voittajankasi(a)
NEXT a

WRITE #1, "Tasapelin tuottanut kasi"
FOR a = 1 TO 9
    WRITE #1, kadennimi$(a), tasapelikasi(a)
NEXT a


CLOSE 1

IF g$ = "p" THEN GOTO alkukysely
END
~~~

## turpa200.bas
Car game, download converted exe file [here](https://www.dropbox.com/sh/ne7b81igchipyai/AACfGCtSlHBKO1rAzsL7hhh8a?dl=0).

> TEKIJA.TXT
~~~
*******************
TURPO AUTO II  v1.0
*******************
BY:  Jaakko Talonen
29. Kes„kuuta. 1994
*******************
****** Ohje: ******
8............ Kaasu
2............ Jarru
4............ Vasen
6............ Oikea
*******************
~~~

and some additional data files, not sure what was on my mind back then:

> CARS.TXT
~~~
On foot, 30, .4, 0, .8, 15, 2, 2
Full-size sedan, 176, .4, 0, 1.2, 12, 16, 6 
Compact sedan, 160, .4, 10, 1.6, 12, 12, 5
Sports car, 240, .72, 30, 2, 12, 15, 6
Limousine, 184, .32, -20, 1, 7, 19, 7          
Police car, 192, .48, 10, 1.6, 11, 16, 6
Pickup truck, 144, .4, -10, .8, 14, 16, 7
4-WD truck, 144, .32, -20, .8, 14,16,7         
Bicycle, 56, .16, 20, .4, 14, 7, 1
Motorcycle, 176, .64, 20, 2, 14, 9,3           
Dirt bike, 128, .56, 30, 1.2, 14, 8, 2
Police cycle, 192, .48, 10, .2, 14, 9, 3
Delivery truck, 128, .32, -30, .4, 14, 19, 7
Dump truck, 112, .24, -40, .4, 10, 21, 8
Motor home, 144, .24, -40, .6, 15, 19, 7
Semi truck, 176, .24, -50, .4, 15, 41, 8
Van, 184, .4, -20, .6, 15,17,7                 
Bulldozer, 48, .08, 35, .4, 14 ,20,10          
Tank, 72, .16, 40, .8, 6,21,10                 
~~~

> MAP.TXT
~~~
1,2 ,1 ,5 ,9 ,5 ,9 ,5 ,9 ,2 ,1 ,5 ,9 ,5 ,2 ,11
0,3 ,10,6 ,9 ,10,9 ,10,9 ,8 ,0 ,0 ,11,0 ,3 ,2
0,11,0 ,11,11,0 ,11,0 ,11,0 ,0 ,0 ,11,0 ,11,0
0,1 ,10,9 ,9 ,10,9 ,8 ,11,7 ,8 ,7 ,5 ,10,9 ,8
7,4 ,3 ,5 ,9 ,10,9 ,10,9 ,8 ,7 ,6 ,10,8 ,11,0
0,11,11,0 ,11,0 ,11,0 ,11,0 ,0 ,1 ,6 ,6 ,9 ,8
7,9 ,9 ,10,9, 10,9 ,10,9 ,10,6 ,6 ,9 ,5 ,9 ,8
0,11,11,0 ,11,3 ,9 ,10,9 ,8 ,1 ,5 ,9 ,8 ,11,0
0,11,11,0 ,11,11,11,0 ,11,0 ,0 ,0 ,11,0 ,11,0
0,11,11,3 ,9 ,2 ,1 ,4 ,11,7 ,6 ,4 ,11,0 ,11,0
0,11,11,1 ,9 ,6 ,6 ,5 ,5 ,4 ,11,1 ,5 ,6 ,5 ,8
3,2 ,11,0 ,11,1 ,9 ,8 ,3 ,9 ,5 ,10,10,5 ,4 ,0
1,4 ,11,7 ,9 ,6 ,9 ,8 ,11,11,0 ,7 ,8 ,3 ,9 ,8
0,11,11,7 ,9 ,9 ,5 ,10,5 ,9 ,10,8 ,7 ,5 ,9 ,8
7,9 ,9 ,8 ,11,11,7 ,6 ,8 ,11,7 ,10,4 ,3 ,9 ,8
0,11,11,7 ,9 ,9 ,10,9 ,10,9 ,4 ,0 ,11,1 ,2 ,0
7,9 ,9 ,10,9 ,9 ,8 ,11,0 ,11,1 ,6 ,2 ,0 ,0 ,0
3,9 ,9 ,6 ,9 ,9 ,6 ,9 ,6 ,9 ,4 ,11,3 ,6 ,6 ,4
~~~

![TURPAUT1.bas](/assets/pics/page/screenshot/TURPAUT1.JPG){: .mx-auto.d-block :}
![turpa200.bas](/assets/pics/page/screenshot/turpa200.JPG){: .mx-auto.d-block :}
~~~
'*****************************************************************************
SCREEN 13


DIM tim AS INTEGER
CONST kierrosmaara = 3
DIM ti(kierrosmaara)
'*****************************************************************************
CONST aste = 22.5 * 3.141592653589793# / 180
CONST aste2 = aste * 4
CONST a = .02
CONST rv = 12
CONST av = 14
CONST pit = 10
CONST lev = 5
CONST koko = 400
CONST ko = 70
'*****************************************************************************
'OPEN "c:\qb\turpokar\tekija.txt" FOR INPUT AS #1
'FOR p = 1 TO 12
'        INPUT #1, w$
'        COLOR 32 + p
'        PRINT w$
'NEXT p

GOSUB paina
'*****************************************************************************
CLS
'*****************************************************************************
x = koko / 2 - 160 - pit - 1
y = ko / 2 - 100

alfa = aste * 12
'*****************************************************************************
kaantaja:
vx = v * SIN(alfa)
vy = v * COS(alfa)
vkx = pit * SIN(alfa)
vky = pit * COS(alfa)
apualfa = alfa + aste2
vsx = lev * SIN(apualfa)
vsy = lev * COS(apualfa)
'*****************************************************************************
liike:
tim = tim + 1
x = x + vx
y = y + vy
'*****************************************************************************
LINE (0, 0)-(319, 199), 15, B
'*****************************************************************************
LINE (0 - x1, 0 - y1)-(koko - x1, koko - y1), 0, B
LINE (ko - x1, ko - y1)-(koko - ko - x1, koko - ko - y1), 0, B
LINE (koko / 2 - x1, 0 - y1)-(koko / 2 - x1, ko - y1), 0
'*****************************************************************************
LINE (0 - x, 0 - y)-(koko - x, koko - y), rv, B
LINE (ko - x, ko - y)-(koko - ko - x, koko - ko - y), rv, B
LINE (koko / 2 - x, 0 - y)-(koko / 2 - x, ko - y), 15
'*****************************************************************************
x1 = x
y1 = y
'*****************************************************************************
LINE (sxt, syt)-(sx, sy), 0
LINE (sxa, sya)-(sxat, syat), 0
LINE (sxa, sya)-(sx, sy), 0
LINE (sxt, syt)-(sxat, syat), 0
'*****************************************************************************
sx = 160 + vkx + vsx
sy = 100 + vky + vsy
sxt = 160 + vkx - vsx
syt = 100 + vky - vsy
sxa = 160 - vkx + vsx
sya = 100 - vky + vsy
sxat = 160 - vkx - vsx
syat = 100 - vky - vsy
'*****************************************************************************
IF koko - x - 160 < 0 THEN GOTO crash
IF x + 160 < 0 THEN GOTO crash
IF y + 100 < 0 THEN GOTO crash
IF koko - y - 100 < 0 THEN GOTO crash
IF x > ko - 160 AND x < koko - ko - 160 AND y > ko - 100 AND y < koko - ko - 100 THEN GOTO crash
'*****************************************************************************
IF x > koko / 2 - 160 AND x < koko / 2 - 100 AND y > koko - ko - 100 AND kayty = 0 THEN kayty = 1
IF x > koko / 2 - 160 AND x < koko / 2 - 100 AND y < ko - 100 AND kayty = 1 THEN
    kayty = 0
    kierros = kierros + 1
    ti(kierros) = tim
    tim = 0
    IF kierros = kierrosmaara THEN BEEP: GOTO maaliin
END IF
'*****************************************************************************
LINE (sxt, syt)-(sx, sy), av
LINE (sxa, sya)-(sxat, syat), av
LINE (sxa, sya)-(sx, sy), av
LINE (sxt, syt)-(sxat, syat), av
FOR aaa = 1 TO 1000
NEXT aaa


'*****************************************************************************
li$ = INKEY$
IF li$ = "" THEN GOTO liike
SELECT CASE li$
    CASE "8"
        v = v - a
        GOTO kaantaja
    CASE "2"
        v = v + a
        GOTO kaantaja
    CASE "6"
        alfa = alfa - aste
        GOTO kaantaja
    CASE "4"
        alfa = alfa + aste
        GOTO kaantaja
    CASE CHR$(27)
        END
END SELECT
GOTO liike
'*****************************************************************************
crash:
SOUND 240, 240 / 50
x = x - vx * 2
y = y - vy * 2
v = 0
GOTO kaantaja
'*****************************************************************************
maaliin:
CLS
COLOR 44
PRINT " Kierros", " Aika"
FOR p = 1 TO kierrosmaara
    COLOR 44 + p
    PRINT p, ti(p)
    yht = yht + ti(p)
NEXT p
COLOR 45 + p
PRINT "Kokonaisaika oli:"; yht
PRINT
GOSUB paina
END
'*****************************************************************************
paina:
PRINT "*  Paina ENTERIŽ  *"
PRINT "*******************"
DO
    g$ = INKEY$
LOOP UNTIL g$ = CHR$(13)
RETURN
'*****************************************************************************
'*****************************************************************************
~~~

## Royal Casino
Play BlackJack up to 4 hands, download converted exe file [here](https://www.dropbox.com/sh/ne7b81igchipyai/AACfGCtSlHBKO1rAzsL7hhh8a?dl=0).
![royalcasino.bas](/assets/pics/page/screenshot/royalcasino.JPG){: .mx-auto.d-block :}


~~~
SCREEN 12
RANDOMIZE TIMER
DIM k(6)
DIM c(6)
DIM loptulos(3)
DIM blackjack(3)
DIM win(3)
DIM panos(3)
DIM tupla(3)
DIM insuu(3)

money = 40


alku:
apukasi = 0
b = 0
tulos = 0
assa = 0
leeveen = 0

CLS
LOCATE 1, 33: PRINT "ROYAL CASINO"
LOCATE 2, 58: PRINT "BLACK JACK"
LINE (0, 0)-(605, 455), , B
LINE (382, 14)-(382, 455)
LINE (0, 14)-(605, 14)
LINE (382, 228)-(605, 228)
LINE (382, 300)-(605, 300)
LINE (382, 323)-(605, 323)
LINE (510, 228)-(510, 300)
LOCATE 18, 52: PRINT "Money: "; money
LOCATE 16, 52: PRINT "Bet:   "
LOCATE 16, 66: PRINT "Insurance"

1 LOCATE 20, 51: INPUT "How many hands (1-4)"; kasia
IF kasia < 1 OR kasia > 4 THEN GOTO 1
IF kasia > money THEN GOTO 1
kasia = kasia - 1
LINE (383, 301)-(604, 322), 0, BF

LOCATE 4, 62: PRINT "Dealer ..."
FOR hand = 0 TO kasia
    LOCATE 5 + hand, 62: PRINT "Hand"; hand + 1; "..."
    tupla(hand) = 0
    insuu(hand) = 0
NEXT hand
cblackjack = 0

FOR bb = 0 TO kasia
    LOCATE 20, 51: PRINT "What is your bet"; bb + 1; " (1-9)"
    2 LOCATE 28, 11 * bb + 6: INPUT betti
    IF betti < 1 OR betti > 9 THEN LOCATE 28, 11 * bb + 6: PRINT "     ": GOTO 2
    IF money - kasia + bb < betti THEN LOCATE 28, 11 * bb + 6: PRINT "     ": GOTO 2
    panos(bb) = betti
    LOCATE 28, 11 * bb + 6: PRINT " "
    allbet = allbet + panos(bb)
    money = money - panos(bb)
    LOCATE 16, 52: PRINT "Bet:   "; allbet
    LOCATE 18, 52: PRINT "Money: "; money
NEXT bb

LINE (383, 301)-(604, 322), 0, BF
LOCATE 7 + kasia, 52: PRINT "H........ Hit me"
LOCATE 8 + kasia, 52: PRINT "S........ Stay"
LOCATE 9 + kasia, 52: PRINT "D........ Double down"
LOCATE 10 + kasia, 52: PRINT "B........ Split bets"
LOCATE 11 + kasia, 52: PRINT "I........ Insurance"

aikaalku:
assa = 0
tulos = 0

FOR a = 1 TO 6
    k(a) = INT(RND(1) * 13) + 1
    IF apukasi = 0 THEN c(a) = INT(RND(1) * 13) + 1
    'LOCATE 1: PRINT k(a);
    'LOCATE 2: PRINT c(a);
NEXT a

LINE (29 + apukasi * 88, 355)-(89 + apukasi * 88, 430), , B
FOR a = 1 TO 2
    GOSUB kortti
NEXT a
IF tulos = 21 THEN
    FOR hmmm = 1 TO 1000: NEXT hmmm
    SOUND 300, 300 / 200
    blackjack(apukasi) = 1
    LOCATE 20, 51: PRINT "BLACK JACK"
    SOUND 440, 440 / 100
    SOUND 300, 300 / 200
    FOR hmmm = 1 TO 1000: NEXT hmmm
    LINE (383, 301)-(604, 322), 0, BF
END IF
IF apukasi = 0 THEN LINE (30, 30)-(90, 110), , B

IF apukasi = 0 THEN GOSUB ckortti



looppi:
g$ = INKEY$
IF g$ = "" THEN GOTO looppi
IF UCASE$(g$) = "H" AND a < 7 THEN blackjack(apukasi) = 0: GOTO hit
IF UCASE$(g$) = "S" AND apukasi = kasia THEN loptulos(apukasi) = tulos: GOTO leave
IF UCASE$(g$) = "S" AND apukasi < kasia THEN loptulos(apukasi) = tulos: apukasi = apukasi + 1: GOTO aikaalku
IF UCASE$(g$) = "D" AND a = 3 AND tulos >= 9 AND tulos <= 11 AND tupla(apukasi) = 0 AND money >= panos(apukasi) THEN GOTO doublaus
IF UCASE$(g$) = "I" AND c(1) = 1 AND insuu(apukasi) = 0 THEN GOTO insure
IF UCASE$(g$) = "B" THEN H = 0
IF g$ = CHR$(27) THEN END
GOTO looppi

hit:
LOCATE 20, 51: PRINT "Hit me !"
FOR hmmm = 1 TO 1000: NEXT hmmm
LINE (383, 301)-(604, 322), 0, BF
SOUND 340, 340 / 1000
GOSUB kortti
a = a + 1
IF leeveen = 1 THEN
    LOCATE 20, 51: PRINT "Over 21 !"
    FOR hmmm = 1 TO 1000: NEXT hmmm
    LINE (383, 301)-(604, 322), 0, BF
    FOR hmmm = 1 TO 1000: NEXT hmmm
    loptulos(apukasi) = tulos
END IF
IF leeveen = 1 AND apukasi <> kasia THEN leeveen = 0: apukasi = apukasi + 1: GOTO aikaalku
IF leeveen = 1 THEN GOTO leave
GOTO looppi

insure:
3 LOCATE 20, 51: INPUT "How many"; inmoney
LINE (383, 301)-(604, 322), 0, BF
IF INT(allbet / 2) < inmoney THEN GOTO 3
IF money < inmoney THEN GOTO 3
money = money - inmoney
insuu(apukasi) = 1
LOCATE 18, 52: PRINT "Money: "; money
LOCATE 17, 69: PRINT inmoney
GOTO looppi



doublaus:
BEEP
tupla(apukasi) = 1
allbet = allbet + panos(apukasi)
money = money - panos(apukasi)
panos(apukasi) = panos(apukasi) * 2
LOCATE 16, 52: PRINT "Bet:   "; allbet
LOCATE 18, 52: PRINT "Money: "; money
LOCATE 28, 11 * apukasi + 7: PRINT panos(apukasi)
leeveen = 1
GOTO looppi

leave:
LOCATE 20, 51: PRINT "HHMMMMMM"
FOR hmmm = 1 TO 1000: NEXT hmmm
LINE (383, 301)-(604, 322), 0, BF
FOR hmmm = 1 TO 1000: NEXT hmmm
SOUND 340, 340 / 1000
GOSUB ckortti
IF ctulos < 17 THEN GOTO leave
IF c(1) = 1 AND c(2) < 10 AND inmoney > 0 THEN inmoney = 0

FOR hmmm = 1 TO 1000: NEXT hmmm
FOR ch = 0 TO kasia
    jako = 1: mako = 0
    IF loptulos(ch) > 21 THEN teks$ = "     Lose -": win(ch) = 0: GOTO apuch
    IF blackjack(ch) = 1 AND cblackjack = 1 THEN teks$ = "Stand off -": win(ch) = 1: GOTO apuch
    IF cblackjack = 1 THEN teks$ = "     Lose -": win(ch) = 0: GOTO apuch
    IF blackjack(ch) = 1 THEN teks$ = "  Win 3:2 -": win(ch) = 3: jako = 2: mako = panos(ch): GOTO apuch
    IF ctulos > 21 THEN teks$ = "  Win 1:1 -": win(ch) = 2: GOTO apuch
    IF ctulos > loptulos(ch) THEN teks$ = "     Lose -": win(ch) = 0: GOTO apuch
    IF ctulos < loptulos(ch) THEN teks$ = "  Win 1:1 -": win(ch) = 2: GOTO apuch
    IF ctulos = loptulos(ch) THEN teks$ = "Stand off -": win(ch) = 1: GOTO apuch
    apuch:
    LOCATE 5 + ch, 50: PRINT teks$
    massii = massii + (panos(ch) * (win(ch) / jako)) - panos(ch) + mako
    massii = INT(massii)
    IF massii < 0 THEN masteks$ = "Lose:  "
    IF massii = 0 THEN masteks$ = "Draw:  "
    IF massii > 0 THEN masteks$ = "Win:   "
    LOCATE 17, 52: PRINT masteks$; ABS(massii)
    GOSUB saundi
NEXT ch
IF c(1) = 1 AND c(2) >= 10 AND inmoney > 0 THEN
    inmoney = inmoney * 3
    LOCATE 17, 69: PRINT inmoney
    GOSUB saundi
END IF
LOCATE 20, 51: PRINT "Press ENTER to continue"
DO
    g$ = INKEY$
LOOP UNTIL g$ = CHR$(13)
LINE (383, 301)-(604, 322), 0, BF

LOCATE 16, 52: PRINT "Bet:       "
money = money + allbet
LOCATE 18, 52: PRINT "Money: "; money
allbet = 0
GOSUB saundi
LOCATE 17, 52: PRINT masteks$; "    "
money = money + massii
massii = 0
LOCATE 18, 52: PRINT "Money: "; money
GOSUB saundi
IF c(1) = 1 AND c(2) >= 10 AND inmoney > 0 THEN
    money = money + inmoney
    inmoney = 0
    LOCATE 18, 52: PRINT "Money: "; money
    LOCATE 17, 69: PRINT inmoney
    GOSUB saundi
END IF
IF money = 0 THEN END

GOTO alku


kortti:
LOCATE 28 - a * 3, 7 + apukasi * 11
IF k(a) > 1 AND k(a) < 11 THEN PRINT k(a)
IF k(a) = 1 THEN PRINT " A"
IF k(a) = 11 THEN PRINT " J"
IF k(a) = 12 THEN PRINT " Q"
IF k(a) = 13 THEN PRINT " K"
IF a <> 1 THEN LINE (29 + apukasi * 88, 355 - (a - 2) * 45)-(89 + apukasi * 88, 355 - (a - 1) * 45), , B
GOSUB lasku
RETURN
lasku:
FOR d = 1 TO a
    IF k(d) > 1 AND k(d) < 11 THEN yht = yht + k(d)
    IF k(d) > 10 THEN yht = yht + 10
    IF k(d) = 1 THEN yht = yht + 11: assa = assa + 1
NEXT d
tulos = yht
yht = 0

apulasku:
IF tulos > 21 AND assa > 0 THEN assa = assa - 1: tulos = tulos - 10

LOCATE 5 + apukasi, 72: PRINT tulos
IF tulos > 21 THEN leeveen = 1
RETURN

ckortti:
b = b + 1
LOCATE 5, 1 + b * 6
LINE (90, 30)-(90 + 48 * (b - 1), 110), , B

IF c(b) > 1 AND c(b) < 11 THEN PRINT c(b)
IF c(b) = 11 THEN PRINT " J"
IF c(b) = 12 THEN PRINT " Q"
IF c(b) = 13 THEN PRINT " K"
IF c(b) = 1 THEN PRINT " A"

GOSUB clasku
RETURN

clasku:
FOR d = 1 TO b
    IF c(d) > 1 AND c(d) < 11 THEN yht = yht + c(d)
    IF c(d) > 10 THEN yht = yht + 10
    IF c(d) = 1 THEN yht = yht + 11: cassa = cassa + 1
NEXT d
ctulos = yht
yht = 0
IF ctulos > 21 AND cassa > 0 THEN cassa = cassa - 1: ctulos = ctulos - 10
IF c(1) = 1 AND c(2) >= 10 AND b = 2 THEN cblackjack = 1
LOCATE 4, 72: PRINT ctulos
RETURN

saundi:
SOUND 300, 300 / 70
SOUND 200, 200 / 160
FOR hmmm = 1 TO 2000: NEXT hmmm
RETURN
~~~

## Running Psyko III
New type of worm game. Actually quite interesting :D

![runningPsyko3](/assets/pics/page/screenshot/runningPsyko3.JPG){: .mx-auto.d-block :}

~~~
RANDOMIZE TIMER
GOSUB alkukuva
GOSUB mission
SCREEN 12
CONST leveys = 640
CONST korkeus = 480
CONST aste = 5 * 3.141592653589793# / 180
DIM ti AS INTEGER
DIM bx AS INTEGER
DIM by AS INTEGER
DIM cle AS INTEGER
x = 100: x1 = 100
CONST v = 1
CONST mv = .85
CONST hidastus = 200000

cle = 1

ti = -1
y = 100: y1 = 99
kaantaja:
FOR aaaa = 1 TO hidastus
NEXT aaaa
ti = ti + 1: IF ti = 10000 THEN lapi = 1: GOTO dead
IF ti / 5 = INT(ti / 5) THEN
    alfa = alfa + alfi
    vx = v * SIN(alfa)
    vy = v * COS(alfa)
       
END IF

'IF ti / 20 = INT(ti / 20) THEN
'ti2 = ti2 + 5
'CIRCLE (leveys / 2, korkeus / 2), ti2, 14
'END IF

x = x + vx
y = y + vy

IF mx < x THEN mvx = mv
IF mx > x THEN mvx = -mv
IF my < y THEN mvy = mv
IF my > y THEN mvy = -mv
      
mx = mx + mvx
my = my + mvy
LINE (mx, my)-(mx + 1, my + 1), 14, BF
        
IF noppe = 0 THEN
    LINE (bx, by)-(bx + 10, by + 10), 0, BF
    bx = INT(RND(1) * (leveys - 45)) + 20
    by = INT(RND(1) * (korkeus - 45)) + 20
    LINE (bx, by)-(bx + 10, by + 10), 4, BF
    noppe = 1
ELSE
    IF POINT(x, y) = 4 AND noppe = 1 THEN noppe = 0: cle = cle + 1: boxes = boxes + 100
END IF

IF x > leveys THEN x = 0
IF x < 0 THEN x = leveys
IF y < 0 THEN y = korkeus
IF y > korkeus THEN y = 0

IF POINT(x, y) = 14 THEN GOTO dead
PSET (x, y), 12
PSET (x1, y1), 14
x1 = x: y1 = y
li$ = INKEY$
IF li$ = "" THEN GOTO kaantaja
IF li$ = "6" THEN alfi = -aste
IF li$ = "5" THEN alfi = 0
IF li$ = "4" THEN alfi = aste
IF li$ = CHR$(27) THEN END
IF li$ = CHR$(13) AND cle > 0 THEN cle = cle - 1: CLS: noppe = 0: ti2 = 0
GOTO kaantaja
dead:
CLS
PRINT "Press (ESC) to continue"
points = ti + boxes + cle * 50
DO
    c = INT(RND(1) * 15)
    COLOR c: LOCATE 15, 34
    PRINT "POINTS: "; points
    g$ = INKEY$
LOOP UNTIL g$ = CHR$(27)
IF lapi = 1 THEN
    CLS
    PRINT "You win psyko! Congralations!"
    INPUT "Please give your name"; adf$
    PLAY "MfT180o2P2P8L8GGGL2E-P24P8L8FFFL2D"
END IF
END
mission:
SCREEN 12
COLOR 12: LOCATE 1, 30: PRINT "Running psyko III"
        
LOCATE 24: COLOR 15: PRINT "Press (ESC) to continue"
LOCATE 5
PRINT "Teht„v„si on v„istell„ per„ss„ tulevaa psyko III:sta."
PRINT
PRINT "Ohjaus:"
PRINT "Vasemmalle = 4"
PRINT "Oikealle   = 6"
PRINT "Suoraan    = 5"
PRINT "Kuvaruudun tyhjennys = (ENTER), jos olet ker„nnyt laatikoita."
PRINT
PRINT "Jokaisesta ker„tyst„ laatikosta saat aina yhden kuva ruudun tyhjennyksen."
PRINT "(Alussa sinulla on yksi kuvaruudun tyhjennys)"
PRINT
PRINT "Peli loppuu kun t”rm„„t Psykon tai sinun j„tt„m„„si j„lkeen."
PRINT
PRINT "Pisteit„ saat seuraavasti:"
PRINT
PRINT "Aika: Mit„ kauemmin pysyt elossa sen enemm„n saat pisteit„"
PRINT "Laatikot: 100 pistett„/laatikko"
PRINT "K„ytt„m„tt”m„t laatikot: 50 pistett„/laatikko"

DO
    g$ = INKEY$
LOOP UNTIL g$ = CHR$(27)
CLS
RETURN
alkukuva:
CLS
COLOR 15: PRINT "Press (ENTER) to continue"
DO
    c = INT(RND(1) * 15)
    COLOR c
    LOCATE 12, 29: PRINT "BY: JAAKKO TALONEN"
    g$ = INKEY$
LOOP UNTIL g$ = CHR$(13)
RETURN
~~~

## Baltsi
Bouncing ball, collect items and beware water, download converted exe file [here](https://www.dropbox.com/sh/ne7b81igchipyai/AACfGCtSlHBKO1rAzsL7hhh8a?dl=0).
~~~
'*****************************************************************************
SCREEN 12
'*****************************************************************************
RANDOMIZE TIMER
'*****************************************************************************
DIM energy AS INTEGER
'*****************************************************************************
ballgame:
energy = 50: x = 100
CONST r = 10, max = 10, a = 1, vr = 15, avy = -8.4
y = 26 + r
b = .1
x1 = x: y1 = y
'*****************************************************************************
LINE (0, 0)-(635, 440), 7, B
LINE (5, 5)-(630, 435), 7, B
PAINT (3, 3), 7
LINE (5, 405)-(630, 410), 7, BF
'*****************************************************************************
LINE (6, 405)-(116, 407), 4, BF
LINE (629, 405)-(529, 407), 4, BF
LINE (256, 405)-(379, 407), 11, BF
'*****************************************************************************
LOCATE 27, 2: PRINT "POINTS:"
LOCATE 27, 20: PRINT "ENERGY:"
'*****************************************************************************
'*****************************************************************************
looppi:
IF w = 0 THEN
    w = 1
    q = INT(RND(1) * 580) + 35
    e = INT(RND(1) * 340) + 35
    CIRCLE (q, e), r, 14
    PAINT (q, e), 14
END IF
'*****************************************************************************
vy = vy - b
y = y - vy
x = x + vx
'*****************************************************************************
IF x > 619 OR x < 16 THEN x = x1: vx = -vx: GOSUB ener
IF ABS(q - x) < 20 AND ABS(e - y) < 20 THEN
    w = 0
    points = points + 100
    LOCATE 27, 10: PRINT points
    PAINT (q, e), 0
    SOUND 440, .44
END IF
'*****************************************************************************
IF vy < avy THEN
    b = .2
    IF x < 116 THEN b = .1
    IF x > 529 THEN b = .1
    IF x > 256 AND x < 379 THEN b = .4
    vy = -avy + b
    y = 405 - r - 1
    GOSUB ener
END IF
'*****************************************************************************
CIRCLE (x, y), r, vr
CIRCLE (x1, y1), r, 0
'*****************************************************************************
x1 = x: y1 = y
'*****************************************************************************
g$ = INKEY$
SELECT CASE g$
    CASE ""
        GOTO looppi
    CASE "4"
        IF vx > -a * max THEN vx = vx - a
    CASE "5"
        w = 0
        points = points - 100
        LOCATE 27, 10: PRINT points
        PAINT (q, e), 0
        SOUND 250, 250 / 1000
    CASE "6"
        IF vx < a * max THEN vx = vx + a
    CASE CHR$(27)
        END
END SELECT
'*****************************************************************************
GOTO looppi
'*****************************************************************************
'*****************************************************************************
ener:
energy = energy - 1
LOCATE 27, 28: PRINT energy
IF energy = 0 THEN CIRCLE (x1, y1), r, 0: CIRCLE (x, y), r, vr: GOTO loppu
RETURN
'*****************************************************************************
loppu:
END
'*****************************************************************************
~~~

## BlackJack simulator

![MUSTAJA7.bas](/assets/pics/page/screenshot/blackjacksimulator_MUSTAJA7.JPG){: .mx-auto.d-block :}

Automatically play blackjack with different tactics.
![MUSTAJA7v2.bas](/assets/pics/page/screenshot/blackjacksimulator_MUSTAJA7-v2.JPG){: .mx-auto.d-block :}

### MUSTAJA7.BAS
~~~

RANDOMIZE TIMER
CLS
DIM mina(10)
DIM jakaja(10)
DIM voitot(10, 11)
DIM eivoitot(10, 11)
DIM tasapelit(10, 11)
DIM eitasapelit(10, 11)

DIM pisteet(10, 11)
DIM eipisteet(10, 11)


DIM lisaako(10, 11)


DIM assa, kortti AS INTEGER

FOR a = 0 TO 11
    FOR b = 0 TO 10
        voitot(b, a) = 0
        eivoitot(b, a) = 0
        tasapelit(b, a) = 0
        eitasapelit(b, a) = 0

    NEXT b
NEXT a
pelinpituus = 100

kelaus = 0
peleja = 0
FOR vaihto = 9 TO 20

    'omatkortit = vaihto
    omatalussa = vaihto
    PRINT "Omien korttien summa:"; omatalussa
    99:
    kelaus = kelaus MOD 10 + 1
    peleja = peleja + 1
    a = 2
    assa = 0
    'PRINT kelaus
    1
    a = a + 1
    kortti = INT(RND(1) * 13) + 1
    IF kortti > 10 THEN kortti = 10
    IF kortti = 1 AND assa = 0 THEN
        kortti = 11
        assa = 1
    END IF
    omatkortit = omatalussa + kortti
    IF omatkortit > 21 AND assa = 1 THEN
        omatkortit = omatkortit - 10
        assa = 0
    END IF
    IF a >= 2 AND omatkortit >= 9 THEN GOTO 2
    GOTO 1
    2


    'GOSUB korttiprintti

    aa = 1
    yhteensa = kelaus
    jakaja(1) = kelaus

    3
    aa = aa + 1
    jakaja(aa) = INT(RND(1) * 13) + 1
    IF jakaja(aa) > 10 THEN jakaja(aa) = 10
    yhteensa = yhteensa + jakaja(aa)

    FOR b = 1 TO aa
        IF jakaja(b) = 1 AND yhteensa <= 11 AND yhteensa >= 7 THEN
            yhteensa = yhteensa + 10
            b = aa
        END IF
    NEXT b
 
    IF yhteensa >= 17 THEN GOTO 4

    GOTO 3

    4


    IF ((yhteensa > 21) OR (yhteensa <= omatkortit)) AND (omatkortit <= 21) THEN
        IF (yhteensa = omatkortit) THEN
            tasapelit(kelaus, vaihto - 9) = tasapelit(kelaus, vaihto - 9) + 1
        ELSE
            voitot(kelaus, vaihto - 9) = voitot(kelaus, vaihto - 9) + 1
        END IF
    END IF


    IF (yhteensa > 21) OR yhteensa <= omatalussa THEN
        IF (yhteensa = omatalussa) THEN
            eitasapelit(kelaus, vaihto - 9) = eitasapelit(kelaus, vaihto - 9) + 1
        ELSE
            eivoitot(kelaus, vaihto - 9) = eivoitot(kelaus, vaihto - 9) + 1
        END IF
        'PRINT "V"
    END IF


    'IF kelaus = 10 THEN kelaus = 0
    IF peleja MOD pelinpituus = 0 THEN
        CLS
        PRINT "peleja:"; peleja
        PRINT "lis„„ voitot:"
        apu = 0
        FOR b = 1 TO 10
            PRINT voitot(b, vaihto - 9); "/"; tasapelit(b, vaihto - 9);
            apu = apu + voitot(b, vaihto - 9) + tasapelit(b, vaihto - 9) / 2
        NEXT b
        PRINT "yht:"; apu; ","; INT(apu / pelinpituus * 100); "%"
        PRINT "voitot%"
        FOR b = 1 TO 10
            PRINT INT(1000 * (voitot(b, vaihto - 9) + tasapelit(b, vaihto - 9) / 2) / pelinpituus);
        NEXT b
       

        PRINT
        PRINT "ei voitot:"
        apu = 0
        apuvoitot = 0
        aputasapelit = 0
        FOR b = 1 TO 10
            PRINT eivoitot(b, vaihto - 9); "/"; eitasapelit(b, vaihto - 9);
            apu = apu + eivoitot(b, vaihto - 9) + eitasapelit(b, vaihto - 9) / 2

            IF voitot(b, vaihto - 9) > eivoitot(b, vaihto - 9) THEN
                apuvoitot = apuvoitot + voitot(b, vaihto - 9)
            ELSE
                apuvoitot = apuvoitot + eivoitot(b, vaihto - 9)
            END IF
            IF tasapelit(b, vaihto - 9) > eitasapelit(b, vaihto - 9) THEN
                aputasapelit = aputasapelit + tasapelit(b, vaihto - 9)
            ELSE
                aputasapelit = aputasapelit + eitasapelit(b, vaihto - 9)
            END IF

        NEXT b
        PRINT "yht:"; apu; ","; INT(apu / pelinpituus * 100); "%"
        
        PRINT "eivoitot%"
        FOR b = 1 TO 10
            PRINT INT(1000 * (eivoitot(b, vaihto - 9) + eitasapelit(b, vaihto - 9) / 2) / pelinpituus);
        NEXT b
        PRINT
        PRINT "J„rkev„ peli"
        PRINT "voitot:"; apuvoitot; ","; INT(apuvoitot / pelinpituus * 100); "%"
        PRINT "tasapelit:"; aputasapelit; ","; INT(aputasapelit / pelinpituus * 100); "%"
    END IF

    IF peleja MOD pelinpituus = 0 THEN GOTO nexti
    GOTO 99
    nexti:
NEXT vaihto
                                                       
CLS
'PRINT "Pelej„"; peleja; ","; pelinpituus;
'PRINT "Panos 2mk  --> jakaja A-10, pelaaja 9-20"

'FOR a = 0 TO 11
FOR a = 0 TO 8
    apu2 = 0
    PRINT a + 9; ":";
    FOR b = 1 TO 10
        pisteet(b, a) = voitot(b, a) + (tasapelit(b, a) / 2)
        PRINT INT(pisteet(b, a));
        apu2 = apu2 + pisteet(b, a)
    NEXT b
    PRINT ":"; apu2
NEXT a
'PRINT " ei korttia lis„„"
apu = 0
OPEN "c:\blackjaq.eip" FOR OUTPUT AS #1
FOR a = 0 TO 11
    apu2 = 0
    matriisi$ = ""
    PRINT a + 9; ":";
    FOR b = 1 TO 10
        eipisteet(b, a) = eivoitot(b, a) + (eitasapelit(b, a) / 2)
        matriisi$ = matriisi$ + STR$(eipisteet(b, a)) + ","
        PRINT INT(eipisteet(b, a));
        apu2 = apu2 + eipisteet(b, a)
        IF pisteet(b, a) > eipisteet(b, a) THEN
            apu = apu + pisteet(b, a)
        ELSE
            apu = apu + eipisteet(b, a)
        END IF
    NEXT b
    WRITE #1, matriisi$
    PRINT ":"; apu2
NEXT a
CLOSE #1
PRINT "pelattaessa peleja"; peleja; "mk:lla k„teen on j„„ny"; -peleja + apu * 2; "mk:ta!"

FOR a = 1 TO 1000000
    g$ = INKEY$
    IF g$ = "q" THEN a = 1000000
NEXT a
OPEN "c:\blackjaq.pis" FOR OUTPUT AS #1
FOR a = 0 TO 11
    apu2 = 0
    matriisi$ = ""
    PRINT a + 9; ":";
    FOR b = 1 TO 10
        IF pisteet(b, a) - 1 > eipisteet(b, a) THEN
            PRINT "2";
            matriisi$ = matriisi$ + "2,"
        ELSEIF eipisteet(b, a) - 1 > pisteet(b, a) THEN
            PRINT "0";
            matriisi$ = matriisi$ + "0,"
        ELSE
            PRINT "1";
            matriisi$ = matriisi$ + "1,"
        END IF
    NEXT b
    WRITE #1, matriisi$
    PRINT
NEXT a
CLOSE #1
OPEN "c:\blackjaq.dub" FOR OUTPUT AS #1
PRINT "Duplaukset"
FOR a = 0 TO 2
    apu2 = 0
    PRINT a + 9; ":";
    matriisi$ = ""
    FOR b = 1 TO 10
        IF pisteet(b, a) * 1000 / pelinpituus > 50 THEN
            PRINT "D ";
            matriisi$ = matriisi$ + "D,"
        ELSE
            PRINT "- ";
            matriisi$ = matriisi$ + "-,"
        END IF
    NEXT b
    WRITE #1, matriisi$
    PRINT
NEXT a
CLOSE #1
FOR a = 1 TO 1000000
    g$ = INKEY$
    IF g$ = "q" THEN a = 1000000
NEXT a


END
korttiprintti:

PRINT "Jakaja:";
FOR b = 1 TO aa
    PRINT jakaja(b);
NEXT b
PRINT "yht:"; yhteensa;
PRINT


RETURN
~~~


## References
- [check this later p5js QB?](https://github.com/FellippeHeitor/p5js.bas)
- https://github.com/FellippeHeitor?tab=repositories
- https://github.com/SteveMcNeill/Steve64
- https://www.qb64.org/forum/index.php?topic=965.0
- https://www.youtube.com/watch?v=gFoEKkh1b5o
- https://qbasic-forum.qbasic.net/qbasic-related/how-open-bas-file-that-created-1997-t622.html
