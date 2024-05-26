import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/repository/authentication_respository.dart';

class LoginController extends GetxController{
  final email = TextEditingController();
  final password = TextEditingController();

  RxBool showPassword = false.obs;

  void showHidePassword()
  {
    showPassword.value = !showPassword.value;
  }

  void login(String email, String password) {
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
}