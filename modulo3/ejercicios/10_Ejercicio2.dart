import 'dart:io';

void main() {

  print('Ingrese un numero entero:');
  String? entrada = stdin.readLineSync();
  int numero = int.parse(entrada!);

  print('El numero ingresado es: $numero');
  if (numero < 0) {
    print('Numero negativo');
  } else if (numero == 0) {
    print('El numero es cero');
  } else {
    print('Numero positivo');
  }

}