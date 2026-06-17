void main() {
  final propietario = 'Ana';
  final mantenimiento   = 28;

  // Interpolación con $ (igual que en Kotlin)
  print('Hola, $propietario');                    // Hola, Ana

  // Expresión con ${ }
  print('${propietario.toUpperCase()} tiene el mantenimiento${mantenimiento + 1} a los 200,000km');

  // String multilinea con triple comillas
  final recibo = '''
  Nombre: $propietario
  Edad:   $mantenimiento
  Mayor:  ${mantenimiento >= 18 ? 'Sí' : 'No'}
  ''';
  print(recibo);

  // Raw string — ignora el escape y la interpolación
  final ruta = r'C:\Users\Ana\Documents';  // el \ no se interpreta
  print(ruta);

  // Concatenación (menos idiomático — preferir interpolación)
  final saludo = 'Hola, ' + propietario+ '!';

  // Métodos útiles de String
  print('flutter'.toUpperCase());           // FLUTTER
  print('  Flutter  '.trim());              // Flutter
  print('Flutter'.contains('lut'));         // true
  print('Flutter'.replaceAll('t', 'T'));    // FluTTer
  print('a,b,c'.split(','));                // [a, b, c]
  print('Flutter'.substring(0, 4));         // Flut
  print('Flutter'.startsWith('Flu'));       // true
  print('abc'.padLeft(5, '0'));             // 00abc
}