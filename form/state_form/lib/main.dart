import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'files/stateful.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const WidgetWithState(),
    );
  }
}
