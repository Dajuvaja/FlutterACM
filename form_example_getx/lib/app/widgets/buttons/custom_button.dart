import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.buttonColor,
    required this.estado,
  });
  final void Function()? onPressed;
  final String label;
  final Color buttonColor;
  final bool? estado;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
        ),
        height: 50,
        width: Get.width - 40,
        child: Center(
          child: (estado == false)
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
