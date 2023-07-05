import 'package:flutter/material.dart';
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
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Pagina(),
    );
  }
}


