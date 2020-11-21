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