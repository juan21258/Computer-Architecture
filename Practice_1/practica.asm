# 1.4.3.0
jmp 011 ;aqui se inicializa la matriz en cero
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0

MSG **************************
MSG *     Menu Template      *
MSG **************************
MSG * 1) Posicion inicial    *
MSG * 2) Llenado de la matriz*
MSG * 3) Mostrar el contenido*
MSG * 4) Salir               *
MSG **************************
LDT     ;Ingreso del dato para posicion
CMP 113 ;Comparar con posición 113 (1)
JEQ 130 ;Si son iguales, saltar a 113
CMP 114 ;Comparar con posición 114 (2)
JEQ 340 ;Si son iguales, saltar a 340
CMP 115 ;Comparar con posición 115 (3)
JEQ 800 ;Si son iguales, saltar a 800
CMP 116 ;Comparar con posicion 116 (4)
JEQ 890 ;Si son iguales, saltar a 890

;Nota -> CLA para limpiar el contenido de AX

#113
;Opciones menu
00001
00010
00011
00100
#130
MSG ingrese la casilla
MSG [1][2][3][4]
MSG [5][6][7][8]
MSG [9][10][11][12]
MSG [13][14][15][16]
LDT
jmp 150

;casilla seleccionada
#150
CMP 200
jeq 300
CMP 201
jeq 302
CMP 202
jeq 304
CMP 203
jeq 306
CMP 204
jeq 308
CMP 205
jeq 30A
CMP 206
jeq 30C
CMP 207
jeq 30E
CMP 208
jeq 310
CMP 209
jeq 312
CMP 20A
jeq 314
CMP 20B
jeq 316
CMP 20C
jeq 318
CMP 20D
jeq 31A
CMP 20E
jeq 31C
CMP 20F
jeq 31E



#200
;Posiciones iniciales a comparar
00001
00010
00011
00100
00101
00110
00111
01000
01001
01010
01011
01100
01101
01110
01111
10000

;Movimiento valido y chequeo de posicion inicial
#215
0

#240
;FIN
10001

#250
;numero de movimiento(ira cambiando)
10
;posicion inicial
1
#260
;numero a devolverse
1
;1 para devolverse
1

#300

;asignar posicion inicial
MOV 001,251
JMP 011
MOV 002,251
JMP 011
MOV 003,251
JMP 011
MOV 004,251
JMP 011
MOV 005,251
JMP 011
MOV 006,251
JMP 011
MOV 007,251
JMP 011
MOV 008,251
JMP 011
MOV 009,251
JMP 011
MOV 00A,251
JMP 011
MOV 00B,251
JMP 011
MOV 00C,251
JMP 011
MOV 00D,251
JMP 011
MOV 00E,251
JMP 011
MOV 00F,251
JMP 011
MOV 010,251
JMP 011


;Llenado de la matriz
#340
;Movimientos segun posicion inicial
MOV AX,1
CMP 251
JEQ 370
MOV AX,2
CMP 251
JEQ 37D
MOV AX,3
CMP 251
JEQ 38D
MOV AX,4
CMP 251
JEQ 39D
MOV AX,5
CMP 251
JEQ 3AA
MOV AX,6
CMP 251
JEQ 3BA
MOV AX,7
CMP 251
JEQ 3CD
MOV AX,8
CMP 251
JEQ 3E0
MOV AX,9
CMP 251
JEQ 3F0
MOV AX,00A
CMP 251
JEQ 400
MOV AX,00B
CMP 251
JEQ 413
MOV AX,OOC
CMP 251
JEQ 426
MOV AX,00D
CMP 251
JEQ 436
MOV AX,00E
CMP 251
JEQ 443
MOV AX,00F
CMP 251
JEQ 453
MOV AX,010
CMP 251
JEQ 463

#370
;Movimientos casilla 1

;Chequeo de HALT
MOV AX,250
CMP 240
JEQ 800

;salto a 7
MOV AX,7
CMP 215
JEQ 524
;salto a 10
MOV AX,00A
CMP 215
JEQ 536

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 2

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 8
MOV AX,8
CMP 215
JEQ 52A
;salto a 9
MOV AX,9
CMP 215
JEQ 530
;salto a 11
MOV AX,00B
CMP 215
JEQ 53C

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 3

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 5
MOV AX,5
CMP 215
JEQ 518
;salto a 10
MOV AX,00A
CMP 215
JEQ 536
;salto a 12
MOV AX,00C
CMP 215
JEQ 542

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 4

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 6
MOV AX,6
CMP 215
JEQ 51E
;salto a 11
MOV AX,00B
CMP 215
JEQ 53C

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 5

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 3
MOV AX,3
CMP 215
JEQ 50C
;salto a 11
MOV AX,00B
CMP 215
JEQ 53C
;salto a 14
MOV AX,00E
CMP 215
JEQ 54E

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 6

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 4
MOV AX,4
CMP 215
JEQ 512
;salto a 12
MOV AX,00C
CMP 215
JEQ 542
;salto a 13
MOV AX,00D
CMP 215
JEQ 548
;salto a 15
MOV AX,00F
CMP 215
JEQ 554

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 7

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 1
MOV AX,1
CMP 215
JEQ 500
;salto a 9
MOV AX,9
CMP 215
JEQ 530
;salto a 14
MOV AX,00E
CMP 215
JEQ 54E
;salto a 16
MOV AX,010
CMP 215
JEQ 55A

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 8

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 2
MOV AX,2
CMP 215
JEQ 506
;salto a 10
MOV AX,00A
CMP 215
JEQ 536
;salto a 15
MOV AX,00F
CMP 215
JEQ 554

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 9

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 2
MOV AX,2
CMP 215
JEQ 506
;salto a 7
MOV AX,7
CMP 215
JEQ 524
;salto a 15
MOV AX,00F
CMP 215
JEQ 554

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 10

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 1
MOV AX,1
CMP 215
JEQ 500
;salto a 3
MOV AX,3
CMP 215
JEQ 50C
;salto a 8
MOV AX,8
CMP 215
JEQ 52A
;salto a 16
MOV AX,010
CMP 215
JEQ 55A

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 11

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 2
MOV AX,2
CMP 215
JEQ 506
;salto a 4
MOV AX,4
CMP 215
JEQ 512
;salto a 5
MOV AX,5
CMP 215
JEQ 518
;salto a 13
MOV AX,00D
CMP 215
JEQ 548

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 12

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 3
MOV AX,3
CMP 215
JEQ 50C
;salto a 6
MOV AX,6
CMP 215
JEQ 51E
;salto a 14
MOV AX,00E
CMP 215
JEQ 54E

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 13

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 6
MOV AX,6
CMP 215
JEQ 51E
;salto a 11
MOV AX,00B
CMP 215
JEQ 53C

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 14

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 5
MOV AX,5
CMP 215
JEQ 518
;salto a 7
MOV AX,7
CMP 215
JEQ 524
;salto a 12
MOV AX,00C
CMP 215
JEQ 542

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 15

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 6
MOV AX,6
CMP 215
JEQ 51E
;salto a 8
MOV AX,8
CMP 215
JEQ 52A
;salto a 9
MOV AX,9
CMP 215
JEQ 530

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

;Movimientos casilla 16

;Chequeo de HALT
MOV AX,250 
CMP 240
JEQ 800

;salto a 7
MOV AX,7
CMP 215
JEQ 524
;salto a 10
MOV AX,00A
CMP 215
JEQ 536

;Caso de que no encuentre a donde moverse
MOV AX,260
SUB 261
MOV 260,AX
JMP 700

#500
;Aplicar movimientos a casillas

;si esta libre moverse a casilla 1
MOV 1,250
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 370

;si esta libre moverse a casilla 2
MOV 2,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 37D

;si esta libre moverse a casilla 3
MOV 3,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 38D

;si esta libre moverse a casilla 4
MOV 4,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 39D

;si esta libre moverse a casilla 5
MOV 5,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 3AA

;si esta libre moverse a casilla 6
MOV 6,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 3BA

;si esta libre moverse a casilla 7
MOV 7,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 3CD

;si esta libre moverse a casilla 8
MOV 8,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 3E0

;si esta libre moverse a casilla 9
MOV 9,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 3F0

;si esta libre moverse a casilla 10
MOV 00A,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 400

;si esta libre moverse a casilla 11
MOV 00B,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 413

;si esta libre moverse a casilla 12
MOV 00C,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 426

;si esta libre moverse a casilla 13
MOV 00D,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 436

;si esta libre moverse a casilla 14
MOV 00E,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 443

;si esta libre moverse a casilla 15
MOV 00F,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 453

;si esta libre moverse a casilla 16
MOV 010,250 
INC 250
MOV AX,250
SUB 261
MOV 260,AX
;saltar a la casilla
JMP 463


;Acciones para devolverse

#700
;Compara a donde se devuelve
MOV AX,260
CMP 1
JEQ 370
CMP 2
JEQ 37D
CMP 3
JEQ 38D
CMP 4
JEQ 39D
CMP 5
JEQ 3AA
CMP 6
JEQ 3BA
CMP 7
JEQ 3CD
CMP 8
JEQ 3E0
CMP 9
JEQ 3F0
CMP 00A
JEQ 400
CMP 00B
JEQ 413
CMP 00C
JEQ 426
CMP 00D
JEQ 436
CMP 00E
JEQ 443
CMP 00F
JEQ 453
CMP 010
JEQ 463





;Mostrar Matriz en pantalla
#800
MSG *** MATRIZ COMPLETA ***
MSG Primera fila
MOV AX,001
EAP
MOV AX,002
EAP
MOV AX,003
EAP
MOV AX,004
EAP
MSG Segunda fila
MOV AX,005
EAP
MOV AX,006
EAP
MOV AX,007
EAP
MOV AX,008
EAP
MSG Tercera fila
MOV AX,009
EAP
MOV AX,00A
EAP
MOV AX,00B
EAP
MOV AX,00C
EAP
MSG Cuarta fila
MOV AX,00D
EAP
MOV AX,00E
EAP
MOV AX,00F
EAP
MOV AX,010
EAP
JMP 890


#890
HLT ;fin del programa