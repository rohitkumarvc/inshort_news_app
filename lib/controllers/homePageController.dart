import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/myBottomNavigationBar.dart';
import 'package:news_app/controllers/bottomNavigationController.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationController controller =
        Get.put(BottomNavigationController());
    return Scaffold(
      floatingActionButton: const MyBottomNavigationBar(),
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
    );
  }
}
