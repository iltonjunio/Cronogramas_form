import 'package:flutter/material.dart';
import 'package:flutter_application_1/pagina.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _turmaController = TextEditingController();
  final TextEditingController _unidadeController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedStatus;

  List<String> _statusOptions = ['Pendente', 'Ministrada', 'Cancelada'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      _selectedDate != null
                          ? 'Data da Aula: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                          : 'Selecionar Data',
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedStatus = newValue;
                      });
                    },
                    items: _statusOptions.map((status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Status da Aula',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _turmaController,
                    decoration: const InputDecoration(
                      labelText: 'Turma',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _unidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Unidade',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint('Aula cadastrada com sucesso!');
                        Fluttertoast.showToast(
                          msg: 'Aula cadastrada com sucesso',
                          gravity: ToastGravity.CENTER_LEFT,
                          backgroundColor: Colors.blue,
                        );
                      } Navigator.pushNamed(context, '/perfil');
                    },
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
