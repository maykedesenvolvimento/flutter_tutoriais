import 'package:flutter/material.dart';

class ContainerAnimado extends StatefulWidget {
  const ContainerAnimado({super.key});

  @override
  State<ContainerAnimado> createState() => _ContainerAnimadoState();
}

class _ContainerAnimadoState extends State<ContainerAnimado> {
  bool clicado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container animado'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              clicado = !clicado;
            });
          },
          child: AnimatedContainer(
            width: clicado ? 100 : 200,
            height: clicado ? 200 : 100,
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
            decoration: BoxDecoration(
              borderRadius: clicado
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(0),
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
