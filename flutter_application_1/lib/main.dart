import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cadastro.dart';
import 'package:flutter_application_1/loguin.dart';
import 'package:flutter_application_1/pagina.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Aulas',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: generateMaterialColor(Palette.primary),
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        '/cadastro': (context) => const MyHomePage( title: 'cadastro,',),
        '/pagina': (context) => const Pagina(),
        '/login': (context) => const Login(),
      },
    );
  }
}
final ThemeData customTheme =
    ThemeData(primarySwatch: generateMaterialColor(Palette.primary));

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

class Palette {
  // Your hexadecimal color code
  static const Color primary = Color(0xFF004A8D);
}
