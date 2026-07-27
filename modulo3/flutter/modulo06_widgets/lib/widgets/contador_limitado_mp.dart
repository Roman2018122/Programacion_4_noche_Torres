import 'package:flutter/material.dart';

class ContadorLimitadoMp extends StatefulWidget {
  final String etiqueta;
  final int limite;
  final Color color;
  final VoidCallback? onLimite;

  const ContadorLimitadoMp({
    super.key,
    required this.etiqueta,
    this.limite = 10,
    this.color = Colors.indigo,
    this.onLimite,
  });

  @override
  State<ContadorLimitadoMp> createState() => _ContadorLimitadoMpState();
}

class _ContadorLimitadoMpState extends State<ContadorLimitadoMp> {
  int _valor = 0;

  void _incrementar() {
    if (_valor >= widget.limite) return;

    setState(() => _valor++);

    if (_valor == widget.limite) {
      widget.onLimite?.call();
    }
  }

  void _reiniciar() {
    setState(() {
      _valor = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _valor >= widget.limite;
    final progreso = _valor / widget.limite;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.car_repair, size: 44, color: widget.color),
        const SizedBox(height: 8),

        Text(
          widget.etiqueta,
          style: TextStyle(
            color: widget.color,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),

        SizedBox(
          width: 280,
          child: LinearProgressIndicator(
            value: progreso,
            color: enLimite ? Colors.red : widget.color,
            backgroundColor: widget.color.withOpacity(0.15),
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          '$_valor / ${widget.limite}',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: enLimite ? Colors.red : widget.color,
          ),
        ),
        const SizedBox(height: 8),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: enLimite ? null : _incrementar,
              icon: const Icon(Icons.add),
              label: const Text('Registrar vehículo'),
            ),
            const SizedBox(width: 8),
            TextButton.icon(
              onPressed: _reiniciar,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Reiniciar'),
            ),
          ],
        ),

        if (enLimite) ...[
          const SizedBox(height: 8),
          Text(
            'Capacidad máxima alcanzada',
            style: TextStyle(
              fontSize: 12,
              color: Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
}
