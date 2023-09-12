import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:id_card_getx/app/widgets/custom_button.dart';
import 'package:id_card_getx/app/widgets/strong_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final String name = 'Daniel Vargas';
  final int age = 21;
  final String nacionalidad = 'Colombiana';
  final String nacimiento = 'Marzo 25';
  final String paisResidencia = 'Colombia';
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: const Text('Tarjeta y Formulario'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StrongTextWidget(label: 'Nombre'),
                    Obx(() => Text(homeController.nameRx.value)),
                    const StrongTextWidget(label: 'Edad'),
                    Obx(() => Text(homeController.ageRx.value.toString())),
                    const StrongTextWidget(label: 'Nacionalidad'),
                    Obx(() => Text(homeController.nationalityRx.value)),
                    const StrongTextWidget(label: 'Fecha de nacimiento'),
                    Obx(() => Text(homeController.birthdateRx.value)),
                    const StrongTextWidget(label: 'País de residencia'),
                    Obx(() => Text(homeController.residenceCountryRx.value)),
                  ],
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/Homero.png'),
                ),
              ],
            ),
            const SizedBox(height: 35),
            CustomButton(
              onPressed: () {
                homeController.changeInformation();
              },
              label: 'Colocar info en mayúscula',
            ),
            CustomButton(
              onPressed: () {
                homeController.changeInformationBack();
              },
              label: 'Capitalizar información',
            ),
          ],
        ),
      ),
    );
  }
}
