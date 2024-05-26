import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottomNavigationController.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationController controller =
        Get.put(BottomNavigationController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: 60,
          width: 200,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.index.value = 0;
                },
                child: Obx(
                  () => CircleAvatar(
                    backgroundColor: controller.index.value == 0
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    child: Icon(
                      Icons.home,
                      size: 32,
                      color: controller.index.value == 0
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.index.value = 1;
                },
                child: Obx(
                  () => CircleAvatar(
                    backgroundColor: controller.index.value == 1
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    child: Icon(
                      Icons.search,
                      size: 32,
                      color: controller.index.value == 1
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.index.value = 2;
                },
                child: Obx(
                  () => CircleAvatar(
                    backgroundColor: controller.index.value == 2
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    child: Icon(
                      Icons.settings,
                      size: 32,
                      color: controller.index.value == 2
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
