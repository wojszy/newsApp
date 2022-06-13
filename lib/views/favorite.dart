import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/favorite_list.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:provider/provider.dart';

import 'CategoryNews.dart';

class Favorite extends StatefulWidget {
  const Favorite({key});
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  var articles;

  bool _loading = true;
  String search = '';
  final searchController = TextEditingController();
  getNewsDesc() async {
    NewsForCategoryClass newsClass = NewsForCategoryClass();
    await newsClass.getNewsDesc(search);

    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    articles = Provider.of<FavoriteListModel>(context, listen: false).getArticleList();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black45),
        title: Container(
          margin: EdgeInsets.only(right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("News", style: TextStyle(color: Colors.blue)), Text("App", style: TextStyle(color: Colors.black))],
          ),
        ),
        actions: <Widget>[Container(padding: EdgeInsets.symmetric(horizontal: 16))],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Consumer<FavoriteListModel>(builder: (context, FavoriteListModel, child) {
        return Container(
          padding: EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: FavoriteListModel.articleList.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (content, index) {
                return Stack(children: [
                  BlogTile(
                    imageUrl: FavoriteListModel.articleList[index].urlToImage,
                    title: FavoriteListModel.articleList[index].title,
                    desc: FavoriteListModel.articleList[index].description,
                    blogUrl: FavoriteListModel.articleList[index].articleUrl,
                    article: FavoriteListModel.articleList[index],
                  ),
                  InkWell(child: Icon(Icons.remove, color: Colors.amber, size: 50), onTap: () => FavoriteListModel.removeArticle(index)),
                ]);
              }),
        );
      }),
    );
  }
}
