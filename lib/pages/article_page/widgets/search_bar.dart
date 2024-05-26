import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/newsController.dart';

class MySearchBar extends StatelessWidget {
  MySearchBar({super.key});
  @override
  
  NewsController controller = Get.put(NewsController());
  final TextEditingController textController = TextEditingController();

  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          suffixIcon: InkWell(
            onTap: (){
              controller.searchNews(textController.text);
            },
            child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.search, size: 30),
            ),
          ),
          hintText: 'Search'),
    );
  }
}
