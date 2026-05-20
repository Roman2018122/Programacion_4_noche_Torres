import 'dart:io';

void main(){

  print('INgrese un numero entero:');
  String? numero = stdin.readLineSync();
  print('El numero ingresado es: $numero');

  if (numero <  0)
    print('NUmero negativo');
  else if (numero == '0')
    print('El numero es cero');
  else
    print('Numero positivo');
  
}