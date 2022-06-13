import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=pl&category=general&apiKey=e1c1d4046cac4a18a7d3a8dce7dbb7ba";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            // author: element['author'],
            description: element['description'],
            articleUrl: element["url"],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            isFavorite: false,
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class NewsForCategoryClass {
  List<ArticleModel> news = [];

  Future<void> getNewsCategory(String category) async {
    //String url = "https://newsapi.org/v2/top-headlines?country=pl&category=general&apiKey=e1c1d4046cac4a18a7d3a8dce7dbb7ba";
    String url = "https://newsapi.org/v2/top-headlines?country=pl&category=$category&apiKey=e1c1d4046cac4a18a7d3a8dce7dbb7ba";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            // author: element['author'],
            description: element['description'],
            articleUrl: element["url"],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            isFavorite: false,
          );

          news.add(articleModel);
        }
      });
    }
  }

  Future<void> getNewsDesc(String keyword) async {
    //String url = "https://newsapi.org/v2/top-headlines?country=pl&category=general&apiKey=e1c1d4046cac4a18a7d3a8dce7dbb7ba";
    String url = "https://newsapi.org/v2/everything?q=$keyword&apiKey=e1c1d4046cac4a18a7d3a8dce7dbb7ba";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            // author: element['author'],
            description: element['description'],
            articleUrl: element["url"],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            isFavorite: false,
          );

          news.add(articleModel);
        }
      });
    }
  }
}
