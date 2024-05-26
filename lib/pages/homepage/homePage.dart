import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/article_details/article_details.dart';
import 'package:news_app/pages/article_page/all_articles.dart';
import 'package:news_app/pages/homepage/widgets/news_tile.dart';
import 'package:news_app/pages/homepage/widgets/trending_card.dart';
import 'package:news_app/controllers/newsController.dart';
import 'package:news_app/repository/authentication_respository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'in',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              'Short',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        leading: const Row(
          children: [
            SizedBox(
              width: 4,
            ),
            CircleAvatar(
              radius: 24,
              child: Icon(
                Icons.dashboard,
                size: 24,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () async {
                  await AuthenticationRepository.instance.logout();
                },
                child: const CircleAvatar(
                  radius: 24,
                  child: Icon(
                    Icons.logout_outlined,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          ),
        ],
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Now',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AllArticles(articles: controller.trendingNews));
                    },
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => controller.isTrendingNewsLoading.value
                      ? const CircularProgressIndicator()
                      : Row(
                          children: controller.trendingNews
                              .map(
                                (element) => TrendingCard(
                                  tag: 'Trending Now',
                                  timeline: element.publishedAt!,
                                  heading: element.title!,
                                  author: element.author ?? 'UnKnown',
                                  image: element.urlToImage ??
                                      'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                                  onTap: () {
                                    Get.to(ArticleDetail(
                                      news: element,
                                    ));
                                  },
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Special for you',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AllArticles(articles: controller.newsForYou));
                    },
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              Obx(
                () => controller.isAllNewsLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                        children: controller.newsForYouList
                            .map(
                              (element) => NewsTile(
                                  onTap: () {
                                    Get.to(
                                      ArticleDetail(news: element),
                                    );
                                  },
                                  image: element.urlToImage ??
                                      'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                                  text: element.title!,
                                  author: element.author ?? 'Unknown',
                                  timeline:
                                      element.publishedAt ?? 'Few days ago'),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest in Sports',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AllArticles(articles: controller.sportsNews));
                    },
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => controller.isSportsNewsLoading.value
                      ? CircularProgressIndicator()
                      : Row(
                          children: controller.sportsNews
                              .map(
                                (element) => TrendingCard(
                                  tag: 'Sports',
                                  timeline: element.publishedAt!,
                                  heading: element.title!,
                                  author: element.author ?? 'UnKnown',
                                  image: element.urlToImage ??
                                      'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                                  onTap: () {
                                    Get.to(ArticleDetail(
                                      news: element,
                                    ));
                                  },
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
