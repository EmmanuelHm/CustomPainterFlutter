import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

// ----------------- Bordes Redondeados -----------------

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
    );
  }
}
// ----------------- Rotar un contenedor -----------------

// class HeaderDiagonal extends StatelessWidget {
//   const HeaderDiagonal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: -0.09,
//       child: Container(
//         height: 300,
//         width: double.infinity,
//         color: const Color(0xff615AAB),
//       ),
//     );
//   }
// }

// ----------------- Diaginal -----------------

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Crear el lapiz para pintar
    final lapiz = Paint(); //final paint

    // Propiedades lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill / .stroke
    lapiz.strokeWidth = 2;

    // Instancia de la ruta para dibujar
    final path = Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35); //Mover el lapiz sin pintar
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // Realizar el dibujo
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// ----------------- Triangular -----------------

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Crear el lapiz para pintar
    final lapiz = Paint();

    // Propiedades lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill / .stroke
    lapiz.strokeWidth = 2;

    // Instancia de la ruta para dibujar
    final path = Path();

    //Dibujar con el path y el lapiz

    // Pintar triangulo superior
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Pintar triangulo inferior
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    // Realizar el dibujo
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// ----------------- Pico -----------------

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Crear el lapiz para pintar
    final lapiz = Paint();

    // Propiedades lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill / .stroke
    lapiz.strokeWidth = 2;

    // Instancia de la ruta para dibujar
    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Realizar el dibujo
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// ----------------- Curvo -----------------

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Crear el lapiz para pintar
    final lapiz = Paint();

    // Propiedades lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill / .stroke
    lapiz.strokeWidth = 20;

    // Instancia de la ruta para dibujar
    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    // Curvatura
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.45, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);

    // Realizar el dibujo
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// ----------------- Wave (Ola) -----------------

class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Crear el lapiz para pintar
    final lapiz = Paint();

    // Propiedades lapiz
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .fill / .stroke
    lapiz.strokeWidth = 20;

    // Instancia de la ruta para dibujar
    final path = Path();

    //Dibujar con el path y el lapiz

    // Ola Arriba
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Ola Abajo
    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.65,
    //     size.width * 0.50, size.height * 0.75);
    // path.quadraticBezierTo(
    //     size.width * 0.75, size.height * 0.85, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height);

    // Realizar el dibujo
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// ----------------- Gradiente -----------------

class HeaderWaveGradiente extends StatelessWidget {
  const HeaderWaveGradiente({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientePainter(),
      ),
    );
  }
}

class _HeaderWaveGradientePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(165.0, 55.0),
      radius: 180,
    );

    // Crear gradiente
    const Gradient gradiente = LinearGradient(
      // begin: Alignment.topCenter
      // end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      // stops: [
      //   0.2,
      //   0.5,
      //   1.0,
      // ]
    );

    // Crear el lapiz para pintar
    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades lapiz
    // lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill / .stroke
    lapiz.strokeWidth = 20;

    // Instancia de la ruta para dibujar
    final path = Path();

    //Dibujar con el path y el lapiz

    // Ola Arriba
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Realizar el dibujo
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
