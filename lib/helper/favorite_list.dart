import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:news_app/models/article_model.dart';

class FavoriteListModel extends ChangeNotifier {
  List articleList = [];
  List articleListhelper = [];
  Future getArticleList() async {
    final Box box = await Hive.openBox<ArticleModel>('article');
    articleListhelper = box.values.toList().cast<ArticleModel>();
    articleList = articleListhelper.toSet().toList();

    notifyListeners();
  }

  void addFavoriteToList(ArticleModel article) async {
    getArticleList();
    final Box box = await Hive.openBox<ArticleModel>('article');
    if (articleList.contains(article)) {
      return null;
    } else {
      box.add(article);
      notifyListeners();
    }
  }

  void removeArticle(int index) async {
    final Box box = await Hive.openBox<ArticleModel>('article');
    articleList.removeAt(index);
    box.deleteAt(index);
    notifyListeners();
  }
}
