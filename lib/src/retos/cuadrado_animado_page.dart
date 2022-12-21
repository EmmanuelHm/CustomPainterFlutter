import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    moverDerecha = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );

    moverArriba = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut),
      ),
    );

    moverIzquierda = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut),
      ),
    );

    moverAbajo = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.reset();
        // controller.reverse();
        controller.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Iniciar animacion
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value - moverIzquierda.value,
              moverArriba.value - moverAbajo.value),
          child: const _Rectangulo(),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
