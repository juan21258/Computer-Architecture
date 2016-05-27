#include <iostream>
#include <stdlib.h>
#include <windows.h> 
#include "conio.h"
#include "stdio.h"
#include <sstream>
#include <limits>
//bibliotecas c++

using namespace std;

float matriza[4][4];
float matrizb[4][4];
float numA, numB;
float entrada;
string opcion;
int op;
//funcion principal

//Método de suma
float pSuma(float numA,float numB){
	float result;
	__asm {
		FLD DWORD PTR numA // cargo el primer valor a analizar
		FLD DWORD PTR numB // cargo el segundo valor a analizar
		FADD //realizo la operación indicada
		FSTP DWORD PTR result	 // almaceno y extraigo el resultado	
		FSTP ST(0) //limpio el stack
		FSTP ST(1) //limpio el stack
	}
	return result;
}
//Método de resta
float pResta(float numA, float numB){
	float result;
	__asm {
		FLD DWORD PTR numA // cargo el primer valor a analizar
		FLD DWORD PTR numB // cargo el segundo valor a analizar
		FSUB //realizo la operación indicada
		FSTP DWORD PTR result	 // almaceno y extraigo el resultado
		FSTP ST(0) //limpio el stack
		FSTP ST(1) //limpio el stack
	}
	return result;
}
//Método de multiplicación
float pMultiplicacion(float numA, float numB){
	float result;
	__asm {
		FLD DWORD PTR numA // cargo el primer valor a analizar
		FLD DWORD PTR numB // cargo el segundo valor a analizar
		FMUL //realizo la operación indicada
		FSTP DWORD PTR result	 // almaceno y extraigo el resultado	
		FSTP ST(0) //limpio el stack
		FSTP ST(1) //limpio el stack
	}
	return result;
}
//Método de división
float pDivision(float numA, float numB) {
	float result;
	float cero = 0.0;
	__asm {
		FLD DWORD PTR numB
		FLD DWORD PTR cero // chequeo división por cero
		FCOMIP ST(0),ST(1)
		je divCero
		FLD DWORD PTR numA // cargo el primer valor a analizar
		FLD DWORD PTR numB // cargo el segundo valor a analizar
		FDIV //realizo la operación indicada
		FSTP DWORD PTR result	 // almaceno y extraigo el resultado
		FSTP ST(0) //limpio el stack
		FSTP ST(1) //limpio el stack
	}
	return result;
	
divCero:
	cout << "ind" << " "; // se imprime que la operación produce indeterminación
	return 0.0;
}

/*
la practica analiza una pequeña muestra de operaciones en matrices
algunas operaciones realizadas de forma diferente por el enunciado
de la respectiva práctica
*/

int main() {
	cout << "Operaciones con Matrices \n" << endl;
	cout << "Selecciones el tipo de operacion que desea realizar" << endl;
	cout << "Presione 1 para Suma" << endl;
	cout << "Presione 2 para Resta" << endl;
	cout << "Presione 3 para Multiplicacion" << endl;
	cout << "Presione 4 para Division" << endl;
	cout << "Presione 5 para salir del programa" << endl;
	recibir:
	cin >> opcion;

	if ((opcion) == "1" || (opcion) == "2" || (opcion) == "3" ||
		(opcion) == "4" || (opcion) == "5") {
		__asm {
			jmp validar

		}
	}
	else {
		cout << "Ingrese un valor correcto" << endl;
		__asm {
			jmp recibir
		}
	}

	validar:
	if (opcion == "1") { op = 1; }
	if (opcion == "2") { op = 2; }
	if (opcion == "3") { op = 3; }
	if (opcion == "4") { op = 4; }
	if (opcion == "5") { op = 5; }
	__asm {
		mov eax, op
		cmp eax,1
		je input
		cmp eax,2
		je input
		cmp eax,3
		je input
		cmp eax,4
		je input
		cmp eax,5
		je salir
	}


	input:
		__asm {
			mov eax, 0 // Limpio el contenido del EAX
		}
	//Se ingresan los valores de la matriz

	// Matriz A
	cout << "Valores Matriz A" << endl;
	for (int i = 0; i < 4;i++) {
		for (int j = 0; j < 4;j++) {
			cout << "Ingrese el valor en la fila: " << i + 1 << " columna: " << j + 1 << endl;
			cin >> entrada;
			matriza[i][j] = entrada;
		}
	}

	//Matriz B
	cout << "Valores Matriz B" << endl;
	for (int i = 0; i < 4;i++) {
		for (int j = 0; j < 4;j++) {
			cout << "Ingrese el valor en la fila: " << i + 1 << " columna: " << j + 1 << endl;
			cin >> entrada;
			matrizb[i][j] = entrada;
		}
	}


	//Suma de matrices
	if (op == 1) {
		cout << "El resultado de la operacion es: \n" << endl;
		int i = 0;
		int j = 0;
		int ciclo = 0;
		//limite de la matriz
			ciclo_suma:
				numA = matriza[i][j];
				numB = matrizb[i][j];
			__asm {
			
				mov eax, i
				cmp eax,4 // verifico el limite de la fila 
 				je fin
				
				push edx
				push ecx
				mov ecx, numA //asigno el valor de matriza[i][j]; en ecx 
				mov edx, numB //asigno el valor de matrizb[i][j]; en edx
				mov numA,0
				mov numB,0
				mov numA,ecx
				mov numB,edx
				pop ecx
				pop edx
				inc j
				mov eax,j
				cmp eax,4
				je cambio
				jl imprimir
				cambio: //Etiqueta
					mov j,0
					inc i
				
			}
			imprimir:
				cout << pSuma(numA, numB) << " ";
				if (i == 1 && j == 0) { cout << "" << endl; }
				if (i == 2 && j == 0) { cout << "" << endl; }
				if (i == 3 && j == 0) { cout << "" << endl; }
				__asm {
					mov eax,ciclo
					cmp eax,16
					jl ciclo_suma
					je fin
				}
			fin:
				__asm{
					nop
				}			
			//cambio
			
	}
	
	//Resta de matrices
	if (op == 2) {
		cout << "El resultado de la operacion es: \n" << endl;
		int i = 0;
		int j = 0;
		int ciclo = 0;
		//limite de la matriz
		ciclo_resta:
			numA = matriza[i][j];
			numB = matrizb[i][j];
			__asm {

				mov eax, i
				cmp eax, 4 // verifico el limite de la fila 
				je fin2

				push edx
				push ecx
				mov ecx, numA //asigno el valor de matriza[i][j]; en ecx 
				mov edx, numB //asigno el valor de matrizb[i][j]; en edx
				mov numA, 0
				mov numB, 0
				mov numA, ecx
				mov numB, edx
				pop ecx
				pop edx
				inc j
				mov eax, j
				cmp eax, 4
				je cambio2
				jl imprimir2
			cambio2 : //Etiqueta
				mov j, 0
				inc i

		}
		imprimir2:
			cout << pResta(numA, numB) << " ";
			if (i == 1 && j == 0) { cout << "" << endl; }
			if (i == 2 && j == 0) { cout << "" << endl; }
			if (i == 3 && j == 0) { cout << "" << endl; }
			__asm {
				mov eax, ciclo
				cmp eax, 16
				jl ciclo_resta
				je fin2
			}
		fin2:
			__asm {
				nop
			}
		//cambio

	}

	//Multiplicación de matrices
	if (op == 3) {
		cout << "El resultado de la operacion es: \n" << endl;
		int i = 0;
		int j = 0;
		int ciclo = 0;
		//limite de la matriz
		ciclo_mul:
			numA = matriza[i][j];
			numB = matrizb[i][j];
			__asm {

				mov eax, i
				cmp eax, 4 // verifico el limite de la fila 
				je fin3

				push edx
				push ecx
				mov ecx, numA //asigno el valor de matriza[i][j]; en ecx 
				mov edx, numB //asigno el valor de matrizb[i][j]; en edx
				mov numA, 0
				mov numB, 0
				mov numA, ecx
				mov numB, edx
				pop ecx
				pop edx
				inc j
				mov eax, j
				cmp eax, 4
				je cambio3
				jl imprimir3
			cambio3 : //Etiqueta
				mov j, 0
				inc i

		}
		imprimir3:
			cout << pMultiplicacion(numA, numB) << " ";
			if (i == 1 && j == 0) { cout << "" << endl; }
			if (i == 2 && j == 0) { cout << "" << endl; }
			if (i == 3 && j == 0) { cout << "" << endl; }
			__asm {
				mov eax, ciclo
				inc ciclo
				cmp eax, 16
				jl ciclo_mul
				je fin3
			}
		fin3:
			__asm {
				nop
			}
		//cambio

	}

	//División de matrices
	if (op == 4) {
		cout << "El resultado de la operacion es: \n" << endl;
		int i = 0;
		int j = 0;
		int ciclo = 0;
		//limite de la matriz
		ciclo_div:
			numA = matriza[i][j];
			numB = matrizb[i][j];
			__asm {

				mov eax, i
				cmp eax, 4 // verifico el limite de la fila 
				je fin4

				push edx
				push ecx
				mov ecx, numA //asigno el valor de matriza[i][j]; en ecx 
				mov edx, numB //asigno el valor de matrizb[i][j]; en edx
				mov numA, 0
				mov numB, 0
				mov numA, ecx
				mov numB, edx
				pop ecx
				pop edx
				inc j
				mov eax, j
				cmp eax, 4
				je cambio4
				jl imprimir4
			cambio4 : //Etiqueta
				mov j, 0
				inc i

		}
		imprimir4:
			cout << pDivision(numA, numB) << " ";
			if (i == 1 && j == 0) { cout << "" << endl; }
			if (i == 2 && j == 0) { cout << "" << endl; }
			if (i == 3 && j == 0) { cout << "" << endl; }
			__asm {
				mov eax, ciclo
				cmp eax, 16
				jl ciclo_div
				je fin4
			}
		fin4:
			__asm {
				nop
			}
		//cambio

	}
		//resultado operación
		
		system("PAUSE");
		
		salir: //Salir del programa
		return 0;
}