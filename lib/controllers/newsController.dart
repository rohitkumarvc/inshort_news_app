import 'dart:async';
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_model.dart';

class NewsController extends GetxController {
  void onInit() async {
    getTrendingNews();
    getNews();
    getSportsNews();
    super.onInit();
  }

  RxList<NewsModel> trendingNews = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> sportsNews = <NewsModel>[].obs;
  RxList<NewsModel> articlepageNews = <NewsModel>[].obs;

  RxBool isTrendingNewsLoading = true.obs;
  RxBool isAllNewsLoading = true.obs;
  RxBool isSportsNewsLoading = true.obs;
  RxBool isArticlePageLoading = false.obs;
  RxBool isPlaying = false.obs;

  FlutterTts flutterTts = FlutterTts();

  Future<void> getTrendingNews() async {
    var baseUrl =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=b30583fd06b84c659000526a01b0cfae';

    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        final article = body['articles'];

        for (final news in article) {
          trendingNews.add(NewsModel.fromJson(news));
        }
        articlepageNews = trendingNews;
        articlepageNews.shuffle();
        
        isTrendingNewsLoading.value = false;
      } else {
        print('Somthing went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getNews() async {
    var baseUrl =
        'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=b30583fd06b84c659000526a01b0cfae';

    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        final article = body['articles'];

        for (final news in article) {
          newsForYou.add(NewsModel.fromJson(news));
        }

        int maxVal = newsForYou.length >= 5 ? 5 : newsForYou.length;
        newsForYouList.value = newsForYou.sublist(0, maxVal);

        isAllNewsLoading.value = false;
      } else {
        print('Somthing went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSportsNews() async {
    var baseUrl =
        'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=b30583fd06b84c659000526a01b0cfae';

    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        final article = body['articles'];

        for (final news in article) {
          sportsNews.add(NewsModel.fromJson(news));
        }

        isSportsNewsLoading.value = false;
      } else {
        print('Somthing went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchNews(String keyword) async {
    articlepageNews = <NewsModel>[].obs;
    isArticlePageLoading.value = true;
    var baseUrl =
        'https://newsapi.org/v2/everything?q=${keyword}&language=en&apiKey=b30583fd06b84c659000526a01b0cfae';

    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        final article = body['articles'];

        for (final news in article) {
          articlepageNews.add(NewsModel.fromJson(news));
        }

        isArticlePageLoading.value = false;
      } else {
        print('Somthing went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  final Map<String, Map> voices = {
    'Radhika': {"name": "en-AU-language", "locale": "en-AU"},
  };

  Future<void> playPause(
      {required String headline, required String body, String? speaker}) async {
    if (isPlaying.value) {
      stop();
      isPlaying.value = false;
    } else {
      isPlaying.value = true;

      String text = '$headline. Description: $body';
      speak(text).then((value){
        isPlaying.value = false;
        print('Completed');
      });
    }
  }

  Future<void> speak(String text) async {
    flutterTts.awaitSpeakCompletion(true);
    flutterTts
        .speak(
      text,
    );
  }

  void stop() {
    flutterTts.stop();
    print('Stopped Speaking');
  }
}
