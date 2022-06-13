import 'package:hive/hive.dart';
part 'article_model.g.dart';

@HiveType(typeId: 0)
class ArticleModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String articleUrl;
  @HiveField(3)
  String urlToImage;
  @HiveField(4)
  DateTime publishedAt;
  @HiveField(5)
  String content;
  @HiveField(6)
  bool isFavorite;
  ArticleModel({
    required this.title,
    required this.description,
    required this.articleUrl,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.isFavorite,
  });
}
