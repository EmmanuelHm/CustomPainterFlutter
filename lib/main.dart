import 'package:flutter/material.dart';

// import 'package:custom_painter/src/pages/header_page.dart';
// import 'package:custom_painter/src/pages/animaciones_page.dart';
// import 'package:custom_painter/src/retos/cuadrado_animado_page.dart';
// import 'package:custom_painter/src/labs/circular_progress_page.dart';
// import 'package:custom_painter/src/pages/graficas_circulares_page.dart';
// import 'package:custom_painter/src/labs/slideshow_page.dart';
import 'package:custom_painter/src/pages/slideshow_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      // home: HeadersPage(),
      // home: AnimacionesPage(),
      // home: CuadradoAnimadoPage(),
      // home: GraficasCircularesPage(),
      // home: SlideShowPage(),
      home: SlideshowPage(),
    );
  }
}
