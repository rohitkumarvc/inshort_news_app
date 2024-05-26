import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/theme_controller.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/controllers/homePageController.dart';
import 'package:news_app/repository/authentication_respository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: controller.currentTheme.value,
        home: const HomePageController(),
      ),
    );
  }
}
