import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'dart:math' as math;

class Area extends StatefulWidget {
  Area({Key? key}) : super(key: key);

  @override
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<Area> {
  double radio = 0, base = 0, altura = 0, lado = 0;
  double resultadoCirculo = 0;
  double resultadoTriangulo = 0;
  double resultadoCuadrado = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: _easterEgg(),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'CÍRCULO',
              ),
              Tab(
                text: 'TRIÁNGULO',
              ),
              Tab(
                text: 'CUADRADO',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _tabCirculo(),
            _tabTriangulo(),
            _tabCuadrado(),
          ],
        ),
      ),
    );
  }

  Widget _tabCirculo() {
    return ListView(
      children: [
        Padding(
          child: SpinBox(
            min: 0,
            max: 100,
            value: 0,
            decimals: 1,
            step: 0.1,
            acceleration: 0.1,
            decoration: const InputDecoration(
              labelText: 'Radio',
              counterText: 'cm',
            ),
            onChanged: (valor) {
              setState(() {
                radio = valor;
                resultadoCirculo = _formulaCirculo(radio);
              });
            },
          ),
          padding: const EdgeInsets.all(16),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Text('El área del círculo es de',
                  style: TextStyle(fontSize: 18)),
              Text(_formatearDouble(resultadoCirculo) + ' cm\u00B2',
                  style: const TextStyle(fontSize: 48)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tabTriangulo() {
    return ListView(
      children: [
        Padding(
          child: SpinBox(
            min: 0,
            max: 200,
            value: 0,
            decimals: 1,
            step: 0.1,
            acceleration: 0.1,
            decoration: const InputDecoration(
              labelText: 'Base',
              counterText: 'cm',
            ),
            onChanged: (valor) {
              setState(() {
                base = valor;
                resultadoTriangulo = _formulaTriangulo(base, altura);
              });
            },
          ),
          padding: const EdgeInsets.all(16),
        ),
        Padding(
          child: SpinBox(
            min: 0,
            max: 200,
            value: 0,
            decimals: 1,
            step: 0.1,
            acceleration: 0.1,
            decoration: const InputDecoration(
              labelText: 'Altura',
              counterText: 'cm',
            ),
            onChanged: (valor) {
              setState(() {
                altura = valor;
                resultadoTriangulo = _formulaTriangulo(base, altura);
              });
            },
          ),
          padding: const EdgeInsets.all(16),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Text('El área del triángulo es de',
                  style: TextStyle(fontSize: 18)),
              Text(_formatearDouble(resultadoTriangulo) + ' cm\u00B2',
                  style: const TextStyle(fontSize: 48)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tabCuadrado() {
    return ListView(
      children: [
        Padding(
          child: SpinBox(
            min: 0,
            max: 200,
            value: 0,
            decimals: 1,
            step: 0.1,
            acceleration: 0.1,
            decoration: const InputDecoration(
              labelText: 'Lado',
              counterText: 'cm',
            ),
            onChanged: (valor) {
              setState(() {
                lado = valor;
                resultadoCuadrado = _formulaCuadrado(lado);
              });
            },
          ),
          padding: const EdgeInsets.all(16),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Text('El área del cuadrado es de',
                  style: TextStyle(fontSize: 18)),
              Text(_formatearDouble(resultadoCuadrado) + ' cm\u00B2',
                  style: const TextStyle(fontSize: 48)),
            ],
          ),
        ),
      ],
    );
  }

  String _formatearDouble(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  _formulaCirculo(r) => math.pi * r * r;
  _formulaTriangulo(b, h) => b * h / 2;
  _formulaCuadrado(l) => l * l;

  Widget _easterEgg() {
    return Row(
      children: const [
        Icon(Icons.circle_outlined),
        Icon(Icons.change_history_outlined),
        Icon(Icons.crop_square_sharp),
      ],
    );
  }
}
