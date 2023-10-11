import 'package:flutter/material.dart';
import 'package:form_example_getx/app/routes/app_pages.dart';
import 'package:form_example_getx/app/services/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoadingRx = true.obs;

  login() async {
    if (formKey.currentState!.validate()) {
      await auth
          .signIn(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        // ignore: avoid_print
        print(value);
        if (value is String) {
          GetSnackBar(
            title: 'Error',
            message: value,
            duration: const Duration(seconds: 3),
          );
          // ignore: avoid_print
          print('Algo falló');
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      });
    }
  }

  goToRegister() => Get.toNamed(Routes.REGISTER);
  login2(String email, String password) {}
}
