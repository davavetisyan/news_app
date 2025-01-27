import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/daily_news/data/datasources/local/app_database.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

initDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(
    NewsApiService(
      sl<Dio>(),
    ),
  );

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(
      sl<NewsApiService>(),
      sl<AppDatabase>(),
    ),
  );

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl<ArticleRepository>()),
  );

  sl.registerSingleton<RemoteArticleBloc>(
    RemoteArticleBloc(sl<GetArticleUseCase>()),
  );

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
