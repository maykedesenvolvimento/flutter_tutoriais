import 'package:flutter/material.dart';

class IconeAnimado extends StatefulWidget {
  const IconeAnimado({super.key});

  @override
  State<IconeAnimado> createState() => _IconeAnimadoState();
}

class _IconeAnimadoState extends State<IconeAnimado>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  double valorSlider = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ícone animado'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              controller.isCompleted
                  ? controller.reverse()
                  : controller.forward();
            },
            child: AnimatedIcon(
              size: 250,
              color: Colors.orange,
              icon: AnimatedIcons.arrow_menu,
              progress: CurvedAnimation(
                parent: controller,
                curve: Curves.linear,
              ),
            ),
          ),
          Text(
            'Duração da transição: ${controller.duration!.inMilliseconds} ms',
            style: const TextStyle(fontSize: 20),
          ),
          Slider(
            value: valorSlider,
            onChanged: ((value) {
              setState(() {
                valorSlider = value;
                controller.duration = Duration(
                  milliseconds: (1000 * value).toInt(),
                );
              });
            }),
          ),
        ],
      ),
    );
  }
}
