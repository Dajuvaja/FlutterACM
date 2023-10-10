import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.keyboardType,
    this.textCapitalization,
  });

  final TextEditingController textEditingController;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final obscureText = true.obs;
    showPassword() => obscureText.value = !obscureText.value;

    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: textEditingController,
          obscureText: obscureText.value,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: IconButton(
              onPressed: showPassword,
              icon: Icon(
                obscureText.value ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor, rellena este campo';
            }
            return null;
          },
        ),
      ),
    );
  }
}
