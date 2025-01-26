import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

initDependencies() {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(
    NewsApiService(
      sl<Dio>(),
    ),
  );

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(
      sl<NewsApiService>(),
    ),
  );

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl<ArticleRepository>()),
  );

  sl.registerSingleton<RemoteArticleBloc>(
    RemoteArticleBloc (sl<GetArticleUseCase>()),
  );
}
