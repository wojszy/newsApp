import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/home.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'helper/favorite_list.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDocumentDir.path).then((_) {
    Hive.registerAdapter(ArticleModelAdapter());
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteListModel(),
      child: MaterialApp(
          //debugShowCheckedModeBanner: false,
          title: 'App News',
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          home: Home()),
    );
  }
}
