import 'package:flutter/material.dart';
import 'package:form_example_getx/app/routes/app_pages.dart';
import 'package:form_example_getx/app/services/services.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  register() async {
    if (formKey.currentState!.validate()) {
      await auth
          .signUp(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        print(value);
        if (value is String) {
          GetSnackBar(
            title: 'Error',
            message: value,
            duration: const Duration(seconds: 3),
          );
          print('Algo falló');
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      });
    }
  }
}
