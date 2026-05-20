void saludar() {
  print('Hola mundo');
}
//funcion con parametros sin retorno

void saludoConParametro(String nombre){
  print('Hola $nombre'); 
}
//Funcion sin parametros y con retorno 
int  obtenerNUmero() {
  return 10;
}

//Funcion con parametros y con retorno
int sumar (int a, int b){
  return a + b;
}
//funcion flecha (arrow function)
int multiplicar (int a, int b) =>a*b;


//Funcion con parametros opcionales 

void saludarOpcional(String nombre, [String apellido = 'Sin apeliido']){
  print('Hola $nombre $apellido');
}
void main() {
  saludar();
  saludoConParametro('JOnathan ROman');
  int numero = obtenerNUmero();
  print(numero);
  print('el numero es: ${obtenerNUmero()}');
  print('La multiplicacion es: ${multiplicar(5, 6)}');  
  saludarOpcional('Jonathan', 'Torres');
  saludarOpcional('Jonathan');
} 