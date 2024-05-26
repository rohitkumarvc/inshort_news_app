import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/pages/article_details/article_details.dart';
import 'package:news_app/pages/homepage/widgets/news_tile.dart';

class AllArticles extends StatelessWidget {
  final List<NewsModel> articles;

  const AllArticles({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    Text(
                      'Back',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return NewsTile(
                      image: articles[index].urlToImage ??
                          'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                      text: articles[index].title!,
                      author: articles[index].author ?? 'unknown',
                      timeline: articles[index].publishedAt ?? 'unknown',
                      onTap: () {
                        Get.to(
                          ArticleDetail(news: articles[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
