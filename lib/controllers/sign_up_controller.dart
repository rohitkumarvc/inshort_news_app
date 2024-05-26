import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/repository/authentication_respository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  RxBool showPassword = false.obs;

  void showHidePassword()
  {
    showPassword.value = !showPassword.value;
  }

  void registerUser(String email, String password)
  {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  void phoneAuthentication(String phoneNumber)
  {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }
}