SCREEN 13
RANDOMIZE TIMER
LINE (0, 0)-(319, 199), 4, B
LINE (1, 1)-(318, 198), 4, B
LINE (2, 198)-(317, 199), 6, BF

LINE (21, 21)-(292, 50), 6, BF
'FOR rn = 1 TO 50
'        rmx = INT(RND(1) * 271) + 21
'        rmy = INT(RND(1) * 30) + 21
'        CIRCLE (rmx, rmy), 5, 7
'        PAINT (rmx, rmy), 7
'        CIRCLE (rmx, rmy), 5, 0
'        PAINT (rmx, rmy), 0
'NEXT rn
LINE (35, 30)-(45, 40), 14, BF
LINE (265, 30)-(275, 40), 14, BF
LINE (150, 30)-(160, 40), 14, BF
DIM mx AS INTEGER
DIM my AS INTEGER
DIM mx1 AS INTEGER
DIM my1 AS INTEGER
DIM mvx AS INTEGER
DIM mvy AS INTEGER
DIM vx AS INTEGER
DIM x AS INTEGER
'DIM ti AS INTEGER
DIM snook AS INTEGER
DIM pituus AS INTEGER
DIM nopp AS INTEGER
DIM vaik AS INTEGER
vaik = 10
mx = INT(RND(1) * 30) + 145
mx1 = mx
my = 100: my1 = my
mvx = 1
mvy = 1
nopp = 1

vx = 1
x = 100
pituus = 25
LINE (x, 180)-(x + pituus, 180), 12
looppi:
ti = ti + 1
'LOCATE 2, 2: PRINT ti
FOR ty = 1 TO vaik: NEXT ty
IF vx = -1 THEN
    IF x < 3 THEN vx = 1: GOTO looppi
    PSET (x, 180), 12
    PSET (x + pituus, 180), 0
ELSE
    IF x > 316 - pituus THEN vx = -1: GOTO looppi
    PSET (x, 180), 0
    PSET (x + pituus, 180), 12
END IF
x = x + vx
IF ti / nopp = INT(ti / nopp) THEN GOSUB pallo
g$ = INKEY$
IF g$ = "" THEN GOTO looppi
IF g$ = "4" THEN vx = -1
IF g$ = "6" THEN vx = 1
IF g$ = CHR$(27) THEN END
GOTO looppi
pallo:
mx = mx + mvx
my = my + mvy
IF POINT(mx, my) <> 0 THEN
    IF POINT(mx, my) = 12 THEN
        IF my1 = 179 THEN mvy = -1
        IF my1 = 181 THEN mvy = 1
        SOUND 440, 440 / 1000
        ti = ti + 100

    END IF
    IF POINT(mx, my) = 4 THEN
        IF POINT(mx1, my) = 4 THEN mvy = -mvy
        IF POINT(mx, my1) = 4 THEN mvx = -mvx
        SOUND 600, 600 / 1000
    END IF
    IF POINT(mx, my) = 6 THEN
        IF POINT(mx1, my) = 6 THEN mvy = -mvy
        IF POINT(mx, my1) = 6 THEN mvx = -mvx
        CIRCLE (mx, my), 10, 7
        PAINT (mx, my), 7
        CIRCLE (mx, my), 10, 0
        PAINT (mx, my), 0
        SOUND 300, 300 / 1000
        ti = ti + 500
    END IF
    IF POINT(mx, my) = 14 THEN
        IF POINT(mx1, my) = 14 THEN mvy = -mvy
        IF POINT(mx, my1) = 14 THEN mvx = -mvx
        CIRCLE (mx, my), 25, 7
        PAINT (mx, my), 7
        CIRCLE (mx, my), 25, 0
        PAINT (mx, my), 0
        pituus = pituus + 10
        ti = ti + 250
        SOUND 1000, 1000 / 1000
    END IF
    mx = mx + mvx
    my = my + mvy
    IF my > 199 OR my < 0 OR mx > 319 OR mx < 0 THEN GOTO dead
END IF
PSET (mx, my), 2
PSET (mx1, my1), 0
mx1 = mx: my1 = my
RETURN
dead:
CLS
PRINT "Points:"; ti
DO
    g$ = INKEY$
LOOP UNTIL g$ = CHR$(13)
END