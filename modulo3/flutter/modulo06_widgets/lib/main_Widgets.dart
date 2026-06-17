// lib/main.dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(body: Center(child: SizedBox(width: double.infinity,child: SizedBox(width: double.infinity, child: Saludo()),))),
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    
  // Describe cómo se ve el widget
  return const SelectableText(
    'Hay una historia? Si hay una historia empieza hace tres años. En abril de 1976, cuando se publica el primer libro, él me manda una carta. Con la carta viene una foto donde me tiene en brazos: desnudo, estoy sonriendo, tengo tres meses y parezco una rana. A él, en cambio, se lo ve favorecido en esa fotografía: traje cruzado, sombrero de ala fina, la sonrisa campechana: un hombre de treinta años que mira al mundo de frente. Al fondo, borrosa y casi fuera de foco, aparece mi madre, tan joven que al principio me costó reconocerla.',
    style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: 4,
      color: Colors.teal,
      shadows:  [
        Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))
      ]
    ),
    //overflow: TextOverflow.ellipsis,
    maxLines: 5,

  );
  }
}