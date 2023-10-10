import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_example_getx/app/modules/login/controllers/login_controller.dart';
import 'package:form_example_getx/app/widgets/widgets.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const Spacer(),
                    title(),
                    const Spacer(),
                    inputs(),
                    noAccountLabel(),
                    const Spacer(flex: 2),
                    loginButton(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Título del Login
  title() {
    return const Text(
      'Inicia sesión',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  inputs() {
    return Column(
      children: [
        EmailInput(
          textEditingController: controller.emailController,
        ),
        const SizedBox(height: 20),
        PasswordInput(
          textEditingController: controller.passwordController,
          labelText: 'Contraseña',
        ),
      ],
    );
  }

  noAccountLabel() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '¿No tienes una cuenta?',
          style: TextStyle(
            color: Colors.blueAccent.withOpacity(0.8),
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' Regístrate',
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = controller.goToRegister,
            ),
          ],
        ),
      ),
    );
  }

  loginButton() {
    return CustomButton(
      onPressed: controller.login,
      label: 'Iniciar sesión',
    );
  }
}
