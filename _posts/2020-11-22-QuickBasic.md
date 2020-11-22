---
layout: post
title: Quick Basic
subtitle: old codes wake up from coma - part 2
tags:
  - Quick Basic
  - bas
  - antique code
comments: true
cover-img: /assets/pics/cover/screenshot/qb.JPG
thumbnail-img: /assets/pics/thumbnail/screenshot/qb.JPG
published: true
---
# Quick Basic

"From the 80s to eternity. Unlike traditional BASIC and QBasic code, QB64 gets compiled automatically into machine code – allowing exceptional performance, easy distribution, and the ability to link with external C and C++ programming libaries.", se [qb64 portal](https://www.qb64.org/portal/).

I had some problems to open old code files, [in QB45 format detected](https://www.qb64.org/forum/index.php?topic=965.0). Conversion worked almost all files.
Finally, I was able to open all expect one file. I think it is simple car game having "fun" steering system. Instead of controlling steering wheel and speed, player can accelerate in both x- and y-directions. 

- More info at [Pete's QBSSIC site](http://petesqbsite.com/phpBB3/viewtopic.php?t=7472).
- [QB64 Files](https://www.qb64.org/wiki/FILES)

## Download 

https://www.qb64.org/portal/
unpack e.g. to C:\qb64\

![bas code in 45 binary format](/assets/pics/page/screenshot/qb64_45binarydetected.JPG){: .mx-auto.d-block :}


# Code

## Worm game for 2-4 palyers
Worm game, download converted exe file [here]('https://talonendm.github.io/assets/bas/converted/MATIS3_converted.exe').

![matis3 converted.pas](/assets/pics/page/screenshot/matis3_hidastus.JPG){: .mx-auto.d-block :}

Note: for loop added 21.11.2020 to matis3 (converted).pas after looppi:. It makes worms slower.
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
Texas Hold'em simulator. It seems that I had creative coding skills already more than 19 years ago, see filename where results are saved and the extension based on my nick name. 
![TURPAUT1.pas](/assets/pics/page/screenshot/10pari_v1.JPG){: .mx-auto.d-block :}
![turpa200.pas](/assets/pics/page/screenshot/10pari_v2.JPG){: .mx-auto.d-block :}



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
Car game, download converted exe file [here](https://talonendm.github.io/assets/bas/converted/TURPA200_converted.exe).
![TURPAUT1.pas](/assets/pics/page/screenshot/TURPAUT1.JPG){: .mx-auto.d-block :}
![turpa200.pas](/assets/pics/page/screenshot/turpa200.JPG){: .mx-auto.d-block :}
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


## References

https://github.com/FellippeHeitor/p5js.bas
https://github.com/FellippeHeitor?tab=repositories
https://github.com/SteveMcNeill/Steve64
https://www.qb64.org/forum/index.php?topic=965.0
https://www.youtube.com/watch?v=gFoEKkh1b5o
https://qbasic-forum.qbasic.net/qbasic-related/how-open-bas-file-that-created-1997-t622.html