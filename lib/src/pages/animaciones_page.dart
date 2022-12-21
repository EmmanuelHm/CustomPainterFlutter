import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  // InitState (cuando se crea el widget)
  @override
  void initState() {
    //Definicion del tipo de controlador
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    //Definir la animacion de rotación
    // rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    //Crear opacidad
    // opacidad = Tween(begin: 0.1, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: controller,
    //     curve: Curves.easeOut,
    //   ),
    // );

    //Opacidad con intervalo de tiempo diferente
    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut),
        // curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );

    opacidadOut = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );

    // Mover hacia la derecha
    // moverDerecha = Tween(begin: 0.0, end: 200.0).animate(controller);
    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    // Agrandar
    // agrandar = Tween(begin: 0.0, end: 2.0).animate(controller);
    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    controller.addListener(() {
      // print('Status: ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        // controller.repeat();
        // controller.reverse();
        controller.reset();
      }
    });

    super.initState();
  }

  // Dispose (Al eliminar el widget)
  @override
  void dispose() {
    controller.dispose(); //Detener el controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play / Reproduccion
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      // child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        // print('Opacidad: ${opacidad.status}');
        // print('Rotación: ${rotacion.status}');

        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: const _Rectangulo(),
              ),
            ),
          ),
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
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
