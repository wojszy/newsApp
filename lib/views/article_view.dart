import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/helper/favorite_list.dart';
import 'package:news_app/views/favorite.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hive/hive.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  final article;

  ArticleView({required this.blogUrl, required this.article});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  static const snackBarErr = SnackBar(
    content: Text('Wystąpił błąd podczas dodawania'),
  );
  static const snackBar = SnackBar(
    content: Text('Dodano do ulubionych'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black45),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
            Text("App", style: TextStyle(color: Colors.black))
          ],
        ),
        actions: <Widget>[
          Container(padding: EdgeInsets.symmetric(horizontal: 16)),
          IconButton(
            onPressed: () {
              Provider.of<FavoriteListModel>(context, listen: false).addFavoriteToList(widget.article);
              if (Provider.of<FavoriteListModel>(context, listen: false).articleList.contains(widget.article)) {
                ScaffoldMessenger.of(context).showSnackBar(snackBarErr);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            icon: const Icon(Icons.add),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.blogUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _completer.complete(webViewController);
            },
          )),
    );
  }
}
