import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_example_getx/app/modules/register/controllers/register_controller.dart';
import 'package:form_example_getx/app/widgets/widgets.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
                    returnButton(),
                    title(),
                    const Spacer(),
                    inputs(),
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

  title() {
    return const Text(
      'Regístrate',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  inputs() {
    return Column(
      children: [
        NormalInput(
          textEditingController: controller.nameController,
          labelText: 'Nombre completo',
        ),
        const SizedBox(height: 20),
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

  loginButton() {
    return CustomButton(
      onPressed: controller.register,
      label: 'Registrarme',
    );
  }

  returnButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: Get.back,
        child: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            CupertinoIcons.chevron_back,
            size: 30,
          ),
        ),
      ),
    );
  }
}
