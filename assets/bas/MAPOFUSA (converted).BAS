SCREEN 12
DIM x(57)
DIM y(57)
ja = 15
vari = 2
xplu = 100
yplu = 100
'PAINT (1, 1), 1
LOCATE 2, 34: PRINT "Map Of USA"

OPEN "c:\windows\usaproje\usaxcood.txt" FOR INPUT AS #1
OPEN "c:\windows\usaproje\usaycood.txt" FOR INPUT AS #2
        INPUT #1,w
        INPUT #2,w

FOR p = 1 TO 57
        INPUT #1,x(p)
        INPUT #2,y(p)
NEXT p
CLOSE 1
CLOSE 2
x1 = x(57)
y1 = y(57)
FOR p = 1 TO 57
        LINE (xplu + x(p) / ja, yplu + y(p) / ja)-(xplu + x1 / ja, yplu + y1 / ja), vari
        x1 = x(p): y1 = y(p)
NEXT p
PAINT (x(1) + 30, y(1) + 30), vari
