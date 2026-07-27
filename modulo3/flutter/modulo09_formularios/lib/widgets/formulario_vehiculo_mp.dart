import 'package:flutter/material.dart';

class FormularioVehiculoMp extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;

  const FormularioVehiculoMp({super.key, required this.onGuardar});

  @override
  State<FormularioVehiculoMp> createState() => _FormularioVehiculoMpState();
}

class _FormularioVehiculoMpState extends State<FormularioVehiculoMp> {
  final _formKey = GlobalKey<FormState>();

  final _ctrlPlaca = TextEditingController();
  final _ctrlMarca = TextEditingController();
  final _ctrlModelo = TextEditingController();
  final _ctrlAnio = TextEditingController();
  final _ctrlCliente = TextEditingController();

  final _focusMarca = FocusNode();
  final _focusModelo = FocusNode();
  final _focusAnio = FocusNode();
  final _focusCliente = FocusNode();

  String _combustible = 'Gasolina';
  bool _activo = true;

  static final _regexPlaca = RegExp(r'^[A-Za-z]{3}-\d{3,4}$');

  @override
  void dispose() {
    _ctrlPlaca.dispose();
    _ctrlMarca.dispose();
    _ctrlModelo.dispose();
    _ctrlAnio.dispose();
    _ctrlCliente.dispose();
    _focusMarca.dispose();
    _focusModelo.dispose();
    _focusAnio.dispose();
    _focusCliente.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    widget.onGuardar({
      'placa': _ctrlPlaca.text.toUpperCase(),
      'marca': _ctrlMarca.text,
      'modelo': _ctrlModelo.text,
      'anio': _ctrlAnio.text,
      'cliente': _ctrlCliente.text,
      'combustible': _combustible,
      'activo': _activo.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _ctrlPlaca,
            decoration: const InputDecoration(
              labelText: 'Placa del vehículo',
              hintText: 'GUA-1234',
              prefixIcon: Icon(Icons.pin),
              border: OutlineInputBorder(),
            ),
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusMarca.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'La placa es obligatoria';
              }

              if (!_regexPlaca.hasMatch(v.trim())) {
                return 'Formato inválido, ejemplo: GUA-1234';
              }

              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlMarca,
            focusNode: _focusMarca,
            decoration: const InputDecoration(
              labelText: 'Marca',
              hintText: 'Toyota',
              prefixIcon: Icon(Icons.directions_car),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusModelo.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'La marca es obligatoria';
              }

              if (v.trim().length < 2) {
                return 'Mínimo 2 caracteres';
              }

              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlModelo,
            focusNode: _focusModelo,
            decoration: const InputDecoration(
              labelText: 'Modelo',
              hintText: 'Corolla',
              prefixIcon: Icon(Icons.car_repair),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusAnio.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'El modelo es obligatorio';
              }

              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlAnio,
            focusNode: _focusAnio,
            decoration: const InputDecoration(
              labelText: 'Año',
              hintText: '2020',
              prefixIcon: Icon(Icons.calendar_month),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusCliente.requestFocus(),
            validator: (v) {
              final anio = int.tryParse(v ?? '');

              if (anio == null) {
                return 'El año debe ser un número';
              }

              if (anio < 1900 || anio > DateTime.now().year + 1) {
                return 'Ingrese un año válido';
              }

              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlCliente,
            focusNode: _focusCliente,
            decoration: const InputDecoration(
              labelText: 'Propietario',
              hintText: 'Carlos Mendoza',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'El propietario es obligatorio';
              }

              return null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _combustible,
            decoration: const InputDecoration(
              labelText: 'Combustible',
              prefixIcon: Icon(Icons.local_gas_station),
              border: OutlineInputBorder(),
            ),
            items: ['Gasolina', 'Diésel', 'Eléctrico', 'Híbrido', 'Gas']
                .map(
                  (combustible) => DropdownMenuItem(
                    value: combustible,
                    child: Text(combustible),
                  ),
                )
                .toList(),
            onChanged: (v) {
              setState(() {
                _combustible = v!;
              });
            },
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Vehículo activo'),
            subtitle: const Text(
              'El vehículo se encuentra registrado en el taller',
            ),
            value: _activo,
            onChanged: (v) {
              setState(() {
                _activo = v;
              });
            },
            secondary: const Icon(Icons.build),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                  },
                  child: const Text('Limpiar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar vehículo'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
