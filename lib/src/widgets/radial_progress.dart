import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final porcentaje;
  final Color? colorPrimario;
  final Color? colorSecundario;
  final double? grosorPrimario;
  final double? grosorSecundario;
  // Constructor
  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.grosorPrimario = 10,
    this.grosorSecundario = 4,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  // Crear el controlador de la animacion
  late AnimationController controller;

  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * controller.value),
              widget.colorPrimario!,
              widget.colorSecundario!,
              widget.grosorPrimario!,
              widget.grosorSecundario!,
            ),
          ),
        );
      },
    );
  }
}

// ----------------------------------

class _MiRadialProgress extends CustomPainter {
  // ignore: prefer_typing_uninitialized_variables
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  // Constructor
  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // Rect para gradiente
    final Rect rect = Rect.fromCircle(
      center: const Offset(0, 0),
      radius: 180,
    );

    // Definir Gradiente
    // ignore: prefer_const_declarations
    final Gradient gradiente = const LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6D0558),
        Colors.red,
      ],
    );

    //---------------Circulo completo

    //Creando el lapíz
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    //Definir el centro
    final center = Offset(size.width * 0.5, size.height / 2);

    //Dibujar el radio
    final radio = min(size.width * 0.5, size.height * 0.5);

    //Pintar en pantalla
    canvas.drawCircle(center, radio, paint);

    //---------------Arco

    //Creando el lapíz (Color normal)
    // final paintArco = Paint()
    //   ..strokeWidth = grosorPrimario
    //   ..color = colorPrimario
    //   ..strokeCap = StrokeCap.round //Redondear el los extremos del arco
    //   ..style = PaintingStyle.stroke;

    //Creando el lapíz (Gradiente)
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round //Redondear el los extremos del arco
      ..style = PaintingStyle.stroke;

    //Parte que de debera ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
