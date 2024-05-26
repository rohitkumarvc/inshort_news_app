import 'package:get/get.dart';
import 'package:news_app/controllers/theme_controller.dart';

class SettingController extends GetxController {
  ThemeController controller = Get.put(ThemeController());
  RxBool isDarkThemeEnabled = false.obs;

  void changeTheme() {
    isDarkThemeEnabled.value = !isDarkThemeEnabled.value; 
    controller.changeTheme();
  }
}
