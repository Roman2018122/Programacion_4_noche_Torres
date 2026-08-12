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

//Funcion con parametros nombrados
void registroUsuario({
  required String nombre,
  required int edad,
}){
  print("Hola $nombre, $edad");
}


// Con tipo explícito — recomendado
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';


void main() {
  saludar();
  saludoConParametro('JOnathan ROman');
  int numero = obtenerNUmero();
  print(numero);
  print('el numero es: ${obtenerNUmero()}');
  print('La multiplicacion es: ${multiplicar(5, 6)}');  
  saludarOpcional('Jonathan', 'Torres');
  saludarOpcional('Jonathan');
  registroCliente(
    nombre: 'ana',
    edad: 22
  );
  print(formatearPrecio(1299.9)); //$1299.90
  print(formatearPrecioSinTipo(1299.9)); //1299.90
} 

