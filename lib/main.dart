import 'package:flutter/material.dart';
import 'icone_animado.dart';

void main() {
  runApp(const Aplicacao());
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutoriais',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const IconeAnimado(),
    );
  }
}
