import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/settings_controller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () => SwitchListTile(
                  value: controller.isDarkThemeEnabled.value,
                  title: Row(
                    children: [
                      const Icon(
                        Icons.dark_mode,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('Enable Dark Theme',
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  onChanged: (value) {
                    controller.changeTheme();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
