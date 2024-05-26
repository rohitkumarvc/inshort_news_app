import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/article_page/articlePage.dart';
import 'package:news_app/pages/homepage/homePage.dart';
import 'package:news_app/pages/settings/setting_page.dart';

class BottomNavigationController extends GetxController{
  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    ArticalPage(),
    SettingPage(),
  ];
}

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}