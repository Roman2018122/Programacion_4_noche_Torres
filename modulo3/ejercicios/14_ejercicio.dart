  import 'dart:io';
void main(){
  print('calculo de produccion de tablas ');

  var tablas_cortadas = 0;
  var operarios = 0;
  var promedio_operarios_tablad = 0;
  

  while (true){

  print('ingrese la cantidad de tablas cortadas (0) para salir');
  int entrada = int.parse(stdin.readLineSync()!);
  tablas_cortadas += 1;

    if (entrada == 0){
    print("Programa finalizado");
    break;
    
    }else if (entrada <= 15){
    print('trabajo lento');

    }else if (entrada <=40){
    print('trabajo eficiente ');

    }else{

    print('trabajo sobresaliente ');
    }
  operarios += entrada;
  promedio_operarios_tablad = tablas_cortadas ~/ operarios;

  }
  print('promedio tablas por trabajador  $promedio_operarios_tablad');
  print('tablas_cortadas $tablas_cortadas');
  print('cantidad de operarios  $operarios');
}