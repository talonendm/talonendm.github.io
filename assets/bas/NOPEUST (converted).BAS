RANDOMIZE TIMER
CLS
PRINT "NOPEUS TESTERI v1.0"
PRINT
PRINT "Tehnyt: Jaakko Talonen 2.9.1994"
PRINT
PRINT "Paina ruudussa olevaa kirjainta"
PRINT
PRINT "V„„r„st„ kirjaimesta -100 pistett„"
PRINT
PRINT "paina jotain nappii"
DO
g$ = INKEY$
LOOP UNTIL g$ <> ""
CLS
moi:
LOCATE 14, 38
IF v = 10 THEN PRINT "Points:"; 100000 - t: END
a = INT(RND(1) * 25) + 97
PRINT CHR$(a)
moi2:
g$ = INKEY$
t = t + 1
IF g$ = CHR$(a) THEN v = v + 1: GOTO moi
IF g$ <> CHR$(a) AND g$ <> "" THEN t = t + 100
GOTO moi2