import 'package:state_form/form/form.dart';
import 'package:flutter/material.dart';
import 'stateless.dart';

import '../widgets/custom_button.dart';

class WidgetWithState extends StatefulWidget {
  const WidgetWithState({super.key});

  @override
  State<WidgetWithState> createState() => _WidgetWithStateState();
}

class _WidgetWithStateState extends State<WidgetWithState> {
  String name = 'Daniel Vargas';
  int age = 21;
  String nacionalidad = 'Colombiana';
  String nacimiento = 'Marzo 25';
  String paisResidencia = 'Colombia';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: const Text('Tarjeta y Formulario'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.add),
          ),
        ],
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
                    Text(name),
                    const StrongTextWidget(label: 'Edad'),
                    Text('$age'),
                    const StrongTextWidget(label: 'Nacionalidad'),
                    Text(nacionalidad),
                    const StrongTextWidget(label: 'Fecha de nacimiento'),
                    Text(nacimiento),
                    const StrongTextWidget(label: 'País de residencia'),
                    Text(paisResidencia),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormExample()),
                );
              },
              label: 'Ir al formulario',
            ),
          ],
        ),
      ),
    );
  }
}
