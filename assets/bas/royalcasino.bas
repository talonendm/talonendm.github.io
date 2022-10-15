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