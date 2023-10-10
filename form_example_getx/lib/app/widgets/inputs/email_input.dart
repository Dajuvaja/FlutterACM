import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'Correo electrónico',
          hintText: 'Ingresa tu correo electrónico',
        ),
        validator: (value) {
          if (!GetUtils.isEmail(value!)) {
            return 'Por favor, ingresa un correo electrónico válido';
          } else if (value.isEmpty) {
            return 'Por favor, rellena este campo';
          }
          return null;
        },
      ),
    );
  }
}
