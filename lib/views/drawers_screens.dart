import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:expandable/expandable.dart';
import 'CategoryNews.dart';

class FirstRoute extends StatefulWidget {
  const FirstRoute({key});
  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  List<ArticleModel> articles = <ArticleModel>[];

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
      body: ListView(
        children: [
          SizedBox(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Jaki artykuł chcesz wyszukać?',
              ),
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
            ),
          ),
          Row(
            children: [
              TextButton(
                child: Text('Wyszukaj'),
                onPressed: () {
                  getNewsDesc();
                },
              ),
              TextButton(
                child: Text('Wyczyść'),
                onPressed: () {
                  searchController.text = '';
                  search = '';
                  getNewsDesc();
                },
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (content, index) {
                  return BlogTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                    blogUrl: articles[index].articleUrl,
                    article: articles[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({key});

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
      body: Center(
        child: Text.rich(TextSpan(children: <TextSpan>[
          TextSpan(
            text: 'Aplikacja z newsami ver: 1.0\n\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ('Autor: \n'),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ('Wojciech Szymański'),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ])),
      ),
    );
  }
}
