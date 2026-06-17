//ingrese un numero y genera la tabla de multiplicar de ese numero 
import 'dart:io';
void main(){

  print('INgrese un numero entero:');
  String? numero = stdin.readLineSync();
  print('El numero ingresado es: $numero');

  for (int i = 1; i <= 10; i++) {
    int resultado = int.parse(numero!) * i;
    print('$numero x $i = $resultado');
  }


}

