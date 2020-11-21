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