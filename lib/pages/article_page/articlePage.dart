import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/myBottomNavigationBar.dart';
import 'package:news_app/controllers/newsController.dart';
import 'package:news_app/pages/article_details/article_details.dart';
import 'package:news_app/pages/article_page/widgets/search_bar.dart';
import 'package:news_app/pages/homepage/widgets/news_tile.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              MySearchBar(),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                  child: Obx(
                () => controller.isArticlePageLoading.value? const Center(child: CircularProgressIndicator()) : ListView.builder(
                  itemCount: controller.articlepageNews.length,
                  itemBuilder: (context, index) {
                    return NewsTile(
                      image: controller.articlepageNews[index].urlToImage ?? 'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                      text: controller.articlepageNews[index].title!,
                      author:
                          controller.articlepageNews[index].author ?? 'unknown',
                      timeline: controller.articlepageNews[index].publishedAt ??
                          'unknown',
                      onTap: () {
                        Get.to(
                          ArticleDetail(
                              news: controller.articlepageNews[index]),
                        );
                      },
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
