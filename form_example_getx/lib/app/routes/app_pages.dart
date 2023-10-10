import 'package:form_example_getx/app/modules/home/bindings/home_binding.dart';
import 'package:form_example_getx/app/modules/home/views/home_view.dart';
import 'package:form_example_getx/app/modules/login/bindings/login_binding.dart';
import 'package:form_example_getx/app/modules/login/views/login_view.dart';
import 'package:form_example_getx/app/modules/register/bindings/register_binding.dart';
import 'package:form_example_getx/app/modules/register/views/register_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
