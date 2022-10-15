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
