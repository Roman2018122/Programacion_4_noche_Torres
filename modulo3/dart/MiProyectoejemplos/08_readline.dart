import 'dart:io';

void main(){
  print('INgrese su nombre:');
  String? nombre = stdin.readLineSync();
  print('Hola, $nombre');

  print('INgrese un numero entero:');
  String? numero = stdin.readLineSync();
  print('El numero ingresado es: $numero');

  print('ingrese un decimal');
  double valor = double.parse(stdin.readLineSync()!);
  print('valor: $valor');
}