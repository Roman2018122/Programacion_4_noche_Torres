  import 'dart:io';
void main(){
  print('Control de operaciones diarias en un aeropuerto ');

  int cantidad_vuelos_atendidos = 0;
  int minutos_retraso_acumulados = 0;
  int total_pasajeros_procesados = 0;
  int cantidad_agentes_registrados = 0;

  double promedio_pasajeros_agente = 0;
  double promedio_general_retraso = 0;

  while (true){
  print('Cantidad de vuelos atendido (0) para salir');
  int cantidad_vuelos = int.parse(stdin.readLineSync()!);
 
  if (cantidad_vuelos == 0){
    print("Programa finalizado");
    break;
  }
  cantidad_agentes_registrados+= 1;
  cantidad_vuelos_atendidos += cantidad_vuelos;


  print('ingrese cantidad de pasajeros procesados ');
  int cantidad_pasajeros = int.parse(stdin.readLineSync()!);
  total_pasajeros_procesados += cantidad_pasajeros; 

  double pasajeros_por_vuelo = cantidad_pasajeros/cantidad_vuelos;
    print('pasajeros de vuelo: $pasajeros_por_vuelo');
  
  

  
  
  if (pasajeros_por_vuelo < 50){
    print('Baja Eficiencia');
    
  }else if (pasajeros_por_vuelo >= 50 &&
               pasajeros_por_vuelo <= 120) {
    print('Eficiencia normal');

  }else{
    print('Alta eficiencia');
  }

  print('Ingrese el numero de minutos de retraso');
  int minutos_retraso = int.parse(stdin.readLineSync()!);

  minutos_retraso_acumulados += minutos_retraso;



  if (cantidad_agentes_registrados > 0) {
    promedio_pasajeros_agente = total_pasajeros_procesados / cantidad_agentes_registrados;

  }

  if (cantidad_vuelos_atendidos > 0){
    promedio_general_retraso = minutos_retraso_acumulados/ cantidad_vuelos_atendidos;
  }

  


  }

print('Total de pasajeros procesados:  '
          '$total_pasajeros_procesados');

print('Total minutos de retraso acomulados: '
          '$minutos_retraso_acumulados');

print('cantidad de agentes registrados: '
          '$cantidad_agentes_registrados');

print('promedio pasajeros por agente: '
          '$promedio_pasajeros_agente');

print('promedio general de retraso por vuelo'
          '$promedio_general_retraso');
        
}

