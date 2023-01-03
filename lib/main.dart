import 'package:custom_painter/src/models/layout_model.dart';
import 'package:custom_painter/src/pages/launcher_tablet_page.dart';
import 'package:custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:custom_painter/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

// void main() => runApp(
//       MultiProvider(
//         providers: [
//           Provider(create: (_) => ThemeChanger(2)),
//           Provider(create: (_) => LayoutModel()),
//         ],
//         // ignore: prefer_const_constructors
//         child: MyApp(),
//       ),
//     );

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => LayoutModel(),
        child: ChangeNotifierProvider(
          create: (_) => ThemeChanger(2),
          child: MyApp(),
        ),
      ),
    );

// void main() => runApp(
//       ChangeNotifierProvider(
//         create: (_) => ThemeChanger(2),
//         child: MyApp(),
//       ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      // theme: ThemeData.dark(),
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientation: $orientation');

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }

          // return Container(
          //   child: LauncherPage(),
          // );
        },
      ),
    );
  }
}
