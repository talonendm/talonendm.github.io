SCREEN 12
skaala = 100
xkor = 314
ykor = 250
LINE (0, ykor)-(650, ykor), 3
LINE (xkor, 0)-(xkor, 500), 3

a = -3.14 * 100 / skaala
b = 3.14 * 100 / skaala
FOR t = 1 TO 1
FOR x = a TO b STEP .05

y = .75 * x ^ 2 - 2

IF x = a THEN x0 = x: y0 = y
LINE (xkor + x0 * skaala, ykor - y0 * skaala)-(xkor + x * skaala, ykor - y * skaala), 4
x0 = x
y0 = y
NEXT x
NEXT t