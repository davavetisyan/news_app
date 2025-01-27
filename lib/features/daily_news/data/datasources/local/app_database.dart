import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/data/datasources/local/DAO/article_dao.dart';
import 'package:news_app/features/daily_news/data/model/article_model.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
