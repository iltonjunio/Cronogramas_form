import 'package:flutter/material.dart' show AppBar, BuildContext, Center, Colors, Container, EdgeInsets, ListView, Scaffold, State, StatefulWidget, Text, Widget;

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final List<String> _list = ['Aula 1', ' Aula 2', ' Aula 3 '];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Aulas"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _list.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.indigoAccent,
                  child: Center(child: Text(' ${_list[index]}')),
                );
              }),
        ),
      ),
    );
  }
}
