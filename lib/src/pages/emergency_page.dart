// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_painter/src/widgets/headers.dart';
import 'package:custom_painter/src/widgets/boton_gordo.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Condicion para tablets
    bool isLarge;
    if (MediaQuery.of(context).size.height > 550) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 250),
              child: BotonGordo(
                texto: item.texto,
                icon: item.icon,
                color1: item.color1,
                color2: item.color2,
                onPress: () {
                  print('HOLAAAA');
                },
                // onPress: ,
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: (isLarge) ? 220 : 10),
          child: SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                if (isLarge) SizedBox(height: 80),
                // BotonGordoTemp(),
                ...itemMap
              ],
            ),
          ),
        ),
        if (isLarge) _Encabezado()
      ]),
    );
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Medica',
          subtitulo: 'Haz Solicitado',
          color1: Color(0xff6989F5),
          color2: Color(0xff906EF5),
        ),
        Positioned(
          top: 45,
          right: 0,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.carBurst,
      texto: 'Motor Accident',
      color1: const Color(0xff6889F5),
      color2: const Color(0xff906EF5),
      onPress: () {
        print('Click');
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Haz Solicitado',
      subtitulo: 'Asistencia Médica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
