import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/CategoryNews.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/category_view.dart';
import 'package:news_app/views/faq_view.dart';
import 'package:news_app/views/favorite.dart';

import 'drawers_screens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    _loading = true;

    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();

    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            SizedBox(
              height: 100,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  ('Menu'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: const Text(('Wyszukaj artykuły'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstRoute()),
                );
              },
            ),
            ListTile(
              title: const Text(('Ulubione'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favorite()),
                );
              },
            ),
            ListTile(
              title: const Text(('O aplikacji'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
            ),
            ListTile(
              title: const Text(('FAQ'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQ()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black45),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("News", style: TextStyle(color: Colors.blue)), Text("App", style: TextStyle(color: Colors.black))],
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstRoute()),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                child: Column(children: <Widget>[
                  //Categories
                  Container(
                    height: 70,
                    child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        }),
                  ),

                  ///blogs
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
                ]),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({required this.imageUrl, required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(category: categoryName.toLowerCase())));
      },
      child: Container(
          margin: EdgeInsets.only(right: 16),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                color: Colors.black38,
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, blogUrl;
  final article;
  BlogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.blogUrl,
    required this.article,
  });
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
