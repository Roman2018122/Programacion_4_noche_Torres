import 'dart:io';
void main(){
  print('calculo de minutos por dia');

  var total_minutos = 0;
  var clientes_registrados = 0;
  var promedio_cliente_min = 0;
  

  while (true){

  print('ingrese la cantidad de minutos de entrenamiento (0) para salir');
  int entrada = int.parse(stdin.readLineSync()!);
  clientes_registrados += 1;
    if (entrada == 0){
    print("Programa finalizado");
    break;
    
    }else if (entrada <=30){
    print('Entrenamiento insuficiente');

    }else if (entrada <=90){
    print('Entrenamiento adecuado');

    }else{

    print('entrenamiento intenso ');
    }
  total_minutos += entrada;
  promedio_cliente_min = total_minutos ~/ clientes_registrados;

  }
  print('total minutos $total_minutos');
  print('promedio minutos clientes $promedio_cliente_min');
  print('clientes registrados$clientes_registrados');
} 
