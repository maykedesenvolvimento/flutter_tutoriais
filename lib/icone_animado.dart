import 'package:flutter/material.dart';

class IconeAnimado extends StatefulWidget {
  const IconeAnimado({super.key});

  @override
  State<IconeAnimado> createState() => _IconeAnimadoState();
}

class _IconeAnimadoState extends State<IconeAnimado>
    with TickerProviderStateMixin {
  bool clicado = false;

  double duracao = 0.5;
  int get duracaoMilisegundos => (duracao * 1000).toInt();

  late AnimationController controller = AnimationController(
    duration: Duration(milliseconds: duracaoMilisegundos),
    reverseDuration: Duration(milliseconds: duracaoMilisegundos),
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ícone animado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                clicado = !clicado;
                if (clicado) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
              child: AnimatedIcon(
                size: 250,
                color: Colors.orange,
                icon: AnimatedIcons.pause_play,
                progress: CurvedAnimation(
                  curve: Curves.linear,
                  parent: controller,
                ),
              ),
            ),
            const Text('Duração da animação:'),
            Text('$duracaoMilisegundos milisegundos'),
            Slider(
              onChanged: (double value) {
                setState(() {
                  duracao = value;
                  controller.reverseDuration = controller.duration =
                      controller.reverseDuration =
                          Duration(milliseconds: duracaoMilisegundos);
                });
              },
              value: duracao,
            ),
          ],
        ),
      ),
    );
  }
}
