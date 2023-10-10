import 'package:basic_utils/basic_utils.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final nameRx = 'Daniel Vargas'.obs;
  final ageRx = RxInt(21);
  final nationalityRx = RxString('Colombiana');
  final birthdateRx = RxString('Marzo 25');
  final residenceCountryRx = RxString('Colombia');

  void changeInformation() {
    nameRx.value = nameRx.toUpperCase();
    ageRx.value = 21;
    nationalityRx.value = nationalityRx.toUpperCase();
    birthdateRx.value = birthdateRx.toUpperCase();
    residenceCountryRx.value = residenceCountryRx.toUpperCase();
  }

  void changeInformationBack() {
    List<String> palabras = nameRx.value.split(' ');
    String resultado = palabras.map((palabra) {
      return StringUtils.capitalize(palabra);
    }).join(' ');
    nameRx.value = resultado;
    ageRx.value = 21;
    nationalityRx.value = StringUtils.capitalize(nationalityRx.value);
    birthdateRx.value = StringUtils.capitalize(birthdateRx.value);
    residenceCountryRx.value = StringUtils.capitalize(residenceCountryRx.value);
  }
}
