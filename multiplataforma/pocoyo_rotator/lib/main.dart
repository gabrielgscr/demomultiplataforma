import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rotación infinita y lenta'),
        ),
        body: const Center(
          child: RotatingImage(),
        ),
      ),
    );
  }
}

class RotatingImage extends StatefulWidget {
  const RotatingImage({super.key});

  @override
  RotatingImageState createState() => RotatingImageState();
}

class RotatingImageState extends State<RotatingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Inicializa el AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Duración de una vuelta completa
    )..repeat(); // Hace que la animación se repita infinitamente
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Asegúrate de liberar los recursos cuando se destruye el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Image.asset(
        "assets/pocoyo.png",
        scale: 4,
      ), // Coloca tu imagen aquí
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi, // Rotación continua
          child: child,
        );
      },
    );
  }
}
