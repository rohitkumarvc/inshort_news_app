import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/controllers/newsController.dart';

class ArticleDetail extends StatelessWidget {
  final NewsModel news;
  ArticleDetail({super.key, required this.news});

  String? _speaker;

  // void shareArticle(String url) async {
  //   await ;
  // }

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    InkWell(
                      onTap: () {
                        Share.share(
                            'Checkout this interesing article ${news.url}');
                      },
                      child: Icon(Icons.share),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  height: 320,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      news.urlToImage ??
                          'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          news.title!,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(news.publishedAt ?? '2 Hours ago',
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          radius: 15,
                        ),
                        const SizedBox(width: 4),
                        Text(news.author ?? 'Unknown')
                      ],
                    ),
                    Container(
                      height: 55,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                               controller.playPause(
                                headline: news.title ?? 'No Heading',
                                body: news.content ?? 'Empty',
                                speaker: _speaker,
                              );
                            },
                            child: Obx(() => Row(
                                  children: [
                                    Icon(
                                      controller.isPlaying.value
                                          ? Icons.pause
                                          : Icons.play_arrow_rounded,
                                      size: 35,
                                    ),
                                    controller.isPlaying.value
                                        ? const Text('Pause')
                                        : const Text('Listen to the News')
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 200,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              items: const [
                                DropdownMenuItem(
                                  value: 'Alice',
                                  child: Text('Alice'),
                                ),
                              ],
                              onChanged: (value) {
                                _speaker = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Text(
                      news.content ?? 'Empty',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
