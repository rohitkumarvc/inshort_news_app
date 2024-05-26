import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/config/theme.dart';

class ThemeController extends GetxController{

  Rx<ThemeData> currentTheme = lightTheme.obs;

  void changeTheme()
  {
    if(currentTheme.value == lightTheme)
    {
      currentTheme.value = darkTheme;
      GetStorage().write('currentThene', 'dark');
    }
    else
    {
      currentTheme.value = lightTheme;
      GetStorage().write('currentThene', 'light');
    }
  }
}