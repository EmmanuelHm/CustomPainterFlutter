import 'package:custom_painter/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: HeaderCuadrado(),
      // body: HeaderBordesRedondeados(),
      // body: HeaderDiagonal(),
      // body: HeaderTriangular(),
      // body: HeaderPico(),
      // body: HeaderCurvo(),
      body: HeaderWaveGradiente(),
    );
  }
}
