import 'package:custom_painter/src/theme/theme.dart';
import 'package:custom_painter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme!.accentColor;

    return Scaffold(
      // body: HeaderCuadrado(),
      // body: HeaderBordesRedondeados(),
      // body: HeaderDiagonal(),
      // body: HeaderTriangular(),
      // body: HeaderPico(),
      // body: HeaderCurvo(),
      // body: HeaderWaveGradiente(),
      body: HeaderWave(
        color: accentColor,
      ),
    );
  }
}
