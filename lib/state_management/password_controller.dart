import 'package:get/get.dart';

class PasswordController extends GetxController {
  bool isPassword = true;

  void visibilityPassword() {
    isPassword = !isPassword;
    update();
  }
}
