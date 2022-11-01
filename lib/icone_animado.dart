import 'package:flutter/material.dart';

class IconeAnimado extends StatefulWidget {
  const IconeAnimado({super.key});

  @override
  State<IconeAnimado> createState() => _IconeAnimadoState();
}

class _IconeAnimadoState extends State<IconeAnimado>
    with TickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  double valorSlider = 0.5;
  Duration get duracao => Duration(milliseconds: (valorSlider * 1000).toInt());

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
                controller.status == AnimationStatus.completed
                    ? controller.reverse()
                    : controller.forward();
              },
              child: AnimatedIcon(
                size: 250,
                color: Colors.orange,
                icon: AnimatedIcons.play_pause,
                progress: CurvedAnimation(
                  curve: Curves.linear,
                  parent: controller,
                ),
              ),
            ),
            Text(
              'Duração da transição: ${duracao.inMilliseconds} ms',
              style: const TextStyle(fontSize: 20),
            ),
            Slider(
              value: valorSlider,
              onChanged: (val) {
                setState(() {
                  valorSlider = val;
                  controller.duration = duracao;
                  controller.reverseDuration = duracao;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
