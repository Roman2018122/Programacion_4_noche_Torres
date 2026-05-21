import 'dart:io';
void main(){
  print('calculo de produccion de muebles');

  var muebles_fabricados = 0;
  var cantidad_trabajadores = 0;
  var promedio_muebles = 0;
  

  while (true){

  print('ingrese la cantidad de muebles fabricados (0) para salir');
  int entrada = int.parse(stdin.readLineSync()!);
  cantidad_trabajadores += 1;

    if (entrada == 0){
    print("Programa finalizado");
    break;
    
    }else if (entrada <=3){
    print('produccion baja');

    }else if (entrada <=7){
    print('Produccion normal');

    }else{

    print('produccion alta  ');
    }
  muebles_fabricados += entrada;
  promedio_muebles = muebles_fabricados ~/ cantidad_trabajadores;

  }
  print('promedio por trabajador $promedio_muebles');
  print('muebles fabricados $muebles_fabricados');
  print('cantidad trabajadores $cantidad_trabajadores');
}