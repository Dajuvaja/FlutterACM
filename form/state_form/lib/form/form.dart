import 'package:state_form/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _universityController = TextEditingController();
  final _majorController = TextEditingController();
  bool mostrarInformacionEnTexto = false;
  final User _user = User();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back(); // Esto regresará a la pantalla anterior
            },
          ),
          title: const Text('Formulario de Usuario'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Nombre'),
                            controller: _nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingresa tu nombre';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10), // Espacio entre los campos
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Apellidos'),
                            controller: _lastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingresa tus apellidos';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Correo'),
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa tu correo';
                        }
                        // Validación de formato de correo electrónico con RegExp
                        if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                          return 'Por favor, ingresa un correo válido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Fecha de Nacimiento'),
                      controller: _birthDateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa tu fecha de nacimiento';
                        }
                        // Validación de fecha de nacimiento (mayor de edad)
                        DateTime birthDate = DateTime.parse(value);
                        DateTime currentDate = DateTime.now();
                        if (currentDate.difference(birthDate).inDays <
                            365 * 18) {
                          return 'Debes ser mayor de edad para registrarte';
                        }
                        return null;
                      },
                      onTap: () async {
                        // Mostrar un Date Picker para seleccionar la fecha de nacimiento
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          _birthDateController.text =
                              selectedDate.toLocal().toString();
                        }
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Universidad donde estudia'),
                      controller: _universityController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa la universidad donde estudias';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Carrera'),
                      controller: _majorController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa tu carrera';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height:
                          25.0, // Puedes ajustar esta altura según tus necesidades
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _user.name = _nameController.text;
                              _user.lastName = _lastNameController.text;
                              _user.email = _emailController.text;
                              _user.birthDate =
                                  DateTime.parse(_birthDateController.text);
                              _user.university = _universityController.text;
                              _user.major = _majorController.text;
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Información del Usuario'),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Nombre: ${_user.name}'),
                                      Text('Apellidos: ${_user.lastName}'),
                                      Text('Correo: ${_user.email}'),
                                      Text(
                                          'Fecha de Nacimiento: ${_user.birthDate}'),
                                      Text('Universidad: ${_user.university}'),
                                      Text('Carrera: ${_user.major}'),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cerrar'),
                                    ),
                                  ],
                                ),
                              );
                              setState(() {
                                mostrarInformacionEnTexto =
                                    false; // Mostrar en AlertDialog
                              });
                            }
                          },
                          child: const Text('Mostrar información en pop-up'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _user.name = _nameController.text;
                              _user.lastName = _lastNameController.text;
                              _user.email = _emailController.text;
                              _user.birthDate =
                                  DateTime.parse(_birthDateController.text);
                              _user.university = _universityController.text;
                              _user.major = _majorController.text;
                              setState(() {
                                mostrarInformacionEnTexto =
                                    true; // Mostrar en formato de texto
                              });
                            }
                          },
                          child: const Text('Mostrar en Texto'),
                        ),
                      ],
                    ),
                    if (mostrarInformacionEnTexto)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Información del Usuario en Texto:'),
                          Text('Nombre: ${_user.name}'),
                          Text('Apellidos: ${_user.lastName}'),
                          Text('Correo: ${_user.email}'),
                          Text('Fecha de Nacimiento: ${_user.birthDate}'),
                          Text('Universidad: ${_user.university}'),
                          Text('Carrera: ${_user.major}'),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
