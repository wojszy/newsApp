import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    NewsForCategoryClass newsClass = NewsForCategoryClass();
    await newsClass.getNewsCategory(widget.category);

    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
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
      body: _loading
          ? Center(
              child: SingleChildScrollView(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : Container(
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
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, blogUrl;
  final article;
  BlogTile({required this.imageUrl, required this.title, required this.desc, required this.blogUrl, required this.article});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: blogUrl,
                      article: article,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(imageUrl)),
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(desc,
                style: TextStyle(
                  color: Colors.black54,
                ))
          ],
        ),
      ),
    );
  }
}
