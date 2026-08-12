import 'dart:async';
import 'package:flutter/material.dart';

class RelojMp extends StatefulWidget {
  const RelojMp({super.key});

  @override
  State<RelojMp> createState() => _RelojMpState();
}

class _RelojMpState extends State<RelojMp> {
  Timer? _timer;
  int _segundos = 0;
  bool _pausado = false;
  int _etapas = 0;
  final List<int> _tiemposEtapa = [];

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;

      setState(() {
        _segundos++;
      });
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;

      if (_pausado) {
        _timer?.cancel();
      } else {
        _iniciarTimer();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formato {
    final h = _segundos ~/ 3600;
    final m = (_segundos % 3600) ~/ 60;
    final s = _segundos % 60;

    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Color get _colorTiempo {
    if (_segundos > 120) return Colors.deepPurple;
    if (_segundos > 60) return Colors.red;
    if (_segundos > 30) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.car_repair, size: 70, color: Colors.blueGrey),
        const SizedBox(height: 12),
        const Text(
          'Tiempo del servicio mecánico',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          _formato,
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: _colorTiempo,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon: Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Continuar servicio' : 'Pausar servicio'),
            ),
            const SizedBox(width: 8),
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  _timer?.cancel();
                  _segundos = 0;
                  _pausado = false;
                  _etapas = 0;
                  _tiemposEtapa.clear();
                  _iniciarTimer();
                });
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text('Reiniciar'),
            ),
            const SizedBox(width: 8),
            FilledButton.icon(
              onPressed: _pausado
                  ? null
                  : () {
                      setState(() {
                        _etapas++;
                        _tiemposEtapa.add(_segundos);
                      });
                    },
              icon: const Icon(Icons.build),
              label: const Text('Registrar etapa'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _pausado ? 'Servicio pausado' : 'Servicio en proceso',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        if (_tiemposEtapa.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            'Última etapa: ${_tiemposEtapa.last} segundos',
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 4),
          Text(
            'Etapas registradas: $_etapas',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ],
    );
  }
}
