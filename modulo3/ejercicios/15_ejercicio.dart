  import 'dart:io';
void main(){
  print('cantidad de pacientes atendidos ');

  int pacientes_atendidos_total = 0;
  int doctores_cantidad = 0;
  double promedio_pacientes_xdoc = 0;
  

  while (true){

  print('ingrese de horas trabajadas (0) para salir');
  int horas_trabajadas = int.parse(stdin.readLineSync()!);

  if (horas_trabajadas == 0){
    print("Programa finalizado");
    break;
  }

  doctores_cantidad += 1;
  print('ingrese la cantidad de pacientes atendidos (0) para salir');
  int cantidad_pacientes = int.parse(stdin.readLineSync()!);

  pacientes_atendidos_total += cantidad_pacientes; 

  double pacientesPorHora = pacientes_atendidos_total / horas_trabajadas;
    print('Pacientes por hora: $pacientesPorHora');
  
  if (pacientesPorHora < 3){
    print('Atencion lenta');
    
  }else if (pacientesPorHora >= 3 &&
               pacientesPorHora <= 6) {
    print('Atencion normal');

  }else{
    print('Atencion rapida ');
  }

  
  
  if (doctores_cantidad > 0) {

  promedio_pacientes_xdoc =
        pacientes_atendidos_total / doctores_cantidad; 
  
  }
  print('Total de pacientes atendidos: '
          '$pacientes_atendidos_total');

    print('Cantidad de doctores registrados: '
          '$doctores_cantidad');

    print('Promedio pacientes por doctor: '
          '$promedio_pacientes_xdoc');
  }
        
}


