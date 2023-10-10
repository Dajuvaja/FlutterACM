import 'package:flutter/material.dart';

class NormalInput extends StatelessWidget {
  const NormalInput({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType ?? TextInputType.text,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(labelText: labelText),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, rellena este campo';
          }
          return null;
        },
      ),
    );
  }
}
