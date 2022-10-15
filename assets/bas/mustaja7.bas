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