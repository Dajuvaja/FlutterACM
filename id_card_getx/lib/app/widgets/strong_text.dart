import 'package:flutter/cupertino.dart';

class StrongTextWidget extends StatelessWidget {
  const StrongTextWidget({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        '$label:',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
